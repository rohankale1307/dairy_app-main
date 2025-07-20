import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import '../common/Widgets/collection_card_widget.dart';
import '../common/Widgets/default_appbar.dart';
import '../common/model/dairy_app_model.dart';
import '../utils/utils_file.dart';
import 'add_new_collection.dart';
import 'api/milk_collection_api.dart';
import 'store/milk_collection_store.dart';

class MilkCollectionScreen extends StatefulWidget {
  const MilkCollectionScreen({super.key});

  @override
  State<MilkCollectionScreen> createState() => _MilkCollectionScreenState();
}

class _MilkCollectionScreenState extends State<MilkCollectionScreen> {
  late MilkCollectionStore _milkCollectionStore;
  late MilkCollectionApi milkCollectionApi;
  @override
  void didChangeDependencies() {
    _milkCollectionStore = MilkCollectionStore();
    milkCollectionApi = MilkCollectionApi();
    WidgetsBinding.instance.addPostFrameCallback((_) => getMilkCollection());

    super.didChangeDependencies();
  }

  getMilkCollection() {
    UtilsFile.showLoadingDialog(context);
    _milkCollectionStore
        .getMilkCollectionData(api: milkCollectionApi)
        .then((value) {
      Navigator.of(context).pop();
      _milkCollectionStore.getMilkCollection = value;
      print(value);
    }).onError((error, stacktrace) {
      print(stacktrace);
      Navigator.of(context).pop();
      UtilsFile.showErrorDialog(context, 'Ooops', error.toString(), 'Okay', () {
        Navigator.of(context).pop();
      });
    });
  }

  List<MilkData> milkData = [
    MilkData(
      type: 'cow',
      amount: 8500,
      liter: 250,
    ),
    MilkData(
      type: 'Buffalo',
      amount: 0,
      liter: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int totalLiters = milkData.fold(0, (sum, item) => sum + item.liter);
    int totalAmount = milkData.fold(0, (sum, item) => sum + item.amount);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Collections',
          context: context,
          isShowDatePicker: true,
          isShowSearchIcon: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromRGBO(229, 240, 252, 1),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '10 Jan 2025 to 20 Jan 2025',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Table(
                  border: const TableBorder(
                    top: BorderSide(color: Colors.black, width: 1),
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: IntrinsicColumnWidth(flex: 2),
                    2: IntrinsicColumnWidth(),
                  },
                  children: [
                    DefaultAppbar.buildRow(['Milk', 'Liter', 'Amount'],
                        isHeader: true),
                    ...milkData
                        .map((data) => DefaultAppbar.buildRow([
                              data.type,
                              data.liter.toString(),
                              '₹ ${data.amount}'
                            ], isDisabled: true))
                        .toList(),
                    DefaultAppbar.buildRow(
                        ['Total', totalLiters.toString(), '₹ $totalAmount'],
                        isTotal: true),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _milkCollectionStore.getMilkCollection?.body?.length,
                itemBuilder: (context, index) {
                  // final rate = collectionCardList[index].rate;
                  // final liter = collectionCardList[index].liter;

                  // final double amount = rate! * liter!;

                  // final currentIndexDateStr =
                  //     collectionCardList.elementAt(index).dateTime ?? '';

                  // final previousIndexDateStr = collectionCardList
                  //         .elementAt(index == 0 ? index : index - 1)
                  //         .dateTime ??
                  //     '';

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          color: const Color.fromRGBO(239, 249, 252, 1),
                          child: Text(
                            _milkCollectionStore.getMilkCollection?.body?[index]
                                    .labelName ??
                                '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AddNewCollectionScreen(
                                isEdit: true,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          child: CollectionCardWidget(
                            dateTime: '10 July 2025',
                            id: _milkCollectionStore.getMilkCollection
                                ?.body?[index].collections?[index].customerCode,
                            name: _milkCollectionStore.getMilkCollection
                                ?.body?[index].collections?[index].customerName,
                            milkType: _milkCollectionStore.getMilkCollection
                                ?.body?[index].collections?[index].milkType,
                            buildInfoColumn: [
                              BuildInfoColumn(
                                  label: 'Fat',
                                  value: _milkCollectionStore
                                          .getMilkCollection
                                          ?.body?[index]
                                          .collections?[index]
                                          .collectionFat ??
                                      ''),
                              BuildInfoColumn(
                                  label: 'SNF',
                                  value: _milkCollectionStore
                                          .getMilkCollection
                                          ?.body?[index]
                                          .collections?[index]
                                          .collectionSnf ??
                                      ''),
                              BuildInfoColumn(
                                  label: 'Rate',
                                  value:
                                      '₹ ${_milkCollectionStore.getMilkCollection?.body?[index].collections?[index].collectionRate ?? ''}'),
                              BuildInfoColumn(
                                  label: 'Liter',
                                  value: _milkCollectionStore
                                          .getMilkCollection
                                          ?.body?[index]
                                          .collections?[index]
                                          .collectionLtr ??
                                      ''),
                              BuildInfoColumn(
                                  label: 'Amount',
                                  value:
                                      '₹ ${_milkCollectionStore.getMilkCollection?.body?[index].collections?[index].collectionAmt ?? ''}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Buttons.addCollectionButton(
          title: 'New Collections',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewCollectionScreen(
                  isEdit: false,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String showDateLabel(String currentIndexDateStr) {
    final collectionDateTime =
        DateTime.parse(currentIndexDateStr.split('/').reversed.join());
    final dateDifference = DateTime.now().difference(collectionDateTime);
    if (dateDifference.inHours < 24) {
      return 'Today';
    } else if (dateDifference.inHours < 48) {
      return 'Yesterday';
    } else {
      final formattedDate =
          '${collectionDateTime.day} ${getMonthName(collectionDateTime.month)} ${collectionDateTime.year}';
      return formattedDate;
    }
  }

  getMonthName(int month) {
    switch (month) {
      case 0:
        return 'January';
      case 1:
        return 'Febuary';
      case 2:
        return 'March';
      case 3:
        return 'April';
      case 4:
        return 'May';
      case 5:
        return 'June';
      case 6:
        return 'July';
      case 7:
        return 'August';
      case 8:
        return 'September';
      case 9:
        return 'Octomber';
      case 10:
        return 'November';
      case 11:
        return 'December';
      default:
        return '$month';
    }
  }
}

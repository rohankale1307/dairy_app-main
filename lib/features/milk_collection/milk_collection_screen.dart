import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import '../common/Widgets/collection_card_widget.dart';
import '../common/Widgets/default_appbar.dart';
import '../common/model/dairy_app_model.dart';
import 'add_new_collection.dart';

class MilkCollectionScreen extends StatefulWidget {
  const MilkCollectionScreen({super.key});

  @override
  State<MilkCollectionScreen> createState() => _MilkCollectionScreenState();
}

class _MilkCollectionScreenState extends State<MilkCollectionScreen> {
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
  Map<String, List<Map>> groupedData = {};
  List<String> dateList = [];

  List<CollectionCardData> collectionCardList = [
    // CollectionCardData(
    //   id: 125,
    //   name: 'Suraj Chavan',
    //   fat: 3.5,
    //   snf: 8.5,
    //   rate: 34.50,
    //   liter: 5.5,
    //   amount: 250,
    //   dateTime: '14/04/2025',
    //   milkType: 'Cow',
    // ),
    // CollectionCardData(
    //   id: 125,
    //   name: 'Pramod Chavan',
    //   fat: 3.5,
    //   snf: 8.5,
    //   rate: 34.50,
    //   liter: 5.5,
    //   amount: 250,
    //   dateTime: '14/04/2025',
    //   milkType: 'Cow',
    // ),
    // CollectionCardData(
    //   id: 125,
    //   name: 'Rohan Kale',
    //   fat: 3.5,
    //   snf: 8.5,
    //   rate: 34.50,
    //   liter: 5.5,
    //   amount: 250,
    //   dateTime: '13/04/2025',
    //   milkType: 'Cow',
    // ),
    // CollectionCardData(
    //   id: 125,
    //   name: 'Akshay Chavan',
    //   fat: 3.5,
    //   snf: 8.5,
    //   rate: 34.50,
    //   liter: 5.5,
    //   amount: 250,
    //   dateTime: '13/04/2025',
    //   milkType: 'Cow',
    // ),
    // CollectionCardData(
    //   id: 125,
    //   name: 'Kapil Chavan',
    //   fat: 3.5,
    //   snf: 8.5,
    //   rate: 34.50,
    //   liter: 5.5,
    //   amount: 250,
    //   dateTime: '12/04/2025',
    //   milkType: 'Cow',
    // ),
    // CollectionCardData(
    //   id: 125,
    //   name: 'Kapil Chavan',
    //   fat: 3.5,
    //   snf: 8.5,
    //   rate: 34.50,
    //   liter: 5.5,
    //   amount: 250,
    //   dateTime: '11/04/2025',
    //   milkType: 'Cow',
    // ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/7058426247/milkSales");

      ref.once().then((event) {
        final data = event.snapshot.value;

        if (data == null) {
          print("No sales found for this user");
          return;
        }

        if (data is Map) {
          data.forEach((saleId, saleData) {
            if (saleData is Map && saleData.containsKey("date")) {
              String date = saleData["date"];
              groupedData.putIfAbsent(date, () => []);
              groupedData[date]!.add(Map<String, dynamic>.from(saleData));
            }
          });

          // Example print
          groupedData.forEach((date, records) {
            print("Date: $date");
            for (var record in records) {
              print('REC $record');
              print(" -> ${record['name']} - ${record['liter']} liters");
              try {
                collectionCardList.add(
                  CollectionCardData(
                    id: int.parse('${record['code']}'),
                    name: record['name'],
                    fat: double.tryParse('${record['fat']}'),
                    snf: double.tryParse('${record['snf']}'),
                    rate: double.tryParse('${record['rate']}'),
                    liter: double.tryParse('${record['liter']}'),
                    amount: double.tryParse('${record['amount']}'),
                    dateTime: '${record['date']}'.replaceAll('-', '/'),
                    milkType: record['animalType'],
                  ),
                );
              } catch (e, st) {
                print('EX :$e :: $st');
              }
            }
          });
          dateList = groupedData.keys.toList();
          print(':::::::::::####### ${dateList}');
          print(':::::::::::####### ${groupedData}');
          dateList.sort();
          setState(() {});
        } else {
          print("Unexpected format");
        }
      }).catchError((error) {
        print("Fetch error: $error");
      });
    });
    super.initState();
  }

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
                itemCount: dateList.length,
                itemBuilder: (context, index) {
                 

                  final rate = collectionCardList[index].rate;
                  final liter = collectionCardList[index].liter;

                  final double amount = rate! * liter!;

                  
                  final currentIndexDateStr =
                      collectionCardList.elementAt(index).dateTime ?? '';

                  final previousIndexDateStr = collectionCardList
                          .elementAt(index == 0 ? index : index - 1)
                          .dateTime ??
                      '';

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (index == 0 ||
                          currentIndexDateStr != previousIndexDateStr)
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Container(
                            padding: const EdgeInsetsDirectional.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            color: const Color.fromRGBO(239, 249, 252, 1),
                            child: Text(
                              showDateLabel(currentIndexDateStr),
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
                            collectionCardData: collectionCardList,
                            index: index,
                            buildInfoColumn: [
                             
                              BuildInfoColumn(
                                  label: 'Fat',
                                  value:
                                      collectionCardList[index].snf.toString()),
                              BuildInfoColumn(
                                  label: 'SNF',
                                  value:
                                      collectionCardList[index].snf.toString()),
                              BuildInfoColumn(
                                  label: 'Rate',
                                  value: '₹ ${collectionCardList[index].rate}'),
                              BuildInfoColumn(
                                  label: 'Liter',
                                  value: collectionCardList[index]
                                      .liter
                                      .toString()),
                              BuildInfoColumn(
                                  label: 'Amount',
                                  value:
                                      '₹ $amount'),
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

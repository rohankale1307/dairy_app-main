import 'package:dairy_app/features/milk_sales_record/new_milk_sale_record.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import '../common/Widgets/collection_card_widget.dart';
import '../common/Widgets/default_appbar.dart';
import '../common/model/dairy_app_model.dart';

class MilkRecordScreen extends StatefulWidget {
  const MilkRecordScreen({super.key});

  @override
  State<MilkRecordScreen> createState() => _MilkRecordScreenState();
}

class _MilkRecordScreenState extends State<MilkRecordScreen> {
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

  List<CollectionCardData> collectionCardList = [
    CollectionCardData(
      id: 125,
      name: 'Hingani Dairy',
      fat: 3.5,
      snf: 8.5,
      rate: 34.50,
      liter: 5.5,
      amount: 250,
      dateTime: '01 Jan 2024 • Morning 09:25 AM',
      milkType: 'Cow',
    ),
    CollectionCardData(
      id: 125,
      name: 'Hingani Dairy',
      fat: 3.5,
      snf: 8.5,
      rate: 34.50,
      liter: 5.5,
      amount: 250,
      dateTime: '01 Jan 2024 • Morning 09:25 AM',
      milkType: 'Cow',
    ),
    CollectionCardData(
      id: 125,
      name: 'Hingani Dairy',
      fat: 3.5,
      snf: 8.5,
      rate: 34.50,
      liter: 5.5,
      amount: 250,
      dateTime: '01 Jan 2024 • Morning 09:25 AM',
      milkType: 'Cow',
    ),
    CollectionCardData(
      id: 125,
      name: 'Hingani Dairy',
      fat: 3.5,
      snf: 8.5,
      rate: 34.50,
      liter: 5.5,
      amount: 250,
      dateTime: '01 Jan 2024 • Morning 09:25 AM',
      milkType: 'Cow',
    ),
    CollectionCardData(
      id: 125,
      name: 'Kapil Chavan',
      fat: 3.5,
      snf: 8.5,
      rate: 34.50,
      liter: 5.5,
      amount: 250,
      dateTime: '01 Jan 2024 • Morning 09:25 AM',
      milkType: 'Cow',
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
          title: 'Milk sales records',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: collectionCardList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewMilkSaleRecordScreen(
                              isEdit: true,
                            ),
                          ),
                        );
                      },
                      child: CollectionCardWidget(
                        isMilkCollection: true,
                        collectionCardData: collectionCardList,
                        index: index,
                        buildInfoColumn: [
                          BuildInfoColumn(
                              label: 'Fat',
                              value: collectionCardList[index].fat.toString()),
                          BuildInfoColumn(
                              label: 'SNF',
                              value: collectionCardList[index].snf.toString()),
                          BuildInfoColumn(
                              label: 'Rate',
                              value: '₹ ${collectionCardList[index].rate}'),
                          BuildInfoColumn(
                              label: 'Liter',
                              value:
                                  collectionCardList[index].liter.toString()),
                          BuildInfoColumn(
                              label: 'Amount',
                              value: '₹ ${collectionCardList[index].amount}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Buttons.addCollectionButton(
          title: 'New Milk Sale',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewMilkSaleRecordScreen(
                  isEdit: false,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

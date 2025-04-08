import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import '../common/Widgets/collection_card_widget.dart';
import '../common/Widgets/date_picker.dart';
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

  List<CollectionCardData> collectionCardList = [
    CollectionCardData(
      id: 125,
      name: 'Suraj Chavan',
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
      name: 'Pramod Chavan',
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
      name: 'Rohan Kale',
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
      name: 'Akshay Chavan',
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
          title: 'Collection',
          context: context,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                ),
                child: DatePicker(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(2),
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
                            builder: (context) => const AddNewCollectionScreen(
                              isEdit: true,
                            ),
                          ),
                        );
                      },
                      child: CollectionCardWidget(
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
}

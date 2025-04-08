import 'package:dairy_app/features/common/Widgets/button_widget.dart';
import 'package:dairy_app/features/common/Widgets/date_picker.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/collection_card_widget.dart';
import '../common/model/dairy_app_model.dart';
import 'add_new_cattle_feed_sale.dart';

class CattleFieldScreen extends StatefulWidget {
  const CattleFieldScreen({super.key});

  @override
  State<CattleFieldScreen> createState() => _CattleFieldScreenState();
}

List<CattleFeedData> cattleFeedData = [
  CattleFeedData(
    feedName: 'Hindustan Cattle Feed',
    quantity: 10,
    amount: 10000,
  ),
  CattleFeedData(
    feedName: 'Amul Cattle Feed',
    quantity: 8,
    amount: 8000,
  ),
];

List<CollectionCardData> cattleFeedSalesList = [
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '01 Jan 2024 • Morning 09:25 AM',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '01 Jan 2024 • Morning 09:25 AM',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '01 Jan 2024 • Morning 09:25 AM',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '01 Jan 2024 • Morning 09:25 AM',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '01 Jan 2024 • Morning 09:25 AM',
  ),
];

class _CattleFieldScreenState extends State<CattleFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Cattle feed',
          context: context,
          bottomWidget: const TabBar(
            tabs: [
              Tab(
                text: 'Sales',
              ),
              Tab(
                text: 'Rates',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CattleFeedSales(
              cattleFeedData: cattleFeedData,
              cattleFeedSalesList: cattleFeedSalesList,
            ),
            Container(
              height: 300,
              width: 500,
              color: Colors.red,
            ),
          ],
        ),
        floatingActionButton: Buttons.addCollectionButton(
          title: 'Add Sales',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewCattleFeedSale(
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

class CattleFeedSales extends StatelessWidget {
  const CattleFeedSales({
    super.key,
    required this.cattleFeedData,
    required this.cattleFeedSalesList,
  });

  final List<CattleFeedData> cattleFeedData;
  final List<CollectionCardData> cattleFeedSalesList;

  @override
  Widget build(BuildContext context) {
    int totalQuantity =
        cattleFeedData.fold(0, (sum, item) => sum + item.quantity);
    int totalAmount = cattleFeedData.fold(0, (sum, item) => sum + item.amount);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            child: DatePicker(),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
            },
            children: [
              DefaultAppbar.buildRow(['Feed Name', 'Qty', 'Amount'],
                  isHeader: true),
              ...cattleFeedData
                  .map((data) => DefaultAppbar.buildRow([
                        data.feedName,
                        data.quantity.toString(),
                        '₹ ${data.amount}'
                      ], isDisabled: true))
                  .toList(),
              DefaultAppbar.buildRow(
                  ['Total', totalQuantity.toString(), '₹ $totalAmount'],
                  isTotal: true),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cattleFeedSalesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewCattleFeedSale(
                        isEdit: true,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CollectionCardWidget(
                    collectionCardData: cattleFeedSalesList,
                    index: index,
                    buildInfoColumn: [
                      BuildInfoColumn(
                          label: 'Qty',
                          value: cattleFeedSalesList[index].qty.toString()),
                      BuildInfoColumn(
                          label: 'Rate',
                          value: '₹ ${cattleFeedSalesList[index].rate}'),
                      BuildInfoColumn(
                          label: 'Amount',
                          value: '₹ ${cattleFeedSalesList[index].amount}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:dairy_app/features/cattle_feed/add_new_cattle_feed_sale.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/collection_card_widget.dart';
import '../common/Widgets/default_appbar.dart';
import '../common/model/dairy_app_model.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
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
            Table(
              border: const TableBorder(
                top: BorderSide(color: Colors.black, width: 1),
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
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
                vertical: 10,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cattleFeedSalesList.length,
              itemBuilder: (context, index) {
                final currentIndexDateStr =
                    cattleFeedSalesList.elementAt(index).dateTime ?? '';

                final previousIndexDateStr = cattleFeedSalesList
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
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
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
                            builder: (context) => const AddNewCattleFeedSale(
                              isEdit: true,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: CollectionCardWidget(
                          dateTime: '10 July 2025',
                          buildInfoColumn: [
                            BuildInfoColumn(
                                label: 'Qty',
                                value:
                                    cattleFeedSalesList[index].qty.toString()),
                            BuildInfoColumn(
                                label: 'Rate',
                                value: '₹ ${cattleFeedSalesList[index].rate}'),
                            BuildInfoColumn(
                                label: 'Amount',
                                value:
                                    '₹ ${cattleFeedSalesList[index].amount}'),
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

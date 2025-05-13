import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/Widgets/cattle_feed_report_widget.dart';
import '../../common/model/dairy_app_model.dart';

class CattleFeedReport extends StatelessWidget {
  const CattleFeedReport({super.key});

  @override
  Widget build(BuildContext context) {
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
      CattleFeedData(
        feedName: 'Hindustan Cattle Feed',
        quantity: 10,
        amount: 10000,
      ),
    ];

    List<String> firstColumnHeaders = [
      'Date',
      'Feed',
      'Qty',
      'Rate',
      'Amount',
    ];

    List<CattleFeedReportItem> cattleFeedReport = [
      CattleFeedReportItem(
          id: 'Buyer',
          name: 'Higani Dairy',
          cattleFeedReport: [
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
          ]),
      CattleFeedReportItem(
          id: 'Buyer',
          name: 'Higani Dairy',
          cattleFeedReport: [
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
          ]),
      CattleFeedReportItem(
          id: 'Buyer',
          name: 'Higani Dairy',
          cattleFeedReport: [
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
          ]),
      CattleFeedReportItem(
          id: 'Buyer',
          name: 'Higani Dairy',
          cattleFeedReport: [
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
            CattleFeedReportModel(
              date: '23 Jan 2024',
              feed: '10',
              qty: '82',
              rate: '25',
              amount: '22282',
            ),
          ]),
    ];

    int totalQuantity =
        cattleFeedData.fold(0, (sum, item) => sum + item.quantity);
    int totalAmount = cattleFeedData.fold(0, (sum, item) => sum + item.amount);
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Cattle Feed Report',
          context: context,
          isShowDatePicker: true,
          isShowSearchIcon: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cattleFeedReport.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CattleFeedReportWidget(
                    cattleFeedReport: cattleFeedReport,
                    firstColumnHeaders: firstColumnHeaders,
                    index: index,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

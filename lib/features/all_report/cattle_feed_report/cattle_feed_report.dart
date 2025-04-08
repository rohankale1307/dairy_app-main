import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/Widgets/cattle_feed_report_widget.dart';
import '../../common/Widgets/date_picker.dart';
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
          title: 'Cattle Feed REport',
          context: context,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: DatePicker(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 16,
                  child: SearchBar(
                    hintText: 'Search',
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(245, 245, 245, 1),
                    ),
                    trailing: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
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

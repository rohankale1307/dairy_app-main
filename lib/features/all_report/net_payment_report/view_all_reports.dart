import 'package:dairy_app/features/common/Widgets/date_picker.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/Widgets/advance_deduction_report_widget.dart';
import '../../common/Widgets/cattle_feed_report_widget.dart';
import '../../common/Widgets/milk_collection_report_widget.dart';
import '../../common/model/dairy_app_model.dart';

class ViewAllReports extends StatelessWidget {
  ViewAllReports({super.key});

  final List<String> milkReportHeaders = [
    'Date',
    'Shift',
    'Milk',
    'Liter',
    'Fat',
    'Snf',
    'Rate',
    'Amount',
  ];

  final List<String> cattleFeedHeaders = [
    'Date',
    'Feed',
    'Qty',
    'Rate',
    'Amount',
  ];

  final List<String> advAmtHeaders = [
    'Date',
    'Adv Amt',
    'Ded Amt',
  ];

  final List<NetPaymentReportItem> netPaymentReport = [
    NetPaymentReportItem(
      id: '126',
      name: 'Rohan Kale',
      milkReport: [
        MilkReport(id: '126', name: 'Rohan Kale', milkReport: [
          MilkReportModel(
            date: '23 Jan 2024',
            shift: 'Morning',
            milk: '25',
            liter: '30',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '20000',
          ),
          MilkReportModel(
            date: '24 Jan 2024',
            shift: 'Evening',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '40000',
          ),
          MilkReportModel(
            date: '25 Jan 2024',
            shift: 'Morning',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '250000',
          ),
          MilkReportModel(
            date: '26 Jan 2024',
            shift: 'Evening',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '22282',
          ),
          MilkReportModel(
            date: '27 Jan 2024',
            shift: 'Evening',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '22282',
          ),
          MilkReportModel(
            date: '28 Jan 2024',
            shift: 'Evening',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '22282',
          ),
          MilkReportModel(
            date: '29 Jan 2024',
            shift: 'Evening',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '22282',
          ),
          MilkReportModel(
            date: '30 Jan 2024',
            shift: 'Evening',
            milk: '20',
            liter: '25',
            fat: '10',
            snf: '82',
            rate: '25',
            amount: '22282',
          ),
        ])
      ],
      cattleFeedReport: [
        CattleFeedReportItem(id: '126', name: 'Rohan Kale', cattleFeedReport: [
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
        ])
      ],
      advDedAmtReport: [
        AdvAmtReportItem(
          id: '126',
          name: 'Rohan Kale',
          advAmtReportModel: [
            AdvAmtReportModel(
              date: '23 Jan 2024',
              advAmt: '20000',
              deductionAmt: '10000',
            ),
            AdvAmtReportModel(
              date: '23 Jan 2024',
              advAmt: '20000',
              deductionAmt: '10000',
            ),
            AdvAmtReportModel(
              date: '23 Jan 2024',
              advAmt: '20000',
              deductionAmt: '10000',
            ),
            AdvAmtReportModel(
              date: '23 Jan 2024',
              advAmt: '20000',
              deductionAmt: '10000',
            ),
            AdvAmtReportModel(
              date: '23 Jan 2024',
              advAmt: '20000',
              deductionAmt: '10000',
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          DefaultAppbar.defaultAppbar(title: 'All Reports', context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: DatePicker(),
            ),
            const AllReportWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: NetPaymentReportWidget(
                advAmtHeaders: advAmtHeaders,
                milkCollectionHeaders: milkReportHeaders,
                cattleFeedHeaders: cattleFeedHeaders,
                netPaymentReport: netPaymentReport,
                index: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AllReportWidget extends StatelessWidget {
  const AllReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(207, 207, 207, 1),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: const Color.fromRGBO(199, 237, 217, 1),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '126',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Rohan Kale',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      buildCardRow(
                        title: 'Total Milk Amt',
                        amount: '20000',
                      ),
                      buildCardRow(
                        title: 'Total Cattle Feed Amt',
                        amount: '20000',
                      ),
                      buildCardRow(
                        title: 'Total Deduction Amt',
                        amount: '20000',
                      ),
                      buildCardRow(
                        title: 'Total Net Payment',
                        amount: '20000',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NetPaymentReportWidget extends StatelessWidget {
  const NetPaymentReportWidget({
    super.key,
    required this.milkCollectionHeaders,
    required this.netPaymentReport,
    required this.cattleFeedHeaders,
    required this.advAmtHeaders,
    required this.index,
  });

  final List<String> milkCollectionHeaders;
  final List<NetPaymentReportItem> netPaymentReport;
  final List<String> cattleFeedHeaders;
  final List<String> advAmtHeaders;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MilkCollectionReportWidget(
          firstColumnHeaders: milkCollectionHeaders,
          index: index,
          milkReport: netPaymentReport[index].milkReport ?? [],
          isShowName: false,
        ),
        CattleFeedReportWidget(
          firstColumnHeaders: cattleFeedHeaders,
          index: index,
          cattleFeedReport: netPaymentReport[index].cattleFeedReport ?? [],
          isShowName: false,
        ),
        AdvanceDeductionReportWidget(
          firstColumnHeaders: advAmtHeaders,
          index: index,
          advAmtReport: netPaymentReport[index].advDedAmtReport ?? [],
          isShowName: false,
        ),
      ],
    );
  }
}

Widget buildCardRow({
  required String title,
  required String amount,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(127, 127, 127, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '₹ $amount',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

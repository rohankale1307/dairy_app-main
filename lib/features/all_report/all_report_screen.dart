import 'package:dairy_app/features/all_report/advance_deduction_report/advance_deduction_report_screen.dart';
import 'package:dairy_app/features/all_report/cattle_feed_report/cattle_feed_report.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'milk_collection_report/milk_collection_report.dart';
import 'milk_sales_report/milk_sales_report.dart';
import 'net_payment_report/net_payment_report.dart';

class AllReportScreen extends StatelessWidget {
  const AllReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar.defaultAppbar(
        title: 'All reports',
        context: context,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ReportHeadingWidget(
              image: 'milk_collection.png',
              title: 'Milk Collection Report',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MilkCollectionReport(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ReportHeadingWidget(
                image: 'cattle_feed.png',
                title: 'Cattle Feed Report',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CattleFeedReport(),
                    ),
                  );
                },
              ),
            ),
            ReportHeadingWidget(
              image: 'advance.png',
              title: 'Advance and Deduction Statements',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdvanceDeductionReportScreen(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ReportHeadingWidget(
                image: 'net_payment_report.png',
                title: 'Net Payment Report',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NetPaymentReport(),
                    ),
                  );
                },
              ),
            ),
            ReportHeadingWidget(
              image: 'milk_sales.png',
              title: 'Milk Sales Report',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MilkSalesReport(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReportHeadingWidget extends StatelessWidget {
  const ReportHeadingWidget({
    super.key,
    required this.title,
    this.onPressed,
    required this.image,
  });

  final String title;
  final void Function()? onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset('assets/images/$image'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: dottedLineWidget(),
          ),
        ],
      ),
    );
  }
}

Widget dottedLineWidget() {
  return const DottedLine(
    dashColor: Color.fromRGBO(191, 191, 191, 0.7),
    dashLength: 10,
    dashGapLength: 6,
  );
}

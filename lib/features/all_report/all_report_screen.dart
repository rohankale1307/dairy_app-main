import 'package:dairy_app/features/all_report/advance_deduction_report/advance_deduction_report_screen.dart';
import 'package:dairy_app/features/all_report/cattle_feed_report/cattle_feed_report.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
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
              title: 'Milk Collection REport',
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
              title: 'Advance and Deduction Statements',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvanceDeductionReportScreen(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ReportHeadingWidget(
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
              title: 'Milk Sales REport',
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
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.circle_outlined),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                const Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}

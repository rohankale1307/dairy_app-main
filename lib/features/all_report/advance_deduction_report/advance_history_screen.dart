import 'package:flutter/material.dart';

import '../../common/Widgets/default_appbar.dart';
import '../../common/model/dairy_app_model.dart';
import 'advance_deduction_report_screen.dart';

class AdvanceHistoryScreen extends StatelessWidget {
  const AdvanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AdvanceDeductionData> data = [
      AdvanceDeductionData(
        date: '23 jan 2024',
        deduction: 10000,
        newAdvance: 20000,
      ),
      AdvanceDeductionData(
        date: '23 jan 2024',
        deduction: 10000,
        newAdvance: 0,
      ),
      AdvanceDeductionData(
        date: '23 jan 2024',
        deduction: 0,
        newAdvance: 20000,
      ),
      AdvanceDeductionData(
        date: '23 jan 2024',
        deduction: 0,
        newAdvance: 20000,
      ),
      AdvanceDeductionData(
        date: '23 jan 2024',
        deduction: 20000,
        newAdvance: 0,
      ),
    ];

    int advanceAmt = data.fold(0, (sum, item) => sum + item.newAdvance);
    int deductionAmt = data.fold(0, (sum, item) => sum + item.deduction);
    int totalAdvanceAmt = advanceAmt - deductionAmt;

    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dateFilter(),
            totalAdvanceTable(
              dedAmt: deductionAmt,
              advAmt: advanceAmt,
              totalAdvAmt: totalAdvanceAmt,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: dataTable(data),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: dividerwithTitle(),
            ),
          ],
        );
      },
    );
  }

  Widget dateFilter() {
    return Padding(
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
    );
  }

  Widget totalAdvanceTable({
    required final int advAmt,
    required final int dedAmt,
    required final int totalAdvAmt,
  }) {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(245, 245, 245, 1),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 9,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '125',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Rohan Kale',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        BuildAdvanceRow(
          title: 'Total Advance',
          value: advAmt,
          isTotal: false,
        ),
        BuildAdvanceRow(
          title: 'Total Deduction',
          value: dedAmt,
          isTotal: false,
        ),
        BuildAdvanceRow(
          title: 'Total Advance Balance',
          value: totalAdvAmt,
          isTotal: true,
        ),
      ],
    );
  }

  Widget dataTable(List<AdvanceDeductionData> data) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
      },
      children: [
        DefaultAppbar.buildRow(['Date', 'Deduction', 'Advance'],
            isHeader: true),
        ...data
            .map((data) => DefaultAppbar.buildRow(
                [data.date, '₹ ${data.deduction}', '₹ ${data.newAdvance}'],
                isDisabled: true))
            .toList(),
      ],
    );
  }

  Widget dividerwithTitle() {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.black,
            )),
      ),
      const Text('End of statement'),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Colors.black,
            )),
      ),
    ]);
  }
}

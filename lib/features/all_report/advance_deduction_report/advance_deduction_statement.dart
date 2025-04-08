import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/model/dairy_app_model.dart';

class AdvanceDeductionStatement extends StatefulWidget {
  const AdvanceDeductionStatement({super.key});

  @override
  State<AdvanceDeductionStatement> createState() =>
      _AdvanceDeductionStatementState();
}

class _AdvanceDeductionStatementState extends State<AdvanceDeductionStatement> {
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
      deduction: 10000,
      newAdvance: 0,
    ),
  ];

  final List<Map<String, dynamic>> dataI = [
    {
      "date": "01 Jan",
      "feed": "Sonai Sugras",
      "qty": 2,
      "rate": 1000,
      "amount": 2000
    },
    {
      "date": "05 Jan",
      "feed": "Sonai Sugras",
      "qty": 2,
      "rate": 1000,
      "amount": 2000
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar.defaultAppbar(
        title: 'Advance and Deduction Statement',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromRGBO(245, 245, 245, 1),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 9,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
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
                          Icon(
                            Icons.lock,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const BuildAdvanceRow(
                  title: 'Total Advance', value: 10000, isTotal: false),
              const BuildAdvanceRow(
                  title: 'Total Deduction', value: 10000, isTotal: false),
              const BuildAdvanceRow(
                  title: 'Total Advance Balance', value: 10000, isTotal: true),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: TextButton(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Close Advance and Deduction Statement',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                children: [
                  DefaultAppbar.buildRow(['Date', 'Deduction', 'Advance'],
                      isHeader: true),
                  ...data
                      .map((data) => DefaultAppbar.buildRow([
                            data.date,
                            '₹ ${data.deduction}',
                            '₹ ${data.newAdvance}'
                          ], isDisabled: true))
                      .toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildAdvanceRow extends StatelessWidget {
  const BuildAdvanceRow({
    super.key,
    required this.title,
    required this.value,
    required this.isTotal,
  });

  final String title;
  final int value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        color: isTotal ? const Color.fromRGBO(245, 245, 245, 1) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ),
              child: Text(
                title,
                style: !isTotal
                    ? const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(127, 127, 127, 1),
                      )
                    : const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ),
              child: Text(
                value.toString(),
                style: !isTotal
                    ? const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(127, 127, 127, 1),
                      )
                    : const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/model/dairy_app_model.dart';
import 'advance_tab_bar.dart';

class AdvanceDeductionReportScreen extends StatelessWidget {
  AdvanceDeductionReportScreen({super.key});

  final List<AdvanceAndDeductionReport> reportList = [
    AdvanceAndDeductionReport(
        id: '120', name: 'Rohan Kale', totalAdvAmt: 10000, totalDedAmt: 9000),
    AdvanceAndDeductionReport(
        id: '121', name: 'Suraj Kale', totalAdvAmt: 24000, totalDedAmt: 5000),
    AdvanceAndDeductionReport(
        id: '120', name: 'Ramesh Kale', totalAdvAmt: 30000, totalDedAmt: 7000),
    AdvanceAndDeductionReport(
        id: '120', name: 'Ganesh Kale', totalAdvAmt: 20000, totalDedAmt: 20000),
    AdvanceAndDeductionReport(
        id: '120', name: 'Sirt Kale', totalAdvAmt: 50000, totalDedAmt: 40000),
    AdvanceAndDeductionReport(
        id: '120', name: 'JShd Kale', totalAdvAmt: 24000, totalDedAmt: 23000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar.defaultAppbar(
        title: 'Advance & Deduction Report',
        context: context,
        isShowDatePicker: true,
        isShowSearchIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: const Color.fromRGBO(229, 240, 252, 1),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        '10 Jan 2025 to 20 Jan 2025',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildAdvanceRow(
                      title: 'Total Advance',
                      value: 20000,
                      isTotal: false,
                    ),
                    BuildAdvanceRow(
                      title: 'Total Deduction',
                      value: 20000,
                      isTotal: false,
                    ),
                    BuildAdvanceRow(
                      title: 'Total Advance Balance',
                      value: 20000,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromRGBO(255, 249, 229, 1),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '''The date filter (10 Jan 2025  to  20 Jan 2025 ) does not apply to the statements below. The date filter will be applicable to only the Total table above. The total advance amount shown in above table is from statements/cards where the advance balance is above ₹ 0.''',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reportList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: ExpenseReportCardWidget(
                        data: reportList,
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseReportCardWidget extends StatelessWidget {
  const ExpenseReportCardWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final List<AdvanceAndDeductionReport> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(207, 207, 207, 1),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(207, 207, 207, 1),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    data[index].id,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    data[index].name.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AdvanceRow(
              totalAdv: 'Total Advance',
              totalAmt: data[index].totalAdvAmt,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: AdvanceRow(
              totalAdv: 'Total Deduction',
              totalAmt: data[index].totalDedAmt,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: AdvanceRow(
              totalAdv: 'Advance Balance',
              totalAmt: data[index].totalAdvAmt - data[index].totalDedAmt,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdvanceTabBar(),
                  ),
                );
              },
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromRGBO(245, 245, 245, 1),
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View all statements',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AdvanceRow extends StatelessWidget {
  const AdvanceRow({
    super.key,
    required this.totalAdv,
    required this.totalAmt,
  });

  final String totalAdv;
  final int totalAmt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          totalAdv,
          style: const TextStyle(
            color: Color.fromRGBO(127, 127, 127, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          totalAmt.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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

import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/model/dairy_app_model.dart';
import 'advance_deduction_statement.dart';

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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.35,
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
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_input_component_rounded,
                    size: 20,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(245, 245, 245, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
          const BuildAdvanceRow(
            title: 'Total Advance',
            value: 20000,
            isTotal: false,
          ),
          const BuildAdvanceRow(
            title: 'Total Deduction',
            value: 20000,
            isTotal: false,
          ),
          const BuildAdvanceRow(
            title: 'Total Advance Balance',
            value: 20000,
            isTotal: true,
          ),
          Expanded(
            child: ListView.builder(
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
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(207, 207, 207, 1),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromRGBO(245, 245, 245, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        data[index].id,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        data[index].name.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AdvanceDeductionStatement(),
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
                          Colors.black,
                        )),
                    child: const Row(
                      children: [
                        Text(
                          'Statement',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
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

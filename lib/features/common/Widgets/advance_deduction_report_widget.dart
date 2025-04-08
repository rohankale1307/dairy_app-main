import 'package:flutter/material.dart';

import '../model/dairy_app_model.dart';

class AdvanceDeductionReportWidget extends StatelessWidget {
  const AdvanceDeductionReportWidget({
    super.key,
    required this.firstColumnHeaders,
    required this.index,
    required this.advAmtReport,
    this.isShowName = true,
  });

  final List<String> firstColumnHeaders;
  final List<AdvAmtReportItem> advAmtReport;
  final int index;
  final bool isShowName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.green.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: isShowName
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Text(
                          advAmtReport[index].id,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        advAmtReport[index].name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  )
                : const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Text(
                          'Deduction Report',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...firstColumnHeaders.map(
                  (head) => Container(
                    constraints:
                        const BoxConstraints(maxWidth: 100, minWidth: 100),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 245, 245, 1),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      head,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      advAmtReport[index].advAmtReportModel.length,
                      (headIndex) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              firstColumnHeaders.length,
                              (valueIndex) => Container(
                                width: 120,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Text(
                                  getAdvAmtColumnValue(
                                    valueIndex,
                                    advAmtReport[index]
                                        .advAmtReportModel[headIndex],
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String getAdvAmtColumnValue(
    int headIndex,
    AdvAmtReportModel advAmtReportModel,
  ) {
    switch (headIndex) {
      case 0:
        return advAmtReportModel.date;
      case 1:
        return advAmtReportModel.advAmt;
      case 2:
        return advAmtReportModel.deductionAmt;
      default:
        return '';
    }
  }
}

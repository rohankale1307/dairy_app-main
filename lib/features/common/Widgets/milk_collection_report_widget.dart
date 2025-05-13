import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/dairy_app_model.dart';

class MilkCollectionReportWidget extends StatelessWidget {
  const MilkCollectionReportWidget({
    super.key,
    required this.firstColumnHeaders,
    required this.milkReport,
    required this.index,
    this.isShowName = true,
  });

  final List<String> firstColumnHeaders;
  final List<MilkReport> milkReport;
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
                      Flexible(
                        child: Text(
                          milkReport[index].id,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          milkReport[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                        ),
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
                          'Milk Collection Report',
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...firstColumnHeaders.map(
                  (head) => Container(
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(
                      maxWidth: 80,
                      minWidth: 80,
                      minHeight: 50,
                      maxHeight: 50,
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      milkReport[index].milkReport.length,
                      (headIndex) {
                        return Column(
                          children: [
                            ...List.generate(
                              firstColumnHeaders.length,
                              (valueIndex) => Container(
                                alignment: Alignment.center,
                                constraints: const BoxConstraints(
                                  minHeight: 50,
                                  maxHeight: 50,
                                  minWidth: 120,
                                  maxWidth: 120,
                                ),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Text(
                                  getColumnValue(
                                    valueIndex,
                                    milkReport[index].milkReport[headIndex],
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

  String getColumnValue(int headIndex, MilkReportModel milkReport) {
    switch (headIndex) {
      case 0:
        return milkReport.date;
      case 1:
        return milkReport.shift;
      case 2:
        return milkReport.milk;
      case 3:
        return milkReport.liter;
      case 4:
        return milkReport.fat;
      case 5:
        return milkReport.snf;
      case 6:
        return milkReport.rate;
      case 7:
        return milkReport.amount;
      default:
        return '';
    }
  }

  String getFeedColumnValue(
    int headIndex,
    CattleFeedReportModel cattleFeedReport,
  ) {
    switch (headIndex) {
      case 0:
        return cattleFeedReport.date;
      case 1:
        return cattleFeedReport.feed;
      case 2:
        return cattleFeedReport.qty;
      case 3:
        return cattleFeedReport.rate;
      case 4:
        return cattleFeedReport.amount;
      default:
        return '';
    }
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

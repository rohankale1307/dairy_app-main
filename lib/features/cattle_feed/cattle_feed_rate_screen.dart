import 'package:flutter/material.dart';

import '../common/Widgets/default_appbar.dart';
import '../common/model/dairy_app_model.dart';

class CattleFeedRateScreen extends StatelessWidget {
  const CattleFeedRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CattleFeedRate> cattleFeedRate = [
      CattleFeedRate(
        feedName: 'Hindustan Cattle Feed',
        rate: '₹ 2000',
      ),
      CattleFeedRate(
        feedName: 'Amul Cattle Feed',
        rate: '₹ 3000',
      ),
      CattleFeedRate(
        feedName: 'Amul Cattle Feed',
        rate: '₹ 3000',
      ),
      CattleFeedRate(
        feedName: 'Amul Cattle Feed',
        rate: '₹ 3000',
      ),
      CattleFeedRate(
        feedName: 'Amul Cattle Feed',
        rate: '₹ 3000',
      ),
      CattleFeedRate(
        feedName: 'Amul Cattle Feed',
        rate: '₹ 3000',
      ),
      CattleFeedRate(
        feedName: 'Amul Cattle Feed',
        rate: '₹ 3000',
      ),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
              },
              children: [
                DefaultAppbar.buildRow(
                  ['Feed Name', 'Amount', ''],
                  isHeader: true,
                ),
                ...cattleFeedRate
                    .map((data) => DefaultAppbar.buildCattleFeedRow(
                          cells: [
                            Text(
                              data.feedName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                            ),
                            Text(
                              data.rate.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                              textAlign: TextAlign.right,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.more_vert_sharp,
                              ),
                            )
                          ],
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

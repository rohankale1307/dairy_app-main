import 'package:dairy_app/features/common/Widgets/advance_amount_widget.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import '../common/model/dairy_app_model.dart';
import 'new_advance_screen.dart';

class AdvanceAmountScreen extends StatefulWidget {
  const AdvanceAmountScreen({super.key});

  @override
  State<AdvanceAmountScreen> createState() => _AdvanceAmountScreenState();
}

class _AdvanceAmountScreenState extends State<AdvanceAmountScreen> {
  final List<AdvanceAmountModel> advanceAmtModel = [
    AdvanceAmountModel(
      date: '18/04/2025',
      id: '125',
      name: 'Rohan Kale',
      note: 'New Car Purchase',
      amount: '20000',
    ),
    AdvanceAmountModel(
      date: '18/04/2025',
      id: '126',
      name: 'Rohit Kale',
      note: 'New Phone Purchase',
      amount: '30000',
    ),
    AdvanceAmountModel(
      date: '17/04/2025',
      id: '127',
      name: 'Rohini Kale',
      note: 'New Bike Purchase',
      amount: '40000',
    ),
    AdvanceAmountModel(
      date: '16/04/2025',
      id: '128',
      name: 'Suresh Kale',
      note: 'New Home Purchase',
      amount: '50000',
    ),
    AdvanceAmountModel(
      date: '15/04/2025',
      id: '129',
      name: 'Rajani Kale',
      note: 'New TV Purchase',
      amount: '60000',
    ),
    AdvanceAmountModel(
      date: '14/04/2025',
      id: '130',
      name: 'Digvijay Kale',
      note: 'New Laptop Purchase',
      amount: '70000',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar.defaultAppbar(
        title: 'Advance',
        context: context,
        isShowDatePicker: true,
        isShowSearchIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Text(
                            'Total Adv Amount',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            '200000',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final currentIndexDateStr =
                        advanceAmtModel.elementAt(index).date;

                    final previousIndexDateStr = advanceAmtModel
                        .elementAt(index == 0 ? index : index - 1)
                        .date;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (index == 0 ||
                            currentIndexDateStr != previousIndexDateStr)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              color: const Color.fromRGBO(239, 249, 252, 1),
                              child: Text(
                                showDateLabel(currentIndexDateStr),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 16,
                            right: 16,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewAdvanceScreen(
                                    isEdit: true,
                                  ),
                                ),
                              );
                            },
                            child: AdvanceAmountWidget(
                              advanceAmtModel: advanceAmtModel,
                              index: index,
                            ),
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: Buttons.addCollectionButton(
        title: 'New Advance',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewAdvanceScreen(
                isEdit: false,
              ),
            ),
          );
        },
      ),
    );
  }

  String showDateLabel(String currentIndexDateStr) {
    final collectionDateTime =
        DateTime.parse(currentIndexDateStr.split('/').reversed.join());
    final dateDifference = DateTime.now().difference(collectionDateTime);
    if (dateDifference.inHours < 24) {
      return 'Today';
    } else if (dateDifference.inHours < 48) {
      return 'Yesterday';
    } else {
      final formattedDate =
          '${collectionDateTime.day} ${getMonthName(collectionDateTime.month)} ${collectionDateTime.year}';
      return formattedDate;
    }
  }

  getMonthName(int month) {
    switch (month) {
      case 0:
        return 'January';
      case 1:
        return 'Febuary';
      case 2:
        return 'March';
      case 3:
        return 'April';
      case 4:
        return 'May';
      case 5:
        return 'June';
      case 6:
        return 'July';
      case 7:
        return 'August';
      case 8:
        return 'September';
      case 9:
        return 'Octomber';
      case 10:
        return 'November';
      case 11:
        return 'December';
      default:
        return '$month';
    }
  }
}

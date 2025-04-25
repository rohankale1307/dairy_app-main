import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:dairy_app/features/dairy_expenses/new_dairy_expense.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import '../common/model/dairy_app_model.dart';

class DairyExpensesScreen extends StatelessWidget {
  DairyExpensesScreen({super.key});

  final List<DairyExpensesModel> expenses = [
    DairyExpensesModel(
      date: '03/01/2024',
      total: 10000,
      dairyExpenseData: [
        DairyExpensesData(
          amount: '10000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '20000',
          type: 'Mobile',
        ),
        DairyExpensesData(
          amount: '30000',
          type: 'Home',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
      ],
    ),
    DairyExpensesModel(
      date: '04/05/2024',
      total: 10000,
      dairyExpenseData: [
        DairyExpensesData(
          amount: '1000',
          type: 'DIsel',
        ),
        DairyExpensesData(
          amount: '100',
          type: 'Petrol',
        ),
        DairyExpensesData(
          amount: '5000',
          type: 'Milk',
        ),
      ],
    ),
    DairyExpensesModel(
      date: '03/02/2024',
      total: 10000,
      dairyExpenseData: [
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
      ],
    ),
    DairyExpensesModel(
      date: '04/03/2024',
      total: 10000,
      dairyExpenseData: [
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
        DairyExpensesData(
          amount: '100000',
          type: 'Vehicle',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar.defaultAppbar(
        title: ' Dairy Expenses',
        context: context,
        isShowDatePicker: true,
        isShowSearchIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final currentDateTime =
                  getDateTime(expenses.elementAt(index).date);
              final previousDateTime = getDateTime(
                  expenses.elementAt(index == 0 ? index : index - 1).date);

              final isSameMonth =
                  checkIsSameMonth(currentDateTime, previousDateTime);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    if (index == 0 || !isSameMonth)
                      DateLableWidget(
                        month: currentDateTime.month,
                        year: '${currentDateTime.year}',
                        amount: '${expenses.elementAt(index).total}',
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewDairyExpenseScreen(
                              isEdit: true,
                            ),
                          ),
                        );
                      },
                      child: ExpenseDataRow(
                        dairyExpenses: expenses.elementAt(index),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: Buttons.addCollectionButton(
        title: 'New Expense',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewDairyExpenseScreen(
                isEdit: false,
              ),
            ),
          );
        },
      ),
    );
  }

  bool checkIsSameMonth(DateTime currentDateTime, DateTime previousDateTime) {
    return (currentDateTime.month == previousDateTime.month &&
        currentDateTime.year == previousDateTime.year);
  }
}

DateTime getDateTime(String dateTimeStr) {
  return DateTime.parse(dateTimeStr.split('/').reversed.join());
}

class ExpenseDataRow extends StatelessWidget {
  const ExpenseDataRow({
    super.key,
    required this.dairyExpenses,
  });

  final DairyExpensesModel dairyExpenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dairyExpenses.dairyExpenseData.length,
        itemBuilder: (BuildContext context, int index) {
          final dairyExpensesData =
              dairyExpenses.dairyExpenseData.elementAt(index);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dairyExpensesData.type,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '₹ ${dairyExpensesData.amount}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Text(
                '01 Jan 2024  Morning 09:25AM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(92, 92, 92, 1),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: Color.fromRGBO(92, 92, 92, 0.6),
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}

class DateLableWidget extends StatelessWidget {
  const DateLableWidget({
    super.key,
    required this.year,
    required this.month,
    required this.amount,
  });

  final String year;
  final int month;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(245, 245, 245, 1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(92, 92, 92, 1),
                  ),
                ),
                Text(
                  getMonth(month: month),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Text(
              // '₹ ${expenses[index].total}',
              '₹ $amount',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getMonth({required int month}) {
  switch (month) {
    case 0:
      return 'January';
    case 1:
      return 'February';
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
      return 'October';
    case 10:
      return 'November';
    case 11:
      return 'December';
    default:
      return '';
  }
}

import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/date_picker.dart';
import '../common/model/dairy_app_model.dart';

class DairyExpensesScreen extends StatelessWidget {
  DairyExpensesScreen({super.key});

  final List<DairyExpensesModel> expenses = [
    DairyExpensesModel(date: '03 Jan 2024', total: 10000, dairyExpenseData: [
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
    ]),
    DairyExpensesModel(date: '04 Jan 2024', total: 10000, dairyExpenseData: [
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
    ]),
  ];

  // final List<Map<String, dynamic>> expenses = [
  //   {
  //     "date": "02 Jan 2024",
  //     "total": "₹ 1200",
  //     "details": [
  //       {"type": "Vehicle diesel", "amount": "₹ 500"},
  //       {"type": "Generator diesel", "amount": "₹ 700"},
  //     ]
  //   },
  //   {
  //     "date": "03 Jan 2024",
  //     "total": "₹ 1200",
  //     "details": [
  //       {"type": "Vehicle diesel", "amount": "₹ 500"},
  //       {"type": "Generator diesel", "amount": "₹ 700"},
  //     ]
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar.defaultAppbar(
          title: ' Dairy Expenses', context: context),
      body: Column(
        children: [
          const DatePicker(),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(1),
            },
            children: [
              DefaultAppbar.buildRow(['Milk', 'Liter', ''], isHeader: true),
            ],
          )
        ],
      ),
    );
  }
}

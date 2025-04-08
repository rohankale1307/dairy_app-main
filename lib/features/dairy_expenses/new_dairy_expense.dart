import 'package:flutter/material.dart';

import '../common/Widgets/default_appbar.dart';
import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/textfield.dart';

class NewDairyExpenseScreen extends StatefulWidget {
  const NewDairyExpenseScreen({super.key});

  @override
  State<NewDairyExpenseScreen> createState() => _NewDairyExpenseScreenState();
}

class _NewDairyExpenseScreenState extends State<NewDairyExpenseScreen> {
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController expenseTypeController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar.defaultAppbar(
          title: 'New DAiry Expense',
          context: context,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: dateTimeController,
                  lableText: 'Date-Time',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: expenseTypeController,
                    lableText: 'Expense Type',
                  ),
                ),
                TextFieldWidget(
                  controller: amountController,
                  lableText: 'Amount',
                  textInputType: TextInputType.name,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: EditCollectionButton(
            onDeletePressed: () {},
            onSavePressed: () {},
          ),
        ),
      ),
    );
  }
}

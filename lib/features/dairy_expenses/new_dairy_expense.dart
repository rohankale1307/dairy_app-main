import 'package:flutter/material.dart';

import '../common/Widgets/default_appbar.dart';
import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class NewDairyExpenseScreen extends StatefulWidget {
  const NewDairyExpenseScreen({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

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
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: widget.isEdit ? 'Edit expense' : 'New expense',
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
                  lableText: 'Date',
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
          child: widget.isEdit
              ? EditCollectionButton(
                  onDeletePressed: () {},
                  onSavePressed: () {},
                )
              : NewCollectionButton(
                  title: 'Save',
                  onPressed: () {},
                ),
        ),
      ),
    );
  }
}

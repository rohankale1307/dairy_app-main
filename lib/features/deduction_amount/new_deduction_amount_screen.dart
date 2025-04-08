import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class NewDeductionScreen extends StatefulWidget {
  const NewDeductionScreen({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<NewDeductionScreen> createState() => _NewDeductionScreenState();
}

class _NewDeductionScreenState extends State<NewDeductionScreen> {
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController advancedAmountController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'New Deduction Amount',
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
                    controller: codeController,
                    lableText: 'Code',
                  ),
                ),
                TextFieldWidget(
                  controller: customerNameController,
                  lableText: 'Customer Name',
                  textInputType: TextInputType.name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: advancedAmountController,
                    lableText: 'Deduction Amount',
                  ),
                ),
                TextFieldWidget(
                  controller: noteController,
                  lableText: 'Note',
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
                  title: 'Save and Send to Customer',
                  onPressed: () {},
                ),
        ),
      ),
    );
  }
}

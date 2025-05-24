import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class AddNewCustomer extends StatefulWidget {
  const AddNewCustomer({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<AddNewCustomer> createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {
  TextEditingController codeController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: widget.isEdit ? 'Edit customers details' : 'New customer',
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: codeController,
                    lableText: 'Code',
                  ),
                ),
                TextFieldWidget(
                  controller: customerNameController,
                  lableText: 'Customer name',
                  textInputType: TextInputType.name,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFieldWidget(
                    controller: customerNameController,
                    lableText: 'Customer nickname',
                    textInputType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: joiningDateController,
                    lableText: 'Joining date',
                  ),
                ),
                TextFieldWidget(
                  controller: phoneNumController,
                  lableText: 'Phone number',
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

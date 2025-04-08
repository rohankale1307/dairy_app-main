import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class AddNewCattleFeedSale extends StatefulWidget {
  const AddNewCattleFeedSale({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<AddNewCattleFeedSale> createState() => _AddNewCattleFeedSaleState();
}

class _AddNewCattleFeedSaleState extends State<AddNewCattleFeedSale> {
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController feedNameControllerController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar.defaultAppbar(
          title: 'New Cattle Feed Sale',
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
                    controller: feedNameControllerController,
                    lableText: 'Feed Name',
                  ),
                ),
                TextFieldWidget(
                  controller: quantityController,
                  lableText: 'Quantity',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: rateController,
                    lableText: 'Rate',
                  ),
                ),
                TextFieldWidget(
                  controller: totalAmountController,
                  lableText: 'Total Amount',
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

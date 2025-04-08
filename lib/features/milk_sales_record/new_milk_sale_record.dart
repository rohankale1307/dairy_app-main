import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/chip_widget.dart';
import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class NewMilkSaleRecordScreen extends StatefulWidget {
  const NewMilkSaleRecordScreen({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<NewMilkSaleRecordScreen> createState() =>
      _NewMilkSaleRecordScreenState();
}

class _NewMilkSaleRecordScreenState extends State<NewMilkSaleRecordScreen> {
  int selectedIndex = 0;
  List<int> selectedIndices = [];
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController buyerNameController = TextEditingController();
  TextEditingController literController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController snfController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  List<String> lables = [
    'Morning',
    'Evening',
    'Cow',
    'Buffalo',
  ];

  int? selectedFirstGroup;
  int? selectedLastGroup;

  void toggleSelection(int index) {
    setState(() {
      if (index < 2) {
        selectedFirstGroup = (selectedFirstGroup == index) ? null : index;
      } else {
        selectedLastGroup = (selectedLastGroup == index) ? null : index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Add New Collection',
          context: context,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  children: List.generate(
                    4,
                    (index) => GestureDetector(
                      onTap: () {
                        toggleSelection(index);
                      },
                      child: ChipWidget(
                          isSelected:
                              (index < 2 && selectedFirstGroup == index) ||
                                  (index >= 2 && selectedLastGroup == index),
                          label: lables[index]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: dateTimeController,
                    lableText: 'Date-Time',
                  ),
                ),
                TextFieldWidget(
                  controller: codeController,
                  lableText: 'Code',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: buyerNameController,
                    lableText: 'Buyer Name',
                    textInputType: TextInputType.name,
                  ),
                ),
                TextFieldWidget(
                  controller: literController,
                  lableText: 'Liter',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: fatController,
                    lableText: 'FAT',
                  ),
                ),
                TextFieldWidget(
                  controller: snfController,
                  lableText: 'SNF',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: rateController,
                    lableText: 'Rate',
                  ),
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

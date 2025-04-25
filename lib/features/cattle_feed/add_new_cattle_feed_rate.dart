import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class AddNewCattleFeedRate extends StatefulWidget {
  const AddNewCattleFeedRate({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  State<AddNewCattleFeedRate> createState() => _AddNewCattleFeedRateState();
}

class _AddNewCattleFeedRateState extends State<AddNewCattleFeedRate> {
  TextEditingController feedNameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar.defaultAppbar(
          title: 'Add new cattle feed', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          children: [
            TextFieldWidget(
              controller: feedNameController,
              lableText: 'Feed Name',
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: feedNameController,
              lableText: 'Rate/Selling Price',
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(245, 245, 245, 1),
        child: Padding(
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

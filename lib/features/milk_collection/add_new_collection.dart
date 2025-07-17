import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/chip_widget.dart';
import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';

class AddNewCollectionScreen extends StatefulWidget {
  const AddNewCollectionScreen({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<AddNewCollectionScreen> createState() => _AddNewCollectionScreenState();
}

class _AddNewCollectionScreenState extends State<AddNewCollectionScreen> {
  int selectedIndex = 0;

  List<int> selectedIndices = [];
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController literController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController snfController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController dayTimeController = TextEditingController();
  TextEditingController animalTypeController = TextEditingController();

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
        dayTimeController.text = index == 0 ? 'Morning' : 'Evening';
      } else {
        selectedLastGroup = (selectedLastGroup == index) ? null : index;
        animalTypeController.text = index == 2 ? 'Cow' : 'Buffalo';
      }
    });
  }

  void addMilkSales(String mobNo) async {
    final date = dateTimeController.text.trim();
    final code = codeController.text;
    final name = customerNameController.text;
    final liter = literController.text;
    final fat = fatController.text;
    final snf = snfController.text;
    final rate = rateController.text;
    final dayTime = dayTimeController.text;
    final animalType = animalTypeController.text;

    if (date.isEmpty ||
        code.isEmpty ||
        name.isEmpty ||
        liter.isEmpty ||
        fat.isEmpty ||
        snf.isEmpty ||
        rate.isEmpty ||
        dayTime.isEmpty ||
        animalType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.purple,
          duration: Duration(seconds: 1),
          content: Center(
            child: Text(
              "Please fill all the required details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      );
    } else {
      final dbRef = FirebaseDatabase.instance
          .ref()
          .child('users')
          .child(mobNo)
          .child('milkSales');

      await dbRef.child(code).set({
        'date': date,
        'name': name,
        'code': code,
        'liter': liter,
        'fat': fat,
        'snf': snf,
        'rate': rate,
        'dayTime': dayTime,
        'animalType': animalType,
      });

      print('Milk Sale Data Added Successfully !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: widget.isEdit ? 'Edit collection' : 'New collection',
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
                ...List.generate(2, (colIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        2,
                        (rowIndex) {
                          final index = (colIndex * 1) * 2 + rowIndex;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => toggleSelection(index),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChipWidget(
                                    isSelected: (index < 2 &&
                                            selectedFirstGroup == index) ||
                                        (index >= 2 &&
                                            selectedLastGroup == index),
                                    label: lables[index]),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                }),
                // Wrap(
                //   spacing: 10,
                //   runSpacing: 10,
                //   children: List.generate(
                //     4,
                //     (index) => GestureDetector(
                //       onTap: () {
                //         toggleSelection(index);
                //       },
                //       child: ChipWidget(
                //           isSelected:
                //               (index < 2 && selectedFirstGroup == index) ||
                //                   (index >= 2 && selectedLastGroup == index),
                //           label: lables[index]),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: dateTimeController,
                    lableText: 'Date',
                  ),
                ),
                TextFieldWidget(
                  controller: codeController,
                  lableText: 'Code',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    controller: customerNameController,
                    lableText: 'Customer Name',
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
                    onPressed: () {
                      addMilkSales('7058426247');
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/Widgets/chip_widget.dart';
import '../common/Widgets/edit_collection_button.dart';
import '../common/Widgets/new_collection_button.dart';
import '../common/Widgets/textfield.dart';
import '../utils/utils_file.dart';
import 'api/add_new_collection_api.dart';
import 'api/get_cust_dtls_api.dart';
import 'milk_collection_screen.dart';
import 'store/milk_collection_store.dart';

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

  late MilkCollectionStore _milkCollectionStore;
  late AddNewCollectionApi addNewCollectionApi;
  late GetCustDtlsApi getCustDtlsApi;
  DateTime? _selectedDate;

  @override
  void initState() {
    _milkCollectionStore = MilkCollectionStore();
    addNewCollectionApi = AddNewCollectionApi();
    getCustDtlsApi = GetCustDtlsApi();
    // TODO: implement initState
    super.initState();
  }

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
                    canRequestFocus: false,
                    readOnly: true,
                    controller: dateTimeController,
                    lableText: 'Date',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: const Icon(
                        Icons.calendar_month_outlined,
                      ),
                    ),
                  ),
                ),
                TextFieldWidget(
                  controller: codeController,
                  lableText: 'Code',
                  onSubmitted: (final String code) {
                    print('hdgsds');
                    getCustDetails(code: code);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldWidget(
                    canRequestFocus: false,
                    readOnly: true,
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
                      // addMilkSales('7058426247');
                      addNewMilkCollection();
                    },
                    color: Colors.black,
                  ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dateTimeController
        ..text =
            DateFormat('dd MMM yyyy').format(_selectedDate ?? DateTime(2000))
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateTimeController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  getCustDetails({required final String code}) {
    UtilsFile.showLoadingDialog(context);
    _milkCollectionStore
        .getCustDetails(
      api: getCustDtlsApi,
      code: code,
    )
        .then((value) {
      Navigator.of(context).pop();
      _milkCollectionStore.getCustDetailsResponse = value;

      setState(() {
        customerNameController.text = _milkCollectionStore.customerName;
      });
      UtilsFile.showErrorDialog(
          context,
          'Ooops',
          _milkCollectionStore.getCustDetailsResponse?.header?.message ?? '',
          'Okay', () {
        Navigator.of(context).pop();
      });
      print(value);
    }).onError((error, stacktrace) {
      print(stacktrace);
      Navigator.of(context).pop();
      UtilsFile.showErrorDialog(context, 'Ooops', error.toString(), 'Okay', () {
        Navigator.of(context).pop();
      });
    });
  }

  addNewMilkCollection() {
    UtilsFile.showLoadingDialog(context);
    _milkCollectionStore
        .getNewCollectionData(api: addNewCollectionApi)
        .then((value) {
      Navigator.of(context).pop();
      UtilsFile.showErrorDialog(
          context,
          'Oops',
          '${_milkCollectionStore.newCollectionResponseBody?.header?.message}',
          'Okay', () {
        Navigator.of(context).pop();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => MilkCollectionScreen(),
          ),
        );
      });
      print(value);
    }).onError((error, stacktrace) {
      print(stacktrace);
      Navigator.of(context).pop();
      UtilsFile.showErrorDialog(context, 'Ooops', error.toString(), 'Okay', () {
        Navigator.of(context).pop();
      });
    });
  }
}

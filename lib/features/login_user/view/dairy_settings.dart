import 'package:flutter/material.dart';

import '../../common/Widgets/custom_dropdown_field.dart';
import '../../common/Widgets/default_appbar.dart';
import '../../common/model/title_subtitle_model.dart';
import 'plan_page.dart';

class DairySettings extends StatefulWidget {
  const DairySettings({super.key});

  @override
  State<DairySettings> createState() => _DairySettingsState();
}

class _DairySettingsState extends State<DairySettings> {
  String? selectedtype;
  String? selectedCycle;

  final List<TitleSubtitle> billingCycle = [
    TitleSubtitle(
        title: '10 days', subTitle: '01 - 10 , 11 - 20 , 21 - Month end'),
    TitleSubtitle(title: '15 days', subTitle: '01 - 15 , 16 - Month end'),
    TitleSubtitle(title: '1 Month', subTitle: '01 - Month end'),
    TitleSubtitle(
        title: '05 days',
        subTitle:
            '01 - 05 , 06 - 10 , 11 - 15, 16 - 20, 21 - 25, 26 - Month end'),
  ];

  final List<TitleSubtitle> collectionType = [
    TitleSubtitle(title: 'FAT only'),
    TitleSubtitle(title: 'CLR only'),
    TitleSubtitle(title: 'FAT + SNF'),
    TitleSubtitle(title: 'FAT + CLR'),
    TitleSubtitle(title: 'Liter only'),
  ];

  String? currentlyOpenDropdown;

  void _toggleDropdown(String dropdownId) {
    setState(() {
      if (currentlyOpenDropdown == dropdownId) {
        currentlyOpenDropdown = null;
      } else {
        currentlyOpenDropdown = dropdownId;
      }
    });
  }

  void _onOptionSelected(String dropdownId, String value) {
    setState(() {
      if (dropdownId == 'collectionType') {
        selectedtype = value;
      } else if (dropdownId == 'billingCycle') {
        selectedCycle = value;
      }
      currentlyOpenDropdown = null; // close dropdown after selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Back',
          context: context,
          backgroundColor: Colors.white,
          space: 1,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Dairy Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomDropdownField(
                  selectedValue: selectedtype,
                  label: 'Collection type',
                  options: collectionType,
                  onChanged: (val) => _onOptionSelected('collectionType', val),
                  onToggle: () => _toggleDropdown('collectionType'),
                  isOpen: currentlyOpenDropdown == 'collectionType',
                  trailingImage: Icon(Icons.check),
                ),
              ),
              CustomDropdownField(
                selectedValue: selectedCycle,
                label: 'Billing cycle',
                options: billingCycle,
                onChanged: (val) => _onOptionSelected('billingCycle', val),
                onToggle: () => _toggleDropdown('billingCycle'),
                isOpen: currentlyOpenDropdown == 'billingCycle',
              ),
             
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlanPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromRGBO(0, 118, 255, 1)),
                    shape: WidgetStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// String? selectedFruit;
// String? selectedCity;

// final List<String> fruitOptions = ['Apple', 'Banana', 'Cherry'];
// final List<String> cityOptions = ['New York', 'London', 'Tokyo'];

// String? currentlyOpenDropdown; // can be 'fruit' or 'city' or null

// void _toggleDropdown(String dropdownId) {
//   setState(() {
//     if (currentlyOpenDropdown == dropdownId) {
//       currentlyOpenDropdown = null;
//     } else {
//       currentlyOpenDropdown = dropdownId;
//     }
//   });
// }

// void _onOptionSelected(String dropdownId, String value) {
//   setState(() {
//     if (dropdownId == 'fruit') {
//       selectedFruit = value;
//     } else if (dropdownId == 'city') {
//       selectedCity = value;
//     }
//     currentlyOpenDropdown = null; // close dropdown after selection
//   });
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Dropdown Controller')),
//     body: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           CustomDropdownField(
//             label: 'Collection type',
//             options: coll,
//             selectedValue: selectedFruit,
//             isOpen: currentlyOpenDropdown == 'fruit',
//             onToggle: () => _toggleDropdown('fruit'),
//             onChanged: (val) => _onOptionSelected('fruit', val),
//           ),
//           SizedBox(height: 20),
//           CustomDropdownField(
//             label: 'Select City',
//             options: cityOptions,
//             selectedValue: selectedCity,
//             isOpen: currentlyOpenDropdown == 'city',
//             onToggle: () => _toggleDropdown('city'),
//             onChanged: (val) => _onOptionSelected('city', val),
//           ),
//         ],
//       ),
//     ),
//   );
// }

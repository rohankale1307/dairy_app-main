import 'package:dairy_app/features/widgets/normal_button.dart';
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
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              CustomDropdownField(
                selectedValue: selectedtype,
                label: 'Quality measurements',
                options: collectionType,
                onChanged: (val) => _onOptionSelected('collectionType', val),
                onToggle: () => _toggleDropdown('collectionType'),
                isOpen: currentlyOpenDropdown == 'collectionType',
                trailingImage: const Icon(Icons.check),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomDropdownField(
                  selectedValue: selectedCycle,
                  label: 'Billing cycle',
                  options: billingCycle,
                  onChanged: (val) => _onOptionSelected('billingCycle', val),
                  onToggle: () => _toggleDropdown('billingCycle'),
                  isOpen: currentlyOpenDropdown == 'billingCycle',
                ),
              ),
              NormalButton(
                title: 'Continue',
                titleColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlanPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

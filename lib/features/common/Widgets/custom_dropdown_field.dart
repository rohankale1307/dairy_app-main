import 'package:flutter/material.dart';

import '../model/title_subtitle_model.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final List<TitleSubtitle> options;
  final String? selectedValue;
  final Function(String) onChanged;
  final Function() onToggle;
  final bool isOpen;
  final Widget? trailingImage;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.options,
    required this.onChanged,
    required this.onToggle,
    required this.isOpen,
    this.selectedValue,
    this.trailingImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: selectedValue ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
          child: AbsorbPointer(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(127, 127, 127, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: Colors.black)),
                suffixIcon: Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                ),
              ),
            ),
          ),
        ),
        if (isOpen)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              color: const Color.fromRGBO(236, 236, 236, 1),
            ),
            child: Column(
              children: options.map((option) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (option.title == selectedValue) const Icon(Icons.check)
                    ],
                  ),
                  subtitle: option.subTitle != null
                      ? Text(
                          option.subTitle ?? '',
                          style: const TextStyle(
                            color: Color.fromRGBO(127, 127, 127, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : null,
                  onTap: () {
                    onChanged(option.title);
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

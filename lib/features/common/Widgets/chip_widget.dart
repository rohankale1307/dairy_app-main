import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.isSelected,
    required this.label,
  });

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isSelected ? Colors.black : Colors.white,
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
      side: const BorderSide(color: Colors.black, width: 1.10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.horizontal(
        start: Radius.circular(30),
        end: Radius.circular(30),
      )),
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.lableText,
    this.textInputType,
  });

  final TextEditingController controller;
  final String lableText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: lableText,
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: textInputType ?? TextInputType.number,
    );
  }
}

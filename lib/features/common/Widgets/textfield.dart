import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.lableText,
    this.textInputType,
    this.onSubmitted,
    this.focusNode,
    this.readOnly = false,
    this.canRequestFocus = true,
    this.suffixIcon,
    this.prefixText,
  });

  final TextEditingController controller;
  final String lableText;
  final TextInputType? textInputType;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool canRequestFocus;
  final Widget? suffixIcon;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      canRequestFocus: canRequestFocus,
      readOnly: readOnly,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: lableText,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    required this.lable,
    this.prefixText,
    this.focusNode,
    this.maxLength,
    this.obscureText,
    this.suffixIcon,
    this.inputFormatters,
    required this.controller,
    this.onChanged,
  });

  final TextInputType? keyboardType;
  final String lable;
  final String? prefixText;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool? obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      focusNode: focusNode,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: lable,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(89, 89, 89, 1),
        ),
        prefixText: prefixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '1 Jan 2024  to 10 Jan 2024',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings_input_component_rounded,
            size: 20,
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromRGBO(245, 245, 245, 1),
            ),
          ),
        )
      ],
    );
  }
}

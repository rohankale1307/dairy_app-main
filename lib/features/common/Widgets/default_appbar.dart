import 'package:flutter/material.dart';

class DefaultAppbar {
  static PreferredSizeWidget? defaultAppbar({
    required final String title,
    required final BuildContext context,
    final PreferredSizeWidget? bottomWidget,
  }) {
    return AppBar(
      backgroundColor: Colors.white,
      bottom: bottomWidget,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromRGBO(245, 245, 245, 1),
          ),
        ),
      ),
      title: Text(
        title,
        maxLines: 2,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static TableRow buildRow(List<String> cells,
      {bool isHeader = false, bool isTotal = false, bool isDisabled = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader || isTotal
            ? const Color.fromRGBO(245, 245, 245, 1)
            : Colors.white,
      ),
      children: cells.asMap().entries.map((entry) {
        int index = entry.key;
        String cell = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cell,
              style: TextStyle(
                  fontWeight:
                      isHeader || isTotal ? FontWeight.bold : FontWeight.w400,
                  color: isDisabled
                      ? const Color.fromRGBO(127, 127, 127, 1)
                      : Colors.black,
                  fontSize: isHeader || isTotal ? 18 : 16,
                  fontFamily: ''),
              textAlign: index == 0 ? TextAlign.left : TextAlign.right,
            ),
          ),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';

class DefaultAppbar {
  static PreferredSizeWidget? defaultAppbar({
    required final String title,
    required final BuildContext context,
    final PreferredSizeWidget? bottomWidget,
    final isShowDatePicker = false,
    final isShowSearchIcon = false,
  }) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      bottom: bottomWidget,
      actions: [
        if (isShowSearchIcon)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        if (isShowDatePicker)
          IconButton(
            onPressed: () async {
              final data = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
              );
            },
            icon: const Icon(Icons.date_range_outlined),
          )
      ],
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
            child: Flexible(
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
          ),
        );
      }).toList(),
    );
  }

  static TableRow buildCattleFeedRow(
      {required List<Widget> cells, bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? const Color.fromRGBO(245, 245, 245, 1) : Colors.white,
      ),
      children: cells.asMap().entries.map((entry) {
        Widget cell = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: cell,
          ),
        );
      }).toList(),
    );
  }
}

List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(DateTime(
        startDate.year,
        startDate.month,
        // In Dart you can set more than. 30 days, DateTime will do the trick
        startDate.day + i));
  }
  return days;
}

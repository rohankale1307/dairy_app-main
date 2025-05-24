import 'package:flutter/material.dart';

class EditCollectionButton extends StatelessWidget {
  const EditCollectionButton({
    super.key,
    required this.onSavePressed,
    required this.onDeletePressed,
  });

  final void Function() onSavePressed;
  final void Function() onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextButton(
            onPressed: onDeletePressed,
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              shape: WidgetStateProperty.all(
                const BeveledRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: onSavePressed,
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.black),
              shape: WidgetStateProperty.all(
                const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

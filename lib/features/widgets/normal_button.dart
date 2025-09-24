import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    super.key,
    required this.title,
    this.image,
    this.buttonColor,
    this.iconColor,
    this.titleColor,
    required this.onPressed,
  });

  final String title;
  final String? image;
  final Color? buttonColor;
  final Color? iconColor;
  final Color? titleColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromRGBO(0, 118, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: titleColor ?? Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                image ?? 'assets/images/arrow_right.svg',
                colorFilter: ColorFilter.mode(
                    iconColor ?? Colors.black, BlendMode.clear),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dairy_app/features/widgets/normal_button.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> features;
  final String buttonLabel;
  final void Function()? onPressed;

  const SubscriptionPlanWidget({
    super.key,
    required this.title,
    required this.description,
    required this.features,
    required this.buttonLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: const Color.fromRGBO(127, 127, 127, 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(236, 236, 236, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Feature List
          ...features.map((feature) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(feature,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: NormalButton(
              title: buttonLabel,
              onPressed: onPressed,
              titleColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

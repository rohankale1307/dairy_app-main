import 'package:flutter/material.dart';

import '../../common/Widgets/default_appbar.dart';
import '../../common/Widgets/plan_widget.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Back',
          context: context,
          backgroundColor: Colors.white,
          space: 1,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Text(
                  'Select Plan',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SubscriptionPlanWidget(
                title: '10-Days Free Trail',
                description: 'No credit/debit card details required.',
                features: const ['hhsdhhshj', 'dkjshhdssd', 'shdjhsdhj'],
                buttonLabel: 'Continue with free trail',
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SubscriptionPlanWidget(
                  title: 'Monthly Plan',
                  description: '₹200 per month',
                  features: const ['hhsdhhshj', 'dkjshhdssd', 'shdjhsdhj'],
                  buttonLabel: 'Continue with monthly plan',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

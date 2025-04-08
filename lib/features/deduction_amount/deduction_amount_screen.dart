import 'package:dairy_app/features/common/Widgets/advance_amount_widget.dart';
import 'package:dairy_app/features/common/Widgets/date_picker.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';
import 'new_deduction_amount_screen.dart';

class DeductionAmountScreen extends StatelessWidget {
  const DeductionAmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar.defaultAppbar(
        title: 'Deduction',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: DatePicker(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  color: const Color.fromRGBO(245, 245, 245, 1),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Deduction Amount',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '200000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewDeductionScreen(
                            isEdit: true,
                          ),
                        ),
                      );
                    },
                    child: const AdvanceAmountWidget(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Buttons.addCollectionButton(
        title: 'New Deduction',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewDeductionScreen(
                isEdit: false,
              ),
            ),
          );
        },
      ),
    );
  }
}

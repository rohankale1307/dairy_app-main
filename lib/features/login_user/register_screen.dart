import 'package:dairy_app/features/login_user/dairy_app_landing_page.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 90,
                    bottom: 40,
                    left: 8,
                    right: 8,
                  ),
                  child: Text(
                    'Open your account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                textFieldWidget(
                  lable: 'Phone Number',
                  prefixText: '+91 ',
                  keyboardType: TextInputType.phone,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: textFieldWidget(
                    lable: 'Dairy Name',
                  ),
                ),
                textFieldWidget(
                  lable: 'Password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: textFieldWidget(
                    lable: 'Confirm Password',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DairyAppLandingPage(),
                      ),
                    );
                  },
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
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'By continuing, you agree to the',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 144, 255, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldWidget({
    final TextInputType? keyboardType,
    required final String lable,
    final String? prefixText,
    final int? maxLength,
  }) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: lable,
        prefixText: prefixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

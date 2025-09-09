import 'package:dairy_app/features/login_user/register_screen.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/Widgets/default_appbar.dart';
import '../common/Widgets/text_form_field.dart';
import 'dairy_app_landing_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final DatabaseReference dbRef;
  Dio dio = Dio();
  bool isShowPassword = false;
  final mobileNumberRegex = RegExp(r'^\d{0,10}$');

  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child("users");
    // fetchData();
    super.initState();
  }

  void loginUser({
    required final String mobNo,
    required final String password,
  }) async {
    late DataSnapshot snapshot;
    Query query = dbRef.orderByChild('mobileNo').equalTo(mobNo);

    snapshot = await query.get().onError((e, st) {
      print('E $e');
      return snapshot;
    });

    if (snapshot.exists) {
      bool found = false;
      final users = snapshot.value as Map;

      users.forEach((key, value) {
        if (value['password'] == password) {
          setState(() {
            found = true;
          });
        }
      });

      if (found) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            duration: Duration(seconds: 1),
            content: Center(
              child: Text(
                "User Loged in Successfully",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        );
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DairyAppLandingPage(),
            ),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            duration: Duration(seconds: 1),
            content: Center(
              child: Text(
                "Invalid Login Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.purple,
          duration: Duration(seconds: 1),
          content: Center(
            child: Text(
              "User Not Registered",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      );
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      });
    }
  }

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 90,
                    bottom: 50,
                    left: 8,
                    right: 8,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: mobNoController,
                  lable: 'Phone Number',
                  prefixText: '+91 ',
                  keyboardType: TextInputType.phone,
                  onChanged: (final String value) {},
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomTextFormField(
                    controller: passwordController,
                    lable: 'Password',
                    onChanged: (final String value) {},
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: Icon(
                        isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: isShowPassword,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DairyAppLandingPage(),
                      ),
                    );
                    // loginUser(
                    //   mobNo: mobNoController.text,
                    //   password: passwordController.text,
                    // );
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromRGBO(0, 118, 255, 1)),
                    shape: WidgetStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LogIn',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextButton(
                    style: const ButtonStyle(
                        overlayColor:
                            WidgetStatePropertyAll(Colors.transparent)),
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dairy_app/features/login_user/login_screen.dart';
import 'package:dairy_app/features/widgets/normal_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/Widgets/default_appbar.dart';
import '../common/Widgets/text_form_field.dart';
import 'view/dairy_settings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController mobNoController = TextEditingController();
  TextEditingController dairyNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();
  late final DatabaseReference dbRef;
  bool isShowPass = false;
  bool isShowCnfPass = false;

  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref("users");
    super.initState();
  }

  void registerUser({
    required final String mobNo,
    required final String dairyName,
    required final String password,
    required final String cnfPassword,
  }) async {
    final userDataMap = {
      "mobileNo": mobNo,
      "dairyName": dairyName,
      "password": password,
      "cnfPassword": cnfPassword,
    };
    DatabaseReference userRef = dbRef.child(mobNo);
    final snapshot = await userRef.get();
    if (snapshot.exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.purple,
          duration: Duration(seconds: 1),
          content: Center(
            child: Text(
              "User is Already Exist. Please Login",
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
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    } else {
      await userRef.set(userDataMap).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            duration: Duration(seconds: 1),
            content: Center(
              child: Text(
                "User is Created. Please Login",
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
              builder: (context) => const LoginScreen(),
            ),
          );
        });
      }).onError((error, s) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            duration: Duration(seconds: 1),
            content: Center(
              child: Text(
                "Network Error. Please try After Some Time.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                ),
              ),
            ),
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
                    top: 30,
                    bottom: 40,
                    left: 8,
                    right: 8,
                  ),
                  child: Text(
                    'Craete your new \naccount',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: mobNoController,
                  lable: 'Phone number',
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
                    controller: dairyNameController,
                    lable: 'Dairy name',
                  ),
                ),
                CustomTextFormField(
                  controller: passwordController,
                  lable: 'Your full name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomTextFormField(
                    controller: dairyNameController,
                    lable: 'City / Villeage',
                  ),
                ),
                CustomTextFormField(
                  controller: passwordController,
                  lable: 'Password',
                  onChanged: (final String value) {},
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowPass = !isShowPass;
                      });
                    },
                    child: Icon(
                      isShowPass ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  obscureText: isShowPass,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomTextFormField(
                    controller: passwordController,
                    lable: 'Re-enter password',
                    onChanged: (final String value) {},
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowCnfPass = !isShowCnfPass;
                        });
                      },
                      child: Icon(
                        isShowCnfPass ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    obscureText: isShowCnfPass,
                  ),
                ),
                NormalButton(
                  title: 'Continue',
                  titleColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DairySettings(),
                      ),
                    );
                  },
                ),
                FittedBox(
                  child: Row(
                    children: [
                      const Text(
                        'By continuing, you agree to the',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(102, 102, 102, 1),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

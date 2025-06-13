import 'package:dairy_app/features/login_user/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
                  controller: mobNoController,
                  lable: 'Phone Number',
                  prefixText: '+91 ',
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: textFieldWidget(
                    controller: dairyNameController,
                    lable: 'Dairy Name',
                  ),
                ),
                textFieldWidget(
                  controller: passwordController,
                  lable: 'Password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: textFieldWidget(
                    controller: cnfPasswordController,
                    lable: 'Confirm Password',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    registerUser(
                      mobNo: mobNoController.text,
                      dairyName: dairyNameController.text,
                      password: passwordController.text,
                      cnfPassword: cnfPasswordController.text,
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
                FittedBox(
                  child: Row(
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
    required final TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
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

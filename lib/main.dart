import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/login_user/app_description_screen.dart';
import 'features/login_user/register_screen.dart';
import 'features/login_user/welcome_screen.dart';
import 'features/splash_screens/home_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    //<--updated
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDbD8HOvoXKR6sW2gYBhZn3z_0MZX5oagY',
          appId: '1:520165135938:android:eb339e1ce8458b50d8bfdb',
          messagingSenderId: '520165135938',
          projectId: 'dairy-app-d1983'));

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.figtreeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const RegisterScreen(),
    );
  }
}

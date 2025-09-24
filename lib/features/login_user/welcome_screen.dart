import 'package:flutter/material.dart';

import '../widgets/normal_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 118, 255, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                        ),
                      ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'DairyGo App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: NormalButton(
                  title: 'Open a new account',
                  image: 'assets/images/user.svg',
                  onPressed: () {},
                ),
              ),
              NormalButton(
                title: 'Open a new account',
                image: 'assets/images/log_in.svg',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

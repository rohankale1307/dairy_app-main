import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 118, 255, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/dairy_logo.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

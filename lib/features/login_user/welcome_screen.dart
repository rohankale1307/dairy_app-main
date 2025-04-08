import 'package:dairy_app/features/login_user/login_screen.dart';
import 'package:dairy_app/features/login_user/register_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'FigTree',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'My Dairy App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'FigTree',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: dottedLineWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: titleWithImage(
                  title: 'Open a new account',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                ),
              ),
              dottedLineWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: titleWithImage(
                  title: 'Login to My Dairy',
                  icon: Icons.logout,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
              dottedLineWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dottedLineWidget() {
    return const DottedLine(
      dashColor: Color.fromRGBO(191, 191, 191, 0.7),
      dashLength: 10,
      dashGapLength: 6,
    );
  }

  Widget titleWithImage({
    required final String title,
    required final IconData icon,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromRGBO(25, 25, 25, 1),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'FigTree',
            ),
          ),
          Icon(icon)
        ],
      ),
    );
  }
}

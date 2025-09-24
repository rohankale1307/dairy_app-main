import 'package:dairy_app/features/common/model/dairy_app_model.dart';
import 'package:dairy_app/features/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDescriptionScreen extends StatefulWidget {
  const AppDescriptionScreen({super.key});

  @override
  AppDescriptionScreenState createState() => AppDescriptionScreenState();
}

class AppDescriptionScreenState extends State<AppDescriptionScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<AppDescModel> appDecData = [
    AppDescModel(
      title: 'Automate Bills and Reports',
      subTitle:
          'Create bills and reports for milk, cattle feed, advances, and installments.',
      image: 'assets/images/file.svg',
    ),
    AppDescModel(
      title: 'Easy to Use',
      subTitle: 'A simple interface that makes your life easy.',
      image: 'assets/images/file.svg',
    ),
  ];

  void _nextPage() {
    if (_currentIndex < appDecData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle "Done" or navigate to home screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: appDecData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = appDecData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          data.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.clear,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 16),
                          child: Text(
                            data.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          data.subTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(appDecData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 40 : 20,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            // Next button
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                child: NormalButton(
                  title: 'Next',
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}

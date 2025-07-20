import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UtilsFile {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Lottie.asset('assets/animation/loading_animation.json',
                  width: 150, height: 150, fit: BoxFit.contain),
            ),
          );
        });
  }

  static void showErrorDialog(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    void Function() onTap,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Set to transparent to use custom border
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0), // Custom border radius
            child: Container(
              color: Colors.white, // Background color for the dialog
              //padding: const EdgeInsets.all(16.0), // Add padding around the content
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Shrink column to its content height
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    width: double.infinity,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // Add spacing between elements
                  Text(
                    message,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      margin:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                      child: Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static const chapterIconBaseUrl =
      'https://api.qeddev.codeclause.com/chapter_icons/';
  static const intrestinalAdID = 'ca-app-pub-3940256099942544/1033173712';
  static const rewardAdID = 'ca-app-pub-3940256099942544/5224354917';
  static const playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.example.app';
  static const subjectIconBaseUrl =
      'https://api.qeddev.codeclause.com/subject_icons/';
}

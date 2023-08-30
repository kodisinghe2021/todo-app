import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/components/head_font.dart';
import 'package:student_app/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController _getController =
      Get.put<SplashScreenController>(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInLeft(
              duration: const Duration(milliseconds: 2000),
              child: const HeadFont(text: "T"),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 2000),
              child: const HeadFont(text: "O"),
            ),
            FadeInDown(
              duration: const Duration(milliseconds: 2000),
              child: const HeadFont(text: "D"),
            ),
            FadeInRight(
              duration: const Duration(milliseconds: 2000),
              child: const HeadFont(text: "O"),
            ),
          ],
        ),
      ),
    );
  }
}

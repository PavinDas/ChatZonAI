import 'package:chatzon_ai/auth/main_screen.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/helper/pref.dart';
import 'package:chatzon_ai/screens/onboarding_screen.dart';
import 'package:chatzon_ai/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  //! Make 2.5 seconds delay on splash Screen and navigate to Home Screen
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        milliseconds: 2500,
      ),
      () {
        Get.off(
          () => Pref.showOnboarding
              ? const OnboardingScreen()
              : const MainScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //* Initializing device size
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: mainColor,
      //! Body
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Welcome text
            const Spacer(),
            const Text(
              appName,
              style: TextStyle(
                fontFamily: bold,
                fontSize: 35,
                color: whiteColor,
              ),
            ),

            //* App logo
            const Spacer(),
            Card(
              color: mainColor,
              elevation: 0,
              child: Image.asset(
                icon,
                width: mq.width * .45,
              ),
            ),

            //* Loading animation
            const Spacer(),
            const CustomLoading(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

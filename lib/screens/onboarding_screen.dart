import 'package:chatzon_ai/auth/main_screen.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/models/onboard.dart';
import 'package:chatzon_ai/screens/home_screen.dart';
import 'package:chatzon_ai/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      //* OnboardingScreen 1
      Onboard(
        title: asMekAnything,
        subtitle: askMeFrnd,
        lottie: aiChat,
      ),

      //* OnboardingScreen 2
      Onboard(
        title: imgToReality,
        subtitle: imgAnything,
        lottie: aiPlay,
      )
    ];

    //* Initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      // backgroundColor: mainColor,
      //! Body
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isLast = index == list.length - 1;

          return Column(
            children: [
              //* Animation
              Lottie.asset(
                list[index].lottie,
                height: mq.height * .6,
                width: isLast ? mq.width * .7 : null,
              ),

              //* Title
              Text(
                list[index].title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: bold,
                  color: whiteColor,
                ),
              ),

              //* Adding some space
              SizedBox(
                height: mq.height * .015,
              ),

              //* Subtitle
              Text(
                list[index].subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: regular,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(
                flex: 5,
              ),

              //* Dots
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: index == i ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == i ? secColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          7,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              //* Button
              CustomButton(
                onTap: () {
                  if (isLast) {
                    Get.off(
                      () => const MainScreen(),
                    );
                  } else {
                    c.nextPage(
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      curve: Curves.ease,
                    );
                  }
                },
                text: isLast ? finish : next,
              ),
              SizedBox(
                height: mq.height * .05,
              ),
            ],
          );
        },
      ),
    );
  }
}

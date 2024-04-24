import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/models/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    //* Initializing device size
    mq = MediaQuery.sizeOf(context);
    Animate.restartOnHotReload = true;

    //! Card
    return Card(
      color: bgColor,
      elevation: 0,
      margin: EdgeInsets.only(
        bottom: mq.height * .005,
        top: mq.height * .005,
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        onTap: homeType.onTap,
        child: homeType.leftAlign
            ? Row(
                children: [
                  //* Card image
                  SizedBox(
                    width: mq.width * .4,
                    height: mq.width * .6,
                    child: Padding(
                      padding: homeType.padding,
                      child: Lottie.asset(
                        homeType.lottie,
                      ),
                    ),
                  ),
                  const Spacer(),

                  //* Card content
                  Text(
                    homeType.title,
                    style: TextStyle(
                      fontSize: mq.width * 0.05,
                      fontFamily: semibold,
                      color: whiteColor,
                    ),
                  ),
                  const Spacer(
                      // flex: 1,
                      ),
                ],
              )
            : Row(
                children: [
                  const Spacer(
                      // flex: 1,
                      ),

                  //* Card content
                  Text(
                    homeType.title,
                    style: TextStyle(
                      fontSize: mq.width * 0.05,
                      fontFamily: semibold,
                      color: whiteColor,
                    ),
                  ),
                  //* Card image
                  SizedBox(
                    width: mq.width * .4,
                    height: mq.width * .6,
                    child: Padding(
                      padding: homeType.padding,
                      child: Lottie.asset(
                        homeType.lottie,
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
      ),
    ).animate().fade(duration: 1500.milliseconds, curve: Curves.easeIn);
  }
}

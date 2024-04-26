import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/models/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);

    return message.msgType == MessageType.bot

        //! Bot Message
        ? Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: mainColor,
                radius: 20,
                child: Image.asset(
                  icon,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: mq.width * .6,
                ),
                margin: EdgeInsets.only(
                  bottom: mq.height * .02,
                  left: mq.width * .02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01,
                  horizontal: mq.width * .02,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: blackColor.withOpacity(.1),
                      offset: const Offset(1, 3),
                    ),
                  ],
                  color: secColor,
                  border: Border.all(color: secColor),
                  borderRadius: const BorderRadius.only(
                    topLeft: r,
                    topRight: r,
                    bottomRight: r,
                  ),
                ),
                // child: Text(
                //   message.msg,
                //   style: const TextStyle(color: whiteColor, fontFamily: bold),
                // ),
                child: message.msg.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Please wait...🤓',
                            textStyle: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: bold,
                                color: whiteColor),
                            speed: const Duration(milliseconds: 50),
                          ),
                        ],
                        repeatForever: true,
                      )
                    : AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            message.msg,
                            textStyle: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: bold,
                                color: whiteColor),
                            speed: const Duration(milliseconds: 50),
                          ),
                        ],
                        totalRepeatCount: 4,
                        pause: const Duration(days: 1),
                      ),
              ),
            ],
          )
        :

        //! User Message
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: mq.width * .6,
                ),
                margin: EdgeInsets.only(
                  bottom: mq.height * .02,
                  right: mq.width * .02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01,
                  horizontal: mq.width * .02,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: blackColor.withOpacity(.1),
                      offset: const Offset(1, 3),
                    ),
                  ],
                  color: bgColor,
                  border: Border.all(color: secColor),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: r,
                    topLeft: r,
                    topRight: r,
                  ),
                ),
                child: Text(
                  message.msg,
                  style: const TextStyle(color: whiteColor, fontFamily: bold),
                ),
              ),
              const CircleAvatar(
                backgroundColor: mainColor,
                radius: 20,
                backgroundImage: AssetImage(
                  person,
                ),

                // child: Image.asset(
                //   person,
                // ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
  }
}

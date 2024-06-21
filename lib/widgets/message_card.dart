import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/helper/my_dialogs.dart';
import 'package:chatzon_ai/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
              GestureDetector(
                onLongPress: () async {
                  await Clipboard.setData(
                    ClipboardData(text: message.msg),
                  ).then(
                    (value) => MyDialog.info(
                      'Message copied to clipboard',
                    ),
                  );
                },
                child: Container(
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
                        offset: const Offset(
                          1,
                          3,
                        ),
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
                  child: message.msg.isEmpty
                      ? const Text(
                          'Please wait...🤓',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: bold,
                            color: whiteColor,
                          ),
                        )
                      : Text(
                          message.msg,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: bold,
                            color: whiteColor,
                          ),
                        ),
                ),
              ),
            ],
          )
        :

        //! User Message
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onLongPress: () async {
                  await Clipboard.setData(
                    ClipboardData(text: message.msg),
                  ).then(
                    (value) => MyDialog.info(
                      'Message copied to clipboard',
                    ),
                  );
                },
                child: Container(
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
                    border: Border.all(
                      color: secColor,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: r,
                      topLeft: r,
                      topRight: r,
                    ),
                  ),
                  child: Text(
                    message.msg,
                    style: const TextStyle(
                      color: whiteColor,
                      fontFamily: bold,
                    ),
                  ),
                ),
              ),
              const CircleAvatar(
                backgroundColor: mainColor,
                radius: 20,
                backgroundImage: AssetImage(
                  person,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
  }
}

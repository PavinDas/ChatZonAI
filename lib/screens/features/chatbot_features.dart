import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/controllers/chat_controller.dart';
import 'package:chatzon_ai/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatBotFeatures extends StatefulWidget {
  const ChatBotFeatures({super.key});

  @override
  State<ChatBotFeatures> createState() => _ChatBotFeaturesState();
}

class _ChatBotFeaturesState extends State<ChatBotFeatures> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mainColor,
      //! AppBar
      appBar: AppBar(
        title: const Text(
          aiChatBot,
        ),
      ),

      //! Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Row(
          children: [
            //* Text Form Field & Button
            Expanded(
              //* Text Form Field
              child: TextFormField(
                controller: _c.textC,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: whiteColor,
                  fontFamily: semibold,
                ),

                //* Text Form Field Styling
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  focusColor: whiteColor,
                  fillColor: secColor.withOpacity(.5),
                  hintText: askMeAnythingYouWant,
                  hintStyle: TextStyle(
                    color: textColor.withOpacity(
                      .7,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    borderSide: BorderSide(
                      color: secColor.withOpacity(.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    borderSide: BorderSide(
                      color: secColor.withOpacity(.5),
                      width: 2.0,
                    ),
                  ),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            //* Button
            CircleAvatar(
              radius: 25,
              backgroundColor: secColor.withOpacity(.5),
              child: IconButton(
                color: secColor,
                onPressed: _c.askQuestion,
                icon: const Icon(
                  Icons.rocket_launch_rounded,
                  color: whiteColor,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),

      //! Body
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding: EdgeInsets.only(
            top: mq.height * .02,
            bottom: mq.height * .1,
          ),
          children: _c.list
              .map(
                (element) => MessageCard(
                  message: element,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

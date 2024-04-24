import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBotFeatures extends StatefulWidget {
  const ChatBotFeatures({super.key});

  @override
  State<ChatBotFeatures> createState() => _ChatBotFeaturesState();
}

class _ChatBotFeaturesState extends State<ChatBotFeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
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
            //* Text Form Field
            Expanded(
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: askMeAnythingYouWant,
                  hintStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                  ),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: bgColor,
              child: IconButton(
                onPressed: () {},
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
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}

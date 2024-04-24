import 'package:chatzon_ai/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();

  final list = <Message>[].obs;

  void askQuestion() {
    if (textC.text.trim().isNotEmpty) {
      //* User
      list.add(Message(msg: textC.text, msgType: MessageType.user));

      //* Bot
      list.add(
          Message(msg: 'I received your message', msgType: MessageType.bot));

      textC.clear();
    }
  }
}

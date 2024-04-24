import 'package:chatzon_ai/apis/apis.dart';
import 'package:chatzon_ai/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController();

  final list = <Message>[
    Message(
      msg: 'Hello, How can I help you?',
      msgType: MessageType.bot,
    )
  ].obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      //* User
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));

      final res = await APIs.getAnswer(textC.text);

      //* Bot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));

      textC.text = '';
      _scrollDown();
    }
    textC.clear();
  }

  //* Automatically scroll to last message
  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}

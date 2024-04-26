import 'package:chatzon_ai/helper/my_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  final textC = TextEditingController();
  final resultC = TextEditingController();

  final from = ''.obs, to = ''.obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      // final res = await APIs.getAnswer(textC.text);

      textC.text = '';
    } else {
      MyDialog.info('Ask Something');
    }
    textC.clear();
  }
}

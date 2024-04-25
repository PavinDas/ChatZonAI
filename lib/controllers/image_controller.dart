import 'package:chatzon_ai/apis/api_keys.dart';
import 'package:chatzon_ai/helper/my_dialogs.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  String url = '';

  Future<void> createAiImage() async {
    if (textC.text.trim().isNotEmpty) {
      OpenAI.apiKey = apiKey;
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textC.text,
        n: 1,
        size: OpenAIImageSize.size512,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      url = image.data[0].url.toString();
      status.value = Status.complete;
    } else {
      MyDialog.info(
        'Provide some beautiful image description',
      );
    }
  }
}

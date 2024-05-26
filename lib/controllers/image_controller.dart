import 'dart:developer';
import 'dart:io';

import 'package:chatzon_ai/apis/api_keys.dart';
import 'package:chatzon_ai/apis/apis.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/helper/my_dialogs.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  final url = ''.obs;
  final imageList = <String>[].obs;

  Future<void> createAiImage() async {
    if (textC.text.trim().isNotEmpty) {
      OpenAI.apiKey = apiKey;
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textC.text,
        n: 1,
        size: OpenAIImageSize.size1024,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      url.value = image.data[0].url.toString();
      status.value = Status.complete;
    } else {
      MyDialog.info(
        'Provide some beautiful image description',
      );
    }
  }

  void downloadImage() async {
    try {
      //? Show Loading
      MyDialog.loading();

      log('url: $url');

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath:${file.path}');
      //* Save image to gallery
      await GallerySaver.saveImage(file.path, albumName: appName).then(
        (success) {
          //? Hide Loading
          Get.back();
          MyDialog.success('Image downloaded successfully');
        },
      );
    } catch (e) {
      //? Hide Loading
      Get.back();
      MyDialog.error('Someting went wrong (try again later)');
      log('downloadImageE: $e');
    }
  }

  void shareImage() async {
    try {
      //? Show Loading
      MyDialog.loading();

      log('url: $url');

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath:${file.path}');

      //? Hide Loading
      Get.back();

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Image created by ChatZon AI',
      );
    } catch (e) {
      //? Hide Loading
      Get.back();
      MyDialog.error('Someting went wrong (try again later)');
      log('downloadImageE: $e');
    }
  }

  Future<void> searchAiImages() async {
    //* If prompt is not empty
    if (textC.text.trim().isNotEmpty) {
      status.value = Status.loading;

      imageList.value = await APIs.searchAiImages(textC.text);

      if (imageList.isEmpty) {
        MyDialog.error(
          'Something went wrong (try again later)',
        );
        return;
      }

      url.value = imageList.first;
      status.value = Status.complete;
    } else {
      MyDialog.info(
        'Provide some beautiful image description',
      );
    }
  }
}

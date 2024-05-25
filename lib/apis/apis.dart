import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatzon_ai/apis/api_keys.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';

class APIs {
  //! Get Answer from ChatGPT
  static Future<String> getAnswer(String question) async {
    try {
      final res = await post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),

        //* header
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        },

        //* body
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            // "max_token": 1000,
            "temperature": 0,
            "messages": [
              {"role": "user", "content": question},
            ],
          },
        ),
      );
      final data = jsonDecode(res.body);
      log('Res : ${data['choices'][0]['message']['content']}');
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('getAnswerE: $e');
      return '$somethingWentWrong ($tryAgainLater  !)';
    }
  }

  //* Lexica Search Api
  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(res.body);

      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }

  static Future<String> googleTranslate({
    required String from,
    required String to,
    required String text,
  }) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);

      return res.text;
    } catch (e) {
      log('googleTranslateE: $e');
      return 'Something went wrong!';
    }
  }
}

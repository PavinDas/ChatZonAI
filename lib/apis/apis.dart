import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatzon_ai/constants/global.dart';
import 'package:http/http.dart';

class APIs {
  //! Get Answer from ChatGPT
  static void getAnswer(String question) async {
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
          "max_token": 2000,
          "temperature": 0,
          "messages": [
            {"role": "user", "content": question},
          ],
        },
      ),
    );

    final data = jsonDecode(res.body);

    log('Res: $data');
    log('Res : ${data['choices'][0]['message']['content']}');
  }
}

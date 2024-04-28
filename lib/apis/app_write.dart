import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:chatzon_ai/apis/api_keys.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('662de00d002c4ba55f54')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
        databaseId: 'AiBD',
        collectionId: 'ApiKey',
        documentId: 'chatGptKey',
      );
      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    } catch (e) {
      log('ApiKeyE: $e');
      return '';
    }
  }
}

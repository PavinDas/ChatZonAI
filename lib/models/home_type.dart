import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:flutter/material.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //* Title
  String get title => switch (this) {
        HomeType.aiChatBot => aiChatBot,
        HomeType.aiImage => aiImageGen,
        HomeType.aiTranslator => langtranslator,
      };

  //* Lottie
  String get lottie => switch (this) {
        HomeType.aiChatBot => aiWaving,
        HomeType.aiImage => aiPlay,
        HomeType.aiTranslator => aiChat,
      };

  //* Alignment
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };

  //* Padding
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
  };
}

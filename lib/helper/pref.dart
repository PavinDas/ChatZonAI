import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;

  static Future<void> Initialize() async {
    //? For accessing Hive to the app directory
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: 'myData');
  }

  static bool get showOnboarding => _box.get(
        'showOnboarding',
        defaultValue: true,
      );
  static set showOnboarding(bool value) => _box.put('showOnboarding', value);

  static bool get isDarkMode => _box.get('isDarkMode') ?? false;
  static set isDarkMode(bool value) => _box.put('isDarkMode', value);

  static ThemeMode get defaultTheme {
    final data = _box.get('isDarkMode');
    log('Data : $data');
    if (data == null) return ThemeMode.system;
    if (data == true) return ThemeMode.dark;
    return ThemeMode.light;
  }
}

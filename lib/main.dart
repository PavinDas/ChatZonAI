import 'package:chatzon_ai/apis/app_write.dart';
import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/helper/pref.dart';
import 'package:chatzon_ai/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //? For initialize Hive
  Pref.Initialize();

  //? For  initialize AppWrite
  AppWrite.init();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,

      //! Themes
      themeMode: Pref.defaultTheme,

      //* Dark theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: secColor.withOpacity(.2),
        //* AppBar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: secColor.withOpacity(.5),
          foregroundColor: whiteColor,
          elevation: 1,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: bold,
            fontSize: 25,
          ),
        ),
        //* Icon Theme
        iconTheme: const IconThemeData(
          color: mainColor,
          size: 26,
        ),
      ),

      //* Light theme
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
        //* AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: secColor,
          foregroundColor: whiteColor,
          elevation: 1,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: bold,
            fontSize: 25,
          ),
        ),
        //* Icon Theme
        iconTheme: const IconThemeData(
          color: mainColor,
          size: 26,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

extension AppTheme on ThemeData {
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;
}

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
      theme: ThemeData(
        //* AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: bgColor,
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

import 'package:chatzon_ai/constants/colors.dart';
import 'package:get/get.dart';

class MyDialog {
  //* Info
  static void info(String msg) {
    Get.snackbar(
      'Info',
      msg,
      colorText: secColor,
      backgroundColor: tabColor.withOpacity(.6),
    );
  }

  //* Success
  static void success(String msg) {
    Get.snackbar(
      'Info',
      msg,
      colorText: secColor,
      backgroundColor: tabColor.withOpacity(.6),
    );
  }

  //* Error
  static void error(String msg) {
    Get.snackbar(
      'Info',
      msg,
      colorText: secColor,
      backgroundColor: tabColor.withOpacity(.6),
    );
  }
}

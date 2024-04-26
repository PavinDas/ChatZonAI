import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return
        //* Button
        Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: secColor,
          foregroundColor: whiteColor,
          minimumSize: Size(
            mq.width * .4,
            50,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: bold,
          ),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

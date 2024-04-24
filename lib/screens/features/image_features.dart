import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:flutter/material.dart';

class ImageFeatures extends StatefulWidget {
  const ImageFeatures({super.key});

  @override
  State<ImageFeatures> createState() => _ImageFeaturesState();
}

class _ImageFeaturesState extends State<ImageFeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      //! AppBar
      appBar: AppBar(
        title: const Text(
          aiImageGen,
        ),
      ),

      //! Body
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}

import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:flutter/material.dart';

class TranslatorFeatures extends StatefulWidget {
  const TranslatorFeatures({super.key});

  @override
  State<TranslatorFeatures> createState() => _TranslatorFeaturesState();
}

class _TranslatorFeaturesState extends State<TranslatorFeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      //! AppBar
      appBar: AppBar(
        title: const Text(
          langtranslator,
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

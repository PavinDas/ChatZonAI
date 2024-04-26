import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:chatzon_ai/controllers/translate_controller.dart';
import 'package:chatzon_ai/widgets/custom_button.dart';
import 'package:chatzon_ai/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslatorFeatures extends StatefulWidget {
  const TranslatorFeatures({super.key});

  @override
  State<TranslatorFeatures> createState() => _TranslatorFeaturesState();
}

class _TranslatorFeaturesState extends State<TranslatorFeatures> {
  final _c = TranslateController();

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
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: mq.height * .02,
            bottom: mq.height * .1,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //* From language
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: () => Get.bottomSheet(
                    LanguageSheet(
                      c: _c,
                      s: _c.from,
                    ),
                  ),
                  child: Container(
                    height: 50,
                    width: mq.width * .4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: textColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Obx(
                      () => Text(
                        _c.from.isEmpty ? 'Auto' : _c.from.value,
                        style: const TextStyle(
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),

                //* Icon
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.repeat,
                    color: textColor,
                  ),
                  onPressed: () {},
                ),

                //* To language
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: () => Get.bottomSheet(
                    LanguageSheet(
                      c: _c,
                      s: _c.to,
                    ),
                  ),
                  child: Container(
                    height: 50,
                    width: mq.width * .4,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: textColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Obx(
                      () => Text(
                        _c.to.isEmpty ? 'To' : _c.to.value,
                        style: const TextStyle(
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //* Text Form Field
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mq.width * .02,
                vertical: mq.height * .03,
              ),
              child: TextFormField(
                style: const TextStyle(
                  color: whiteColor,
                  fontFamily: semibold,
                ),
                cursorColor: whiteColor,
                controller: _c.textC,
                textAlign: TextAlign.center,
                minLines: 5,
                maxLines: null,

                //* Text Form Field Styling
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  focusColor: whiteColor,
                  fillColor: bgColor,
                  hintText: 'Translate text',
                  hintStyle: TextStyle(
                    color: whiteColor.withOpacity(
                      .7,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    borderSide: const BorderSide(
                      color: textColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    borderSide: const BorderSide(
                      color: textColor,
                      width: 2.0,
                    ),
                  ),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),

            //* Result Text Form Field
            if (_c.resultC.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .02,
                ),
                child: TextFormField(
                  style: const TextStyle(
                    color: whiteColor,
                    fontFamily: semibold,
                  ),
                  cursorColor: whiteColor,
                  controller: _c.textC,
                  textAlign: TextAlign.center,
                  maxLines: null,

                  //* Text Form Field Styling
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    focusColor: whiteColor,
                    fillColor: bgColor,
                    hintText: 'Result',
                    hintStyle: TextStyle(
                      color: whiteColor.withOpacity(
                        .7,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      borderSide: const BorderSide(
                        color: textColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      borderSide: const BorderSide(
                        color: textColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),
              ),

            SizedBox(
              height: mq.height * .04,
            ),

            //* Button
            CustomButton(
              onTap: () {},
              text: 'Translate',
            ),
          ],
        ),
      ),
    );
  }
}

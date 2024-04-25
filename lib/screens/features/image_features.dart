import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:chatzon_ai/controllers/image_controller.dart';
import 'package:chatzon_ai/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageFeatures extends StatefulWidget {
  const ImageFeatures({super.key});

  @override
  State<ImageFeatures> createState() => _ImageFeaturesState();
}

class _ImageFeaturesState extends State<ImageFeatures> {
  final _c = ImageController();
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
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: mq.height * .02,
            bottom: mq.height * .1,
            left: mq.width * .04,
            right: mq.width * .04,
          ),
          children: [
            //* Text Form Field
            TextFormField(
              controller: _c.textC,
              textAlign: TextAlign.center,
              minLines: 2,
              maxLines: null,

              //* Text Form Field Styling
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                focusColor: whiteColor,
                fillColor: bgColor,
                hintText:
                    'Type here something wonderful\nI will create it for you',
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

            //* Ai Image
            Container(
              height: mq.height * .5,
              alignment: Alignment.center,
              child: Lottie.asset(
                aiPlay,
                height: mq.height * .3,
              ),
            ),

            //* Button
            CustomButton(
              onTap: () {},
              text: 'Create Image',
            ),
          ],
        ),
      ),
    );
  }
}

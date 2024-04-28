import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/images.dart';
import 'package:chatzon_ai/constants/strings.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:chatzon_ai/controllers/image_controller.dart';
import 'package:chatzon_ai/widgets/custom_button.dart';
import 'package:chatzon_ai/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      // backgroundColor: mainColor,
      //! AppBar
      appBar: AppBar(
        title: const Text(
          aiImageGen,
        ),
        actions: [
          Obx(
            () => _c.status.value == Status.complete
                ? IconButton(
                    padding: const EdgeInsets.only(right: 10),
                    onPressed: _c.shareImage,
                    icon: const Icon(
                      Icons.share,
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),

      //! Download Button
      floatingActionButton: Obx(
        () => _c.status.value == Status.complete
            ? Padding(
                padding: const EdgeInsets.only(
                  right: 6,
                  bottom: 6,
                ),
                child: FloatingActionButton(
                  backgroundColor: secColor,
                  foregroundColor: whiteColor,
                  onPressed: _c.downloadImage,
                  child: const Icon(
                    Icons.save_alt_rounded,
                    size: 26,
                  ),
                ),
              )
            : const SizedBox(),
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
              style: const TextStyle(
                color: whiteColor,
                fontFamily: semibold,
              ),
              cursorColor: whiteColor,
              controller: _c.textC,
              textAlign: TextAlign.center,
              minLines: 2,
              maxLines: null,

              //* Text Form Field Styling
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                focusColor: whiteColor,
                fillColor: secColor.withOpacity(.5),
                hintText:
                    'Type here something wonderful\nI will create it for you',
                hintStyle: TextStyle(
                  color: tabColor.withOpacity(
                    .7,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: BorderSide(
                    color: secColor.withOpacity(.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: BorderSide(
                    color: secColor.withOpacity(.5),
                    width: 2.0,
                  ),
                ),
              ),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),

            //* Ai Image
            Container(
              height: mq.height * .5,
              margin: EdgeInsets.symmetric(
                vertical: mq.height * .015,
              ),
              alignment: Alignment.center,
              child: Obx(
                () => _aiImage(),
              ),
            ),

            //* Button
            CustomButton(
              onTap: _c.createAiImage,
              text: 'Create Image',
            ),
          ],
        ),
      ),
    );
  }

  Widget _aiImage() => ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: switch (_c.status.value) {
          Status.none => Lottie.asset(
              aiPlay,
              height: mq.height * .3,
            ),
          Status.loading => const CustomLoading(),
          Status.complete => CachedNetworkImage(
              imageUrl: _c.url.value,
              placeholder: (context, url) => const CustomLoading(),
              errorWidget: (context, url, error) => const SizedBox(),
            ),
        },
      );
}

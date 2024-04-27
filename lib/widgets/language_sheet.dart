import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/constants/styles.dart';
import 'package:chatzon_ai/controllers/translate_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController c;
  final RxString s;

  const LanguageSheet({
    super.key,
    required this.c,
    required this.s,
  });

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * .5,
      decoration: const BoxDecoration(
        color: secColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: mq.width * .04,
              right: mq.width * .04,
              top: mq.height * .02,
            ),
            child: TextFormField(
              style: const TextStyle(
                color: whiteColor,
                fontFamily: semibold,
              ),
              cursorColor: whiteColor,
              // controller: _c.textC,
              onChanged: (s) => _search.value = s.toLowerCase(),

              //* Text Form Field Styling
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.translate_rounded,
                  color: whiteColor,
                ),
                filled: true,
                isDense: true,
                focusColor: whiteColor,
                fillColor: mainColor,
                hintText: 'Search Language',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: whiteColor.withOpacity(
                    .7,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  borderSide:  BorderSide(
                    color: secColor.withOpacity(.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  borderSide:  BorderSide(
                    color: secColor.withOpacity(.5),
                    width: 2.0,
                  ),
                ),
              ),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),
          ),

          //* Languages list
          Expanded(child: Obx(
            () {
              final List<String> list = _search.isEmpty
                  ? widget.c.lang
                  : widget.c.lang
                      .where(
                        (e) => e.toLowerCase().contains(_search.value),
                      )
                      .toList();
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: mq.width * .06,
                  top: mq.width * .04,
                ),
                itemCount: list.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      widget.s.value = list[i];
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: mq.width * .023,
                      ),
                      child: Text(
                        list[i],
                        style: const TextStyle(
                          color: whiteColor,
                          fontFamily: semibold,
                          fontSize: 16,
                          letterSpacing: .7,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}

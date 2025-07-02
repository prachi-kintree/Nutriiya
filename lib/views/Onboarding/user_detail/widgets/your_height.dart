import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/CustomWidgets/Textfields/sliding_tab_selector.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';

class YourHeight extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  const YourHeight({super.key, required this.controller});

  @override
  State<YourHeight> createState() => _YourHeightState();
}

class _YourHeightState extends State<YourHeight> {
  double height = 75.0;
  bool isCm = true;
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    _rulerPickerController = RulerPickerController(value: height);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("How tall are you?",
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                TextStyle(fontSize: 26.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.medium)),
        20.sBH,
        Text("Let us know your height to fine-tune your journey.",
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                TextStyle(fontSize: 16.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular)),
        30.sBH,
        SlidingTabSelector(
          width: 100.w,
          height: 20.h,
          padding: EdgeInsets.all(2.h),
          options: const ['CM', 'FT'],
          initialIndex: isCm ? 0 : 1,
          onChanged: (index) {
            setState(() {
              if(isCm) {
                isCm = false;
              } else {
                isCm = true;
              }
            });
            print("Selected index: $index");
          },
        ),
        40.sBH,

        Row(
          children: [
            SizedBox(
              height: 200.h,
              width: 120.w,
              child: RotatedBox(
                quarterTurns: -1, // rotate 90 degrees counter-clockwise
                child: RulerPicker(
                  controller: _rulerPickerController!,
                  rulerMarginTop: 0,
                  ranges: [
                    RulerRange(begin: isCm ? 20 : 5, end: isCm ? 300 : 9, scale: 0.5)
                  ],
                  marker: Padding(
                    padding: EdgeInsets.only(left: 100.h),
                    child: Container(
                      height: 60.h,
                      width: 4.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen,
                      ),
                    ),
                  ),
                  scaleLineStyleList: [
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 80.h, scale: 0),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40.h, scale: 5),
                    ScaleLineStyle(
                        color: Colors.grey, width: 1.5, height: 40.h, scale: -1)
                  ],
                  width: 300.h, // since we rotated, width becomes height
                  height: MediaQuery.of(context).size.width,
                  rulerBackgroundColor: Colors.white,
                  onValueChanged: (num value) {
                    setState(() {
                      height = value.toDouble();
                    });
                  },
                  onBuildRulerScaleText: (int index, num rulerScaleValue) {
                    return "${rulerScaleValue.toInt()}";
                  },
                ),
              ),
            ),
            20.sBW,
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: height.toStringAsFixed(1),
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                          TextStyle(fontSize: 60.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.medium)),
                  TextSpan(text: "  ${isCm ? 'cm' : 'ft'}",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                          TextStyle(fontSize: 20.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .subtitleGrey),
                          outfitFont: OutfitFontStyle.medium)),
                ]
            )),
          ],
        ),

        // Spacer(),
        // CustomButton(
        //     buttonText: "Continue",
        //     padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
        //     buttonTextStyle: AppTextStyle.outfitStyle(
        //         withTextStyle: TextStyle(fontSize: 16.sp),
        //         outfitFont: OutfitFontStyle.medium),
        //     width: 500.w,
        //     onPressed: (startLoading, stopLoading, btnState) {
        //       widget.controller.changeCurrentPage();
        //     },
        //     isDisabled: false,
        //     disableElevation: false)
      ],
    );
  }
}

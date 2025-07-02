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

class YourTargetWeight extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  const YourTargetWeight({super.key, required this.controller});

  @override
  State<YourTargetWeight> createState() => _YourTargetWeightState();
}

class _YourTargetWeightState extends State<YourTargetWeight> {
  double weight = 75.0;
  bool isKg = true;
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    _rulerPickerController = RulerPickerController(value: weight);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("What’s your target weight?",
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                    TextStyle(fontSize: 26.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.medium)),
        20.sBH,
        Text("Lorem Ipsum is dummy text",
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                    TextStyle(fontSize: 16.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular)),
        30.sBH,
        SlidingTabSelector(
          width: 100.w,
          height: 20.h,
          padding: EdgeInsets.all(2.h),
          options: const ['KG', 'LB'],
          initialIndex: isKg ? 0 : 1,
          onChanged: (index) {
            setState(() {
              if(isKg) {
                isKg = false;
              } else {
                isKg = true;
              }
            });
            print("Selected index: $index");
          },
        ),
        40.sBH,
        RichText(text: TextSpan(
          children: [
            TextSpan(text: weight.toStringAsFixed(1),
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                    TextStyle(fontSize: 60.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.medium)),
            TextSpan(text: "  ${isKg ? 'kg' : 'lb'}",
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                    TextStyle(fontSize: 20.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .subtitleGrey),
                    outfitFont: OutfitFontStyle.medium)),
          ]
        )),
        SizedBox(height: 20.h),
        RulerPicker(
          controller: _rulerPickerController!,
          rulerMarginTop: 0,
          ranges: [
            RulerRange(begin: isKg ? 20 : 40, end: isKg ? 300 : 550, scale: 1)],
          marker: Padding(
            padding:  EdgeInsets.only(left: 30.w),
            child: Container(
              height: 60.h,
              width: 4.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .primaryGreen),
            ),
          ),
          // endValue: 90,
          // initValue: weight.toInt(),

          scaleLineStyleList: [
            ScaleLineStyle(
                color: Colors.grey, width: 1.5, height: 80.h, scale: 0),
            ScaleLineStyle(
                color: Colors.grey, width: 1.5, height: 40.h, scale: 5),
            ScaleLineStyle(
                color: Colors.grey, width: 1.5, height: 40.h, scale: -1)
          ],

          width: MediaQuery.of(context).size.width,
          height: 100.h,
          rulerBackgroundColor: Colors.white,
          onValueChanged: (num value) {
            setState(() {
              weight = value.toDouble();
            });
          },
          onBuildRulerScaleText: (int index, num rulerScaleValue) {
            return "${rulerScaleValue.toInt()}";
          },
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

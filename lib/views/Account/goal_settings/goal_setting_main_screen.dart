import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Button/custom_outlined_button.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/bottom_sheets/common_bottomsheet.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class GoalSettingMainScreen extends StatefulWidget {
  const GoalSettingMainScreen({super.key});

  @override
  State<GoalSettingMainScreen> createState() => _GoalSettingMainScreenState();
}

class _GoalSettingMainScreenState extends State<GoalSettingMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Goal Settings',
      ),
      body: Container(
          height: 1.sh,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(gradient: AppDecoration().scaffoldGradient),
          child: Column(
            children: [
              Container(
                height: 290.h,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    boxShadow: AppDecoration.addShadow(),
                    color: Colors.white),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  spacing: 10.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Current Weight',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                        InkWell(
                          onTap: () {
                            scaleBottomSheet(
                                title: 'Are you sure?',
                                subtitle:
                                    'Are you sure you want to update your current weight?',
                                inSheetTitle: 'Current Weight',
                                context: context,
                                isKg: true,
                                weight: 90.0);
                          },
                          child: Text('90.0 kg',
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xffF54336)),
                                  outfitFont: OutfitFontStyle.regular)),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Good Weight',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                        InkWell(
                          onTap: () {
                            scaleBottomSheet(
                                title: 'Are you sure?',
                                subtitle: 'Slide to adjust your weight',
                                inSheetTitle: 'Target Weight',
                                context: context,
                                isKg: true,
                                weight: 75.0);
                          },
                          child: Text('75.0 kg',
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xffFF981F)),
                                  outfitFont: OutfitFontStyle.regular)),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Height',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                        InkWell(
                          onTap: () {
                            scaleBottomSheet(
                                title: 'Are you sure?',
                                subtitle: 'Do you want to change height?',
                                inSheetTitle: 'Height',
                                context: context,
                                isKg: false,
                                isHeight: true,
                                weight: 168.0);
                          },
                          child: Text('168.0 cm',
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color:
                                          ThemeManagerPlus.of<AppTheme>(context)
                                              .currentTheme
                                              .primaryGreen),
                                  outfitFont: OutfitFontStyle.regular)),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    //!  daily water goal has been placed in water reminder screen
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Daily Water Goal',
                    //         style: AppTextStyle.outfitStyle(
                    //             withTextStyle: TextStyle(
                    //                 fontSize: 16.sp, color: Colors.black),
                    //             outfitFont: OutfitFontStyle.regular)),
                    //     const Spacer(),
                    //     SvgPicture.asset(
                    //       svgForwardArrow,
                    //       color: Colors.black,
                    //     ),
                    //     10.sBW,
                    //   ],
                    // ),
                    // Divider(
                    //   height: 10.h,
                    //   thickness: 1.h,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Daily Steps Goal',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                        InkWell(
                          onTap: () {
                            appNavigator.pushNamed(routeStepEditScreen);
                          },
                          child: Text('8000 Steps',
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xffFFC600)),
                                  outfitFont: OutfitFontStyle.regular)),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Body Mass Index (BMI)',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                        Text('24.4 Normal',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        ThemeManagerPlus.of<AppTheme>(context)
                                            .currentTheme
                                            .primaryGreen),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        appNavigator.pushNamed(routeChangePreferencesScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Change Preferences',
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 16.sp, color: Colors.black),
                                  outfitFont: OutfitFontStyle.regular)),
                          const Spacer(),
                          SvgPicture.asset(
                            svgForwardArrow,
                            color: Colors.black,
                          ),
                          10.sBW,
                        ],
                      ),
                    ),
                    // Divider(
                    //   height: 10.h,
                    //   thickness: 1.h,
                    // ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Future<void> scaleBottomSheet(
      {required BuildContext context,
      required String title,
      required String subtitle,
      required String inSheetTitle,
      bool isHeight = false,
      required bool isKg,
      required double weight}) {
    return openBottomSheet(
        isCancelable: false,
        isOnlyChild: true,
        height: 140.h,
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                        TextStyle(fontSize: 26.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.medium)),
            10.sBH,
            Divider(
              height: 10.h,
              thickness: 1.h,
              indent: 35,
              endIndent: 35,
            ),
            10.sBH,
            Text(subtitle,
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                        TextStyle(fontSize: 14.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.regular)),
            15.sBH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOutlinedButton(
                    onPressed: (startLoading, stopLoading, btnState) {
                      appNavigator.goBack();
                    },
                    height: 42.h,
                    borderColor: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .primaryGreen,
                    buttonColor: Colors.transparent,
                    buttonTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.medium),
                    width: 155.w,
                    buttonText: 'No'),
                10.sBW,
                CustomOutlinedButton(
                    onPressed: (startLoading, stopLoading, btnState) {
                      appNavigator.goBack();

                      openBottomSheet(
                          isCancelable: false,
                          isOnlyChild: true,
                          height: 210.h,
                          context: context,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              RulerPickerController? rulerPickerController =
                                  RulerPickerController(value: weight);
                              return Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () {
                                        appNavigator.goBack();
                                      },
                                      child: Text('Done  ',
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: ThemeManagerPlus.of<
                                                          AppTheme>(context)
                                                      .currentTheme
                                                      .primaryGreen),
                                              outfitFont:
                                                  OutfitFontStyle.medium)),
                                    ),
                                  ),
                                  15.sBH,
                                  Text(inSheetTitle,
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 26.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.medium)),
                                  20.sBH,
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: weight.toStringAsFixed(1),
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 48.sp,
                                                color: Colors.black),
                                            outfitFont:
                                                OutfitFontStyle.medium)),
                                    TextSpan(
                                        text:
                                            "   ${isHeight ? 'cm' : isKg ? 'kg' : 'lb'}",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: ThemeManagerPlus.of<
                                                        AppTheme>(context)
                                                    .currentTheme
                                                    .subtitleGrey),
                                            outfitFont:
                                                OutfitFontStyle.medium)),
                                  ])),
                                  10.sBH,
                                  RulerPicker(
                                    controller: rulerPickerController,
                                    rulerMarginTop: 0,
                                    ranges: [
                                      RulerRange(
                                          begin: isKg ? 20 : 40,
                                          end: isKg ? 300 : 550,
                                          scale: 1)
                                    ],
                                    marker: Padding(
                                      padding: EdgeInsets.only(left: 30.w),
                                      child: Container(
                                        height: 60.h,
                                        width: 4.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                ThemeManagerPlus.of<AppTheme>(
                                                        context)
                                                    .currentTheme
                                                    .primaryGreen),
                                      ),
                                    ),
                                    // endValue: 90,
                                    // initValue: weight.toInt(),

                                    scaleLineStyleList: [
                                      ScaleLineStyle(
                                          color: Colors.grey,
                                          width: 1.5,
                                          height: 80.h,
                                          scale: 0),
                                      ScaleLineStyle(
                                          color: Colors.grey,
                                          width: 1.5,
                                          height: 40.h,
                                          scale: 5),
                                      ScaleLineStyle(
                                          color: Colors.grey,
                                          width: 1.5,
                                          height: 40.h,
                                          scale: -1)
                                    ],

                                    width: MediaQuery.of(context).size.width,
                                    height: 100.h,
                                    rulerBackgroundColor: Colors.white,
                                    onValueChanged: (num value) {
                                      Future.microtask(() {
                                        if (mounted) {
                                          setState(() {
                                            log('print');
                                            weight = value.toDouble();
                                          });
                                        }
                                      });
                                    },
                                    onBuildRulerScaleText:
                                        (int index, num rulerScaleValue) {
                                      return "${rulerScaleValue.toInt()}";
                                    },
                                  )
                                ],
                              );
                            },
                          ));
                    },
                    height: 42.h,
                    borderColor: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .primaryGreen,
                    buttonColor: Colors.transparent,
                    buttonTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.medium),
                    width: 155.w,
                    buttonText: 'Yes')
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../widget/gradient_scaffold.dart';

class BmiReport extends StatefulWidget {
  // final UserBasicDetailsViewModel controller;

  const BmiReport({super.key});

  @override
  State<BmiReport> createState() => _BmiReportState();
}

class _BmiReportState extends State<BmiReport> {
  final double _bmiValue = 24.4;
  List<Legend> legends = [
    Legend(
        color: const Color(0xff1A96F0),
        legendDesc: "Very severely underweight", range: "BMI < 16.0"),
    Legend(color: const Color(0xff00A9F1), legendDesc: "Severely underweight", range: "BMI 16.0 - 16.9"),
    Legend(color: const Color(0xff00BCD3), legendDesc: "Underweight", range: "BMI 17.0 - 18.4"),
    Legend(color: const Color(0xff4AAF57), legendDesc: "Normal", range: "BMI 18.5 - 24.9"),
    Legend(color: const Color(0xffFFC02D), legendDesc: "Overweight", range: "BMI 25.0 - 29.9"),
    Legend(color: const Color(0xffFF981F), legendDesc: "Obese Class I", range: "BMI 30.0 - 34.9"),
    Legend(color: const Color(0xffFF5726), legendDesc: "Obese Class II", range: "BMI 35.0 - 39.9"),
    Legend(color: const Color(0xffF54336), legendDesc: "Obese Class III", range: "BMI > 40.0"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:
      Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
        child: Consumer<UserBasicDetailsViewModel>(
            builder: (context, controller, child) {
              return CustomButton(
                  buttonText: "Next",
                  padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                  buttonTextStyle: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(fontSize: 16.sp),
                      outfitFont: OutfitFontStyle.medium),
                  width: 500.w,
                  onPressed: (startLoading, stopLoading, btnState) {
                    controller.changeCurrentPage();
                    appNavigator.goBack();
                  },
                  isDisabled: false,
                  disableElevation: false);
            }),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const CustomGradientBackground(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  20.sBH,
                  Text("BMI (kg/m2)",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 26.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.medium)),
                  10.sBH,
                  // Text("What do you usually eat?",
                  //     style: AppTextStyle.outfitStyle(
                  //         withTextStyle:
                  //         TextStyle(fontSize: 16.sp, color: Colors.black),
                  //         outfitFont: OutfitFontStyle.regular)),
                  _userBMIMeter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _userBMIMeter() {
    return Column(
      children: [
        10.sBH,
        Container(
          padding: EdgeInsets.all(15.h),
            // height: 300.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: BmiResultBar(bmiValue: _bmiValue,)),
        20.sBH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _profileStatItem(title: 'Height', value: '168', unit: 'cm'),
            _profileStatItem(title: 'Weight', value: '90', unit: 'kg'),
            _profileStatItem(title: 'Age', value: '26'),
            _profileStatItem(title: 'Gender', value: 'Male'),
          ],
        ),
        25.sBH,
        _legends()
        // const CustomDropdown(
        //   options: [
        //     "Dairy / Lactose",
        //     "Gluten / Wheat",
        //     "Eggs",
        //     "Shellfish",
        //     "Seafood",
        //     "Spices (e.g., red chili, mustard seeds)",
        //     "Soy",
        //     "Citrus fruits",
        //     "Other (Add manually)"
        //   ],
        //   selectedValue: 'Allergy',
        // ),
        // // 10.sBH,
        //
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
        //     disableElevation: false),
      ],
    );
  }

  Widget _legends() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        spacing: 5.h,
        children: legends
            .map((e) => Row(
                  children: [
                    Container(
                      height: 20.h,
                      width: 20.w,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: e.color),
                    ),
                    20.sBW,
                    Text(e.legendDesc,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(fontSize: 12.sp, color: e.range.toString() == "BMI 18.5 - 24.9" ? ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .light_black_text_color : ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .subtitleGrey),
                            outfitFont: e.range.toString() == "BMI 18.5 - 24.9" ? OutfitFontStyle.medium : OutfitFontStyle.regular )),
                    const Spacer(),
                    Text(e.range,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(fontSize: 12.sp, color: e.range.toString() == "BMI 18.5 - 24.9" ? ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .light_black_text_color : ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .subtitleGrey),
                            outfitFont: e.range.toString() == "BMI 18.5 - 24.9" ? OutfitFontStyle.medium : OutfitFontStyle.regular)),
                  ],
                ))
            .toList(),
      ),
    );
  }

  _profileStatItem({
    required String title,
    required String value,
    String? unit,
    bool isValueBold = true,
    Color valueColor = const Color(0xff42A004), // your green color
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .subtitleGrey),
              outfitFont: OutfitFontStyle.medium)

        ),
        10.sBH,
        unit != null
            ? RichText(
          text: TextSpan(
            style: TextStyle(
              color: valueColor,
            ),
            children: [
              TextSpan(
                text: value,
                style: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(fontSize: 20.sp),
                    outfitFont: isValueBold ? OutfitFontStyle.medium : OutfitFontStyle.regular)

              ),
              TextSpan(
                text: ' $unit',
                style: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(fontSize: 14.sp),
                    outfitFont: OutfitFontStyle.regular),
              ),
            ],
          ),
        )
            : Text(
          value,
          style: TextStyle(
            fontSize: 20,
            color: valueColor,
            fontWeight: isValueBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class Legend {
  final Color color;
  final String legendDesc;
  final String range;

  Legend({required this.color, required this.legendDesc, required this.range});
}


class BmiResultBar extends StatelessWidget {
  final double bmiValue; // e.g., 24.4

  const BmiResultBar({super.key, required this.bmiValue});

  @override
  Widget build(BuildContext context) {
    String bmiLabel = _getBmiLabel(bmiValue);
    Color labelColor = _getBmiLabelColor(bmiValue);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Your BMI Result',
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 20.sp),
              outfitFont: OutfitFontStyle.medium),
        ),
        8.sBH,
        Text(
          bmiValue.toStringAsFixed(1),
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 40.sp),
              outfitFont: OutfitFontStyle.semibold),
        ),
        8.sBH,
        SfLinearGauge(
          minimum: 0,
          maximum: 50,
          showLabels: false,
          showTicks: false,
          animateAxis: true,
          animationDuration: 300,
          animateRange: true,

          // barPointers: [
          //   LinearBarPointer(
          //     value: bmiValue,
          //     thickness: 20,
          //     color: Colors.transparent, // transparent, as we'll use ranges
          //   )
          // ],
          axisTrackStyle: const LinearAxisTrackStyle(
            thickness: 0.1,
            edgeStyle: LinearEdgeStyle.bothCurve,
            color: Colors.transparent,
          ),


          markerPointers: [
            LinearWidgetPointer(
              value: bmiValue,
              position: LinearElementPosition.cross,
              child: Container(
                margin: EdgeInsets.only(bottom: 25.h),
                width: 1,
                height: 40.h, // make sure it's not larger than the gauge
                color: Colors.black,
              ),
            ),

          ],


          ranges: [
            LinearGaugeRange(edgeStyle: LinearEdgeStyle.startCurve,startWidth: 26.h,endWidth: 26.h,startValue: 0, endValue: 16, color: Color(0xff1A96F0)),
            LinearGaugeRange(startWidth: 26.h,endWidth: 26.h,startValue: 16, endValue: 16.9, color: Color(0xff00A9F1)),
            LinearGaugeRange(startWidth: 26.h,endWidth: 26.h,startValue: 16.9, endValue: 18.4, color: Color(0xff00BCD3)),
            LinearGaugeRange(startWidth: 26.h,endWidth: 26.h,startValue: 18.4, endValue: 24.9, color: Color(0xff4AAF57)),
            LinearGaugeRange(startWidth: 26.h,endWidth: 26.h,startValue: 24.9, endValue: 29.9, color: Color(0xffFFC02D)),
            LinearGaugeRange(startWidth: 26.h,endWidth: 26.h,startValue: 29.9, endValue: 34.9, color: Color(0xffFF981F)),
            LinearGaugeRange(startWidth: 26.h,endWidth: 26.h,startValue: 34.9, endValue: 39.9, color: Color(0xffFF5726)),
            LinearGaugeRange(edgeStyle: LinearEdgeStyle.endCurve,startWidth: 26.h,endWidth: 26.h,startValue: 39.9, endValue: 50, color: Color(0xffF54336)),
          ],
        ),
         // SizedBox(height: 5.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: labelColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            bmiLabel,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                outfitFont: OutfitFontStyle.medium),
          ),
        ),
      ],
    );

  }



  String _getBmiLabel(double bmi) {
    if (bmi < 16) return "Severe Thinness";
    if (bmi < 17) return "Moderate Thinness";
    if (bmi < 18.5) return "Mild Thinness";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    if (bmi < 35) return "Obese Class I";
    if (bmi < 40) return "Obese Class II";
    return "Obese Class III";
  }

  Color _getBmiLabelColor(double bmi) {
    if (bmi < 16) return const Color(0xff1A96F0);
    if (bmi < 17) return const Color(0xff00A9F1);
    if (bmi < 18.5) return const Color(0xff00BCD3);
    if (bmi < 25) return const Color(0xff4AAF57);
    if (bmi < 30) return const Color(0xffFFC02D);
    if (bmi < 35) return const Color(0xffFF981F);
    if (bmi < 40) return const Color(0xffFF5726);
    return const Color(0xffF54336);
  }
}

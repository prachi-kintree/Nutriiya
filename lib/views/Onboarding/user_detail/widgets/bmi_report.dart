import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/gradient_scaffold.dart';

class BmiReport extends StatefulWidget {
  // final UserBasicDetailsViewModel controller;

  const BmiReport({super.key});

  @override
  State<BmiReport> createState() => _BmiReportState();
}

class _BmiReportState extends State<BmiReport> {
  List<Legend> legends = [
    Legend(
        color: const Color(0xff1A96F0),
        legendDesc: "Very severely underweight"),
    Legend(color: const Color(0xff00A9F1), legendDesc: "Severely underweight"),
    Legend(color: const Color(0xff00BCD3), legendDesc: "Underweight"),
    Legend(color: const Color(0xff4AAF57), legendDesc: "Normal"),
    Legend(color: const Color(0xffFFC02D), legendDesc: "Overweight"),
    Legend(color: const Color(0xffFF981F), legendDesc: "Obese Class I"),
    Legend(color: const Color(0xffFF5726), legendDesc: "Obese Class II"),
    Legend(color: const Color(0xffF54336), legendDesc: "Obese Class III"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Spacer(),
                  Consumer<UserBasicDetailsViewModel>(
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
            // height: 300.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: _getRadialGauge()),
        20.sBH,
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

  Widget _getRadialGauge() {
    return SfRadialGauge(
      title: const GaugeTitle(
        text: '',
        textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 50,
          // radiusFactor: 0.9,
          tickOffset: 10,
          minorTickStyle: MinorTickStyle(),
          radiusFactor: 0.8,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 16,
              color: const Color(0xff1A96F0),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 16,
              endValue: 16.9,
              color: const Color(0xff00A9F1),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 17.0,
              endValue: 18.4,
              color: const Color(0xff00BCD3),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Color(0xff4AAF57),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 25,
              endValue: 29.9,
              color: Color(0xffFFC02D),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 30.0,
              endValue: 34.9,
              color: Color(0xffFF981F),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 35,
              endValue: 39.9,
              color: Color(0xffFF5726),
              startWidth: 10,
              endWidth: 10,
            ),
            GaugeRange(
              startValue: 40,
              endValue: 50,
              color: Color(0xffF54336),
              startWidth: 10,
              endWidth: 10,
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: 24.4,
              knobStyle: KnobStyle(
                  color: Colors.white,
                  borderColor: Colors.green,
                  borderWidth: 0.03,
                  knobRadius: 0.06.h),
              animationDuration: 800,
              enableAnimation: true,
              needleColor: Colors.green,
              needleEndWidth: 12.w,
              needleLength: 0.75,
              // needleStartWidth: 6.w,

              // tailStyle: TailStyle(),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.55, 1.0],
                  colors: [Colors.green, Colors.white]),
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: const Text(
                  '24.4',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _legends() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
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
                            withTextStyle: TextStyle(fontSize: 16.sp),
                            outfitFont: OutfitFontStyle.medium))
                  ],
                ))
            .toList(),
      ),
    );
  }
}

class Legend {
  final Color color;
  final String legendDesc;

  Legend({required this.color, required this.legendDesc});
}

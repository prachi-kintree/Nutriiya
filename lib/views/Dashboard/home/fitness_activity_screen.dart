import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_string_barrel.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FitnessActivityScreen extends StatelessWidget {
  const FitnessActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Fitness  Activity',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          gradient: AppDecoration().scaffoldGradient,
        ),
        child: Column(
          spacing: 15.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Today, 27/06/2025',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: const Color(0xff484C52)),
                        outfitFont: OutfitFontStyle.regular)),
                10.sBW,
                SvgPicture.asset(svgDatePicker)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  gradient: AppDecoration().scaffoldGradient,
                  borderRadius: BorderRadius.circular(20.0.r),
                  boxShadow: AppDecoration.addShadow()),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(svgWalking),
                      10.sBW,
                      Text('Walking',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff484C52)),
                              outfitFont: OutfitFontStyle.regular)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          appNavigator.pushNamed(routeWalkingScreen);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("View Details",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xffFF7300)),
                                    outfitFont: OutfitFontStyle.medium)),
                            5.sBW,
                            SvgPicture.asset(
                              svgNextArrowGreen,
                              color: Color(0xffFF7300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  10.sBH,
                  Container(
                    height: 150.h,
                    // margin: EdgeInsets.only(left: 15.w, right: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0.r),
                      color: Color(0xffFFEAD9),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140.h,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Positioned(
                                top: -70.h,
                                left: 20.w,
                                right: 20.w,
                                child: SfRadialGauge(
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      showLabels: false,
                                      showTicks: false,
                                      startAngle: 160,
                                      endAngle: 20,
                                      radiusFactor: 0.7,
                                      canScaleToFit: true,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.2.w,
                                        color: Color(0xffFFB173),
                                        thicknessUnit: GaugeSizeUnit.factor,
                                        cornerStyle: CornerStyle.bothCurve,
                                      ),
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                            animationDuration: 4000,
                                            enableAnimation: true,
                                            color: Color(0xffFF7300),
                                            value: 50.0,
                                            width: 0.2.w,
                                            sizeUnit: GaugeSizeUnit.factor,
                                            cornerStyle: CornerStyle.bothCurve)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -30.h,
                                left: 20.w,
                                right: 20.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    80.sBH,
                                    SvgPicture.asset(svgCaloriesBurn),
                                    5.sBH,
                                    Text("Burned Calories",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black),
                                            outfitFont:
                                                OutfitFontStyle.medium)),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: '539',
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 32.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.medium)),
                                      TextSpan(
                                          text: 'kcal',
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.medium))
                                    ])),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.sBH,
                  SizedBox(
                    height: 180.h,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4 / 1,
                      ),
                      children: [
                        Container(
                          height: 80.h,
                          width: 28.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0.r),
                            // boxShadow: AppDecoration.addShadow()
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(svgSteps),
                                  10.sBW,
                                  Text("Steps",
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.regular)),
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.semibold),
                                      text: '5777',
                                      children: [
                                    TextSpan(
                                        text: " Steps",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: const Color(0xff5E5F60)),
                                            outfitFont: OutfitFontStyle.medium))
                                  ])),
                              Row(
                                children: [
                                  Text("Target - ",
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 12.sp,
                                              color: const Color(0xff5E5F60)),
                                          outfitFont: OutfitFontStyle.regular)),
                                  RichText(
                                      text: TextSpan(
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.medium),
                                          text: '8000',
                                          children: [
                                        TextSpan(
                                            text: " Steps",
                                            style: AppTextStyle.outfitStyle(
                                                withTextStyle: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: const Color(
                                                        0xff5E5F60)),
                                                outfitFont:
                                                    OutfitFontStyle.regular))
                                      ])),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 80.h,
                          width: 28.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0.r),
                            // boxShadow: AppDecoration.addShadow()
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(svgDistance),
                                  10.sBW,
                                  Text("Distance",
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.regular)),
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.semibold),
                                      text: '7.01',
                                      children: [
                                    TextSpan(
                                        text: " Km",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black),
                                            outfitFont:
                                                OutfitFontStyle.semibold))
                                  ])),
                            ],
                          ),
                        ),
                        Container(
                          height: 80.h,
                          width: 28.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0.r),
                            // boxShadow: AppDecoration.addShadow()
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(svgDuration),
                                  10.sBW,
                                  Text("Duration",
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.regular)),
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.semibold),
                                      text: '1 h',
                                      children: [
                                    TextSpan(
                                        text: " 20 m.",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black),
                                            outfitFont:
                                                OutfitFontStyle.semibold))
                                  ])),
                              Row(
                                children: [
                                  Text("06:15 AM to 07:35 AM",
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 11.sp,
                                              color: const Color(0xff5E5F60)),
                                          outfitFont: OutfitFontStyle.regular)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 80.h,
                          width: 28.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0.r),
                            // boxShadow: AppDecoration.addShadow()
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(svgAverageHR),
                                  10.sBW,
                                  Text("AVR HR",
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.regular)),
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.semibold),
                                      text: '133 ',
                                      children: [
                                    TextSpan(
                                        text: "BPM",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black),
                                            outfitFont:
                                                OutfitFontStyle.regular))
                                  ])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

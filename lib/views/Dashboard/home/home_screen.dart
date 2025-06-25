import 'package:date_util_plus/date_util_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Meals> meals = [
      Meals(svgSandwich, "Breakfast", "Recommended : 481 kcal"),
      Meals(svgPaneerCurry, "Lunch", "Recommended : 577 kcal"),
      Meals(svgLoveFood, "Dinner", "Recommended : 577 kcal"),
      Meals(svgTea, "Snack", "Recommended : 288 kcal"),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFFFFFF), Color(0xffEDEDED)],
                  begin: Alignment.topCenter)),
          child: Padding(
            padding: EdgeInsets.all(15.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.sBH,
                Row(
                  children: [
                    Text("${DateTime.now().getGreeting()} Raj",
                        style: AppTextStyle.jakartaStyle(
                            withTextStyle: TextStyle(
                                fontSize: 24.sp, color: Color(0xff09020F)),
                            jakartaFont: JakartaStyle.bold)),
                    10.sBW,
                    SvgPicture.asset(
                      svgMorningIcon,
                      height: 24.h,
                    ),
                    const Spacer(),
                    Image.asset(pngProfileImg)
                  ],
                ),
                20.sBH,
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0.r),
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .leafGreen!
                        .withOpacity(0.4),
                  ),
                  child: Stack(
                    children: [
                      SfRadialGauge(
                        animationDuration: 4000,
                        enableLoadingAnimation: true,
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
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .leafGreen!,
                              thicknessUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .primaryGreen,
                                  value: 50.0,
                                  width: 0.2.w,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  cornerStyle: CornerStyle.bothCurve)
                            ],
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            65.sBH,
                            SvgPicture.asset(svgCaloriesBurn),
                            5.sBH,
                            Text("Calories",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 14.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.medium)),
                            5.sBH,
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: '539',
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 32.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.medium)),
                              TextSpan(
                                  text: 'kcal',
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 16.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.medium))
                            ])),
                            Text("of 725 kcal",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.medium)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                20.sBH,
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(16.0.r),
                  child: Container(
                    height: 140.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, top: 7.h, right: 16.w),
                          child: Text("Eaten",
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff09020F)),
                                  outfitFont: OutfitFontStyle.medium)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProgressIndicator(
                                bgColor: Colors.grey[300]!,
                                fgColor: Color(0xffFF7300),
                                limit: "100",
                                current: "84",
                                title: "Protein"),
                            ProgressIndicator(
                                bgColor: Colors.grey[300]!,
                                fgColor: Color(0xffEE5A5A),
                                limit: "224",
                                current: "178",
                                title: "Carbs"),
                            ProgressIndicator(
                                bgColor: Colors.grey[300]!,
                                fgColor: Color(0xff7FD3FF),
                                limit: "128",
                                current: "70",
                                title: "Fat")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                20.sBH,
                Text("Log your meals",
                    style: AppTextStyle.jakartaStyle(
                        withTextStyle: TextStyle(
                            fontSize: 20.sp, color: Color(0xff09020F)),
                        jakartaFont: JakartaStyle.bold)),
                10.sBH,
                SizedBox(
                  height: 330.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: meals.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LogMealsWidget(
                          icon: meals[index].icon!,
                          title: meals[index].title!,
                          subtitle: meals[index].subtitle!);
                    },
                  ),
                ),
                10.sBH,
                Text("Water",
                    style: AppTextStyle.jakartaStyle(
                        withTextStyle: TextStyle(
                            fontSize: 20.sp, color: Color(0xff09020F)),
                        jakartaFont: JakartaStyle.bold)),
                10.sBH,
                const WaterTracker(),
                20.sBH
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogMealsWidget extends StatelessWidget {
  const LogMealsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(icon),
                20.sBW,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 18.sp, color: Color(0xff09020F)),
                            outfitFont: OutfitFontStyle.regular)),
                    5.sBH,
                    Text(subtitle,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xff09020F)),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(svgAddButtonCircle)
              ],
            ),
          )),
    );
  }
}

// class WaterTracker extends StatelessWidget {
//   const WaterTracker({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(16.0.r),
//       child: Container(
//         height: 100.h,
//         width: 700.w,
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(svgFilledGlass),
//                 SvgPicture.asset(svgFilledGlass),
//                 SvgPicture.asset(svgAddEmptyGlass),
//                 SvgPicture.asset(svgEmptyGlass),
//                 SvgPicture.asset(svgEmptyGlass),
//                 SvgPicture.asset(svgEmptyGlass),
//               ],
//             ),
//             10.sBH,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("857 / 2000ml",
//                     style: AppTextStyle.outfitStyle(
//                         withTextStyle: TextStyle(
//                             fontSize: 14.sp, color: Color(0xff09020F)),
//                         outfitFont: OutfitFontStyle.regular)),
//                 Text("40%",
//                     style: AppTextStyle.outfitStyle(
//                         withTextStyle: TextStyle(
//                             fontSize: 14.sp, color: Color(0xff09020F)),
//                         outfitFont: OutfitFontStyle.regular)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  final int totalMl = 2000;
  final int glassMl = 250;
  int consumedMl = 0;
  // int consumedMl = 857;

  List<String> getGlassList() {
    int fullGlasses = consumedMl ~/ glassMl;
    int totalGlasses = totalMl ~/ glassMl;
    List<String> glasses = [];

    for (int i = 0; i < totalGlasses; i++) {
      if (i < fullGlasses) {
        glasses.add(svgFilledGlass);
      } else {
        glasses.add(svgEmptyGlass);
      }
    }

    // Replace the first empty glass with the Add button
    int addIndex = fullGlasses;
    if (addIndex < glasses.length) {
      glasses[addIndex] = svgAddEmptyGlass;
    }

    return glasses;
  }

  void onAddGlass() {
    setState(() {
      if (consumedMl + glassMl <= totalMl) {
        consumedMl += glassMl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> glasses = getGlassList();

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16.0.r),
      child: Container(
        height: 100.h,
        width: 700.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(glasses.length, (index) {
                if (glasses[index] == svgAddEmptyGlass) {
                  return GestureDetector(
                    onTap: onAddGlass,
                    child: SvgPicture.asset(svgAddEmptyGlass),
                  );
                } else {
                  return SvgPicture.asset(glasses[index]);
                }
              }),
            ),
            10.sBH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$consumedMl / $totalMl ml",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: Color(0xff09020F)),
                        outfitFont: OutfitFontStyle.regular)),
                Text("${((consumedMl / totalMl) * 100).toStringAsFixed(0)}%",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: Color(0xff09020F)),
                        outfitFont: OutfitFontStyle.regular)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.limit,
    required this.current,
    required this.title,
  });
  final Color bgColor;
  final Color fgColor;
  final String limit;
  final String current;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 130,
          width: 120,
          child: SfRadialGauge(
            animationDuration: 2000,
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  minimum: 0,
                  maximum: double.parse(limit),
                  startAngle: 270.0,
                  endAngle: 270.0,
                  radiusFactor: 0.7,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2.w,
                    color: bgColor,
                    thicknessUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.startCurve,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                        color: fgColor,
                        value: double.parse(current),
                        width: 0.2.w,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.endCurve)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(current,
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 20.sp,
                                        color: Color(0xff09020F)),
                                    outfitFont: OutfitFontStyle.medium)),
                            Text("$limit g",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff09020F)),
                                    outfitFont: OutfitFontStyle.medium)),
                            10.sBH,
                          ],
                        ))
                  ])
            ],
          ),
        ),
        Text(title,
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                    TextStyle(fontSize: 14.sp, color: Color(0xff09020F)),
                outfitFont: OutfitFontStyle.medium))
      ],
    );
  }
}

class Meals {
  final String? icon;
  final String? title;
  final String? subtitle;

  Meals(this.icon, this.title, this.subtitle);
}

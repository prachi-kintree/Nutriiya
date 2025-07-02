import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../utils/app_string/app_image_path.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/gradient_scaffold.dart';

class SubscriptionPlanPage extends StatelessWidget {
  const SubscriptionPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientBackground(),
          PremiumPlan(),
          // Positioned(
          //     top: 40.h,
          //     left: 20.w,
          //     child: InkWell(
          //         onTap: () {
          //           appNavigator.goBack();
          //         },
          //         child: SvgPicture.asset(svgBackArrow)))
        ],
      ),
    );
  }
}

class PremiumPlan extends StatelessWidget {
  final features = [
    SubscriptionFeature(
      title: "Simple Calorie Counting",
      iconPath: svgCalorieCounting,
    ),
    SubscriptionFeature(
      title: "Personalized Goals",
      iconPath: svgGoalSetting,
    ),
    SubscriptionFeature(
      title: "Daily Motivation",
      iconPath: svgMotivation,
    ),
    SubscriptionFeature(
      title: "Progress Insights",
      iconPath: svgProgressInsights,
    ),
    SubscriptionFeature(
      title: "Customizable Plans",
      iconPath: svgPlans,
    )
  ];

  PremiumPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          40.sBH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {
                    appNavigator.goBack();
                  },
                  child: SvgPicture.asset(svgBackArrow)),
            ),
          ),
          60.sBH,
          _appIcon(),
          20.sBH,
          _featuresList(),
          40.sBH,
          PricingToggle(),
          // Spacer(),
          10.sBH,
          Text('Your personalized calorie\n plan is ready!',
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      fontSize: 26.sp,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .black),
                  outfitFont: OutfitFontStyle.bold)),

          10.sBH,
          // SizedBox(
          //   height: 350.w,
          //   width: 350.w,
          //   child: CalorieDonutChart(),
          // ),
          const CalorieDonutChart(
            totalCalories: 2200,
            protein: 20,
            carbs: 35,
            fats: 45,
          ),
          3.sBH,
          SizedBox(
            height: 70.h,
            width: 150.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 18.h,
                      width: 18.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF4C9FFF),
                      ),
                    ),
                    5.sBW,
                    Text(
                      'Protein',
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    const Spacer(),
                    Text(
                      '440 kcal',
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 18.h,
                      width: 18.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF71D12D),
                      ),
                    ),
                    5.sBW,
                    Text(
                      'Carbs',
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    const Spacer(),
                    Text(
                      '770 kcal',
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 18.h,
                      width: 18.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF3A633),
                      ),
                    ),
                    5.sBW,
                    Text(
                      'Fat',
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    const Spacer(),
                    Text(
                      '990 kcal',
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.sBH,
          const BenifitsCard(
            bgColor: Color(0xFFCDDEBB),
            title: 'Your Personalized Journey',
            subtitle: 'built around your habits, goals, and \npreferences.',
          ),
          15.sBH,
          const BenifitsCard(
            bgColor: Color(0xffA5C1E1),
            title: 'Slim Down the Smart Way',
            subtitle:
                'Enjoy nutritious meals, track your journey, and \nreach your goals — without the constant hunger.',
          ),
          15.sBH,
          const BenifitsCard(
            bgColor: Color(0xFFE9C995),
            title: 'Health Beyond the Scale',
            subtitle:
                'It’s not just about weight — it’s about energy, \nconfidence, and feeling great every day.',
          ),
          10.sBH,
          Container(
            margin: EdgeInsets.all(10.0.h),

            // height: 1.sh,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            decoration: BoxDecoration(
              gradient: AppDecoration().scaffoldGradient,
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            child: Column(
              spacing: 10.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Personalized Meal Plans',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Calorie Tracker',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Macronutrient Breakdown',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Water Intake Reminder',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Weight Tracker',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Food Library',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('AI Smart Suggestions',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Progress Badges',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Meal Reminder Alerts',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(svgGreenCheckIcon2),
                    20.sBW,
                    Text('Weekly Reports',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
              ],
            ),
          ),
          10.sBH,
          PricingToggle(),
          10.sBH,
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 30.w),
            child: CustomButton(
                // height: 45.h,
                buttonText: "Subscribe",
                padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                buttonTextStyle: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(fontSize: 16.sp),
                    outfitFont: OutfitFontStyle.medium),
                width: 500.w,
                onPressed: (startLoading, stopLoading, btnState) {
                  // appNavigator.sub
                  appNavigator.pushNamed(routeSubscriptionDone);
                },
                isDisabled: false,
                disableElevation: false),
          ),
        ],
      ),
    );
  }

  _appIcon() {
    return Center(
      child: Column(
        children: [
          Image.asset(svgNutriyaLogo, scale: 4.5),
          10.sBH,
          Text("The Daily Nutrition Tracker",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 16.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.regular))
        ],
      ),
    );
  }

  _featuresList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length + 1,
      // +1 for Logout
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      itemBuilder: (context, index) {
        if (index < features.length) {
          final item = features[index];
          return ListTile(
              // titleAlignment: ListTileTitleAlignment.top,
              title: Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(item.iconPath, width: 22.h, height: 22.h),
                20.sBW,
                Text(item.title,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .black),
                        outfitFont: OutfitFontStyle.regular))
              ],
            ),
          ));
        }
      },
    );
  }
}

class BenifitsCard extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String subtitle;
  const BenifitsCard({
    super.key,
    required this.bgColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 330.w,
      padding: EdgeInsets.all(10.0.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          boxShadow: AppDecoration.addShadow(),
          color: bgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 24.sp),
                outfitFont: OutfitFontStyle.regular),
          ),
          5.sBH,
          Text(
            subtitle,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp),
                outfitFont: OutfitFontStyle.regular),
          ),
        ],
      ),
    );
  }
}

class PricingToggle extends StatefulWidget {
  @override
  _PricingToggleState createState() => _PricingToggleState();
}

class _PricingToggleState extends State<PricingToggle> {
  bool isMonthlySelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Monthly Plan
        GestureDetector(
          onTap: () {
            setState(() {
              isMonthlySelected = true;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(13.h),
                height: 125.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isMonthlySelected
                        ? ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen!
                        : ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color!.withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    if (isMonthlySelected)
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 6,
                        blurStyle: BlurStyle.outer,
                      ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Monthly",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 16.sp,
                                color: isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    4.sBH,
                    Text("₹ 200.00",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 26.sp,
                                color: isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    Spacer(),
                    Text("Billed Monthly",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
              ),
              if (isMonthlySelected)
                Positioned(
                  top: -5,
                  right: -5,
                  child: SvgPicture.asset(
                    svgSubsTick,
                    height: 16.h,
                    width: 16.h,
                  ),
                )
            ],
          ),
        ),
        SizedBox(width: 16),

        // Yearly Plan
        GestureDetector(
          onTap: () {
            setState(() {
              isMonthlySelected = false;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(13.h),
                height: 125.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: !isMonthlySelected
                        ? ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen!
                        : ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color!.withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    if (!isMonthlySelected)
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.outer,
                      ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yearly",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 16.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    4.sBH,
                    Text("₹ 2200.00",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 26.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    4.sBH,
                    Text("Save ₹ 200.00",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 12.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    Spacer(),
                    Text("Free 1 Week Trial",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
              ),
              if (!isMonthlySelected)
                Positioned(
                  top: -5,
                  right: -5,
                  child: SvgPicture.asset(
                    svgSubsTick,
                    height: 16.h,
                    width: 16.h,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class SubscriptionFeature {
  final String title;
  final String iconPath;

  SubscriptionFeature({required this.title, required this.iconPath});
}

class ChartSegmentData {
  ChartSegmentData(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}

class CalorieDonutChart extends StatelessWidget {
  final int? totalCalories;
  final double? carbs;
  final double? protein;
  final double? fats;

  const CalorieDonutChart(
      {Key? key, this.totalCalories, this.carbs, this.protein, this.fats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartSegmentData> chartData = [
      ChartSegmentData('Carbs', carbs ?? 0.0, const Color(0xFF71D12D)), // Green
      ChartSegmentData(
          'Protein', protein ?? 0.0, const Color(0xFF4C9FFF)), // Blue
      ChartSegmentData('Fats', fats ?? 0.0, const Color(0xFFF3A633)), // Orange
    ];

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20.0.r,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: SfCircularChart(
        margin: EdgeInsets.all(25.0.w),
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              decoration: const BoxDecoration(

                  // gradient: RadialGradient(
                  //   colors: [
                  //     Color(0xFFE3F2FF),
                  //     Colors.white,
                  //   ],
                  //   stops: [0.0, 0.9],
                  // ),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$totalCalories',
                      style: TextStyle(
                          fontSize: 56.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF263238))),
                  Text('kcal',
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Color(0xFF37474F),
                          height: 1)),
                ],
              ),
            ),
          )
        ],
        series: <CircularSeries>[
          DoughnutSeries<ChartSegmentData, String>(
            dataSource: chartData,
            xValueMapper: (ChartSegmentData data, _) => data.category,
            yValueMapper: (ChartSegmentData data, _) => data.value,
            pointColorMapper: (ChartSegmentData data, _) => data.color,

            innerRadius: '75%',
            radius: '90%',

            // strokeColor: const Color(0xFF4C9FFF).withOpacity(0.5),
            strokeColor: Colors.transparent,
            strokeWidth: 2,

            startAngle: 270,
            endAngle: 270,

            // This section creates the custom percentage labels
            dataLabelSettings: DataLabelSettings(
              labelIntersectAction: LabelIntersectAction.none,
              // connectorLineSettings: const ConnectorLineSettings(
              //   // This activates the positioning logic.
              //   type: ConnectorType.curve,
              //   // Pushes the label away from the chart.
              //   length: '25',
              //   // This makes the line itself invisible, matching the design.
              //   width: 0,
              // ),
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
              // The builder creates the custom white circle widget for each label
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Text(
                    '${data.value.toInt()}%',
                    // style: const TextStyle(
                    //   color: Color(0xFF37474F),
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.w400,
                    // ),
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 16.sp,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .black),
                        outfitFont: OutfitFontStyle.regular),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

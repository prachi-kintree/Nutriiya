import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Button/custom_button.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/views/Account/subscription/subscription_plan.dart';
import 'package:nutriya/views/widget/gradient_scaffold.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class CaloriesPlanReadyScreen extends StatelessWidget {
  const CaloriesPlanReadyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              20.sBH,
              Text('Your personalized calorie \nplan is ready!',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle:
                          TextStyle(fontSize: 26.sp, color: Colors.black),
                      jakartaFont: JakartaStyle.semibold)),
              const CalorieDonutChart(
                totalCalories: 2200,
                protein: 20,
                carbs: 35,
                fats: 45,
              ),
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
              CustomButton(
                  buttonText: "Continue",
                  padding: EdgeInsets.only(
                      top: 30.h, bottom: 20.h, left: 15.w, right: 15.w),
                  buttonTextStyle: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(fontSize: 16.sp),
                      outfitFont: OutfitFontStyle.medium),
                  width: 500.w,
                  onPressed: (startLoading, stopLoading, btnState) {
                    appNavigator.pushNamed(routeIntro);
                  },
                  isDisabled: false,
                  disableElevation: false),
            ],
          ),
        ],
      ),
    );
  }
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

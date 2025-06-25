import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/styles/app_text_styles.dart';

class NutritionChart extends StatelessWidget {
  final List<_NutritionData> chartData = [
    _NutritionData('16', 55, 20, 25, false),
    _NutritionData('17', 30, 30, 40, true),
    _NutritionData('18', 45, 35, 20, false),
    _NutritionData('19', 40, 15, 45, false),
    _NutritionData('20', 50, 20, 30, false),
    _NutritionData('21', 45, 20, 35, false), // as per tooltip
    _NutritionData('22', 45, 35, 20, false),
  ];

  NutritionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 10)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Text("Nutrition (%)",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 15.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.semibold)),
            ],
          ),
          Divider(height: 20.h),
          Row(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffF54336)),
              ),
              5.sBW,
              Text("Carbs",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 10.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
              20.sBW,
              Container(
                height: 8.h,
                width: 8.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffFF981F)),
              ),
              5.sBW,
              Text("Protein",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 10.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
              20.sBW,
              Container(
                height: 8.h,
                width: 8.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff1A94ED)),
              ),
              5.sBW,
              Text("Fat",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 10.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
            ],
          ),
          SizedBox(
            height: 180.h,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              // legend: const Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryXAxis: const CategoryAxis(
                majorTickLines: MajorTickLines(width: 0),
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 100,
                interval: 25,
                majorTickLines: MajorTickLines(width: 0),
                minorTickLines: MinorTickLines(width: 0),
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
                labelFormat: '{value}',
              ),
              series: <CartesianSeries<_NutritionData, String>>[
                StackedColumnSeries<_NutritionData, String>(
                    dataSource: chartData,
                    xValueMapper: (data, _) => data.day,
                    yValueMapper: (data, _) => data.carbs,
                    name: 'Carbs',
                    pointColorMapper: (data, _) => data.isSelected
                        ? const Color(0xffF54336) // green highlight
                        : const Color(0xffFCC3BF),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    borderColor: Colors.white,
                    borderWidth: 2),
                StackedColumnSeries<_NutritionData, String>(
                    dataSource: chartData,
                    xValueMapper: (data, _) => data.day,
                    yValueMapper: (data, _) => data.protein,
                    name: 'Protein',
                    pointColorMapper: (data, _) => data.isSelected
                        ? const Color(0xffFF981F) // green highlight
                        : const Color(0xffFEDDB7),
                    borderRadius: BorderRadius.zero,
                    borderColor: Colors.white,
                    borderWidth: 2),
                StackedColumnSeries<_NutritionData, String>(
                    dataSource: chartData,
                    xValueMapper: (data, _) => data.day,
                    yValueMapper: (data, _) => data.fat,
                    name: 'Fat',
                    pointColorMapper: (data, _) => data.isSelected
                        ? const Color(0xff1A94EC) // green highlight
                        : const Color(0xffB5DCF9),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    borderColor: Colors.white,
                    borderWidth: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NutritionData {
  final String day;
  final double carbs;
  final double protein;
  final double fat;
  final bool isSelected;

  _NutritionData(this.day, this.carbs, this.protein, this.fat, this.isSelected);
}
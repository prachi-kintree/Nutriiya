import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/User_Progress/widgets/weight_chart.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WalkingStatisticScreen extends StatelessWidget {
  const WalkingStatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double calorieGoal = 2500;
    final List<CalorieData> data = const [
      CalorieData(day: '16', calories: 2300),
      CalorieData(day: '17', calories: 2100, isSelected: true), // selected
      CalorieData(day: '18', calories: 2400),
      CalorieData(day: '19', calories: 2200),
      CalorieData(day: '20', calories: 2600),
      CalorieData(day: '21', calories: 2500),
      CalorieData(day: '22', calories: 2300),
    ];
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Walking',
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
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              onMarkerRender: (MarkerRenderArgs args) {
                final point = data[args.pointIndex ?? 0];
                if (point.isSelected) {
                  args.color = const Color(0xffA1CE50); // green fill
                  args.borderColor = const Color(0xffA1CE50);
                  args.markerWidth = 10.h; // larger size
                  args.markerHeight = 10.h;
                } else {
                  args.color = Colors.white; // white fill
                  args.borderColor = const Color(0xffA1CE50);
                  args.markerWidth = 10.h; // default size
                  args.markerHeight = 10.h;
                }
              },
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                interval: 500,
                minimum: 0,
                maximum: 3000,
                // majorGridLines: const MajorGridLines(width: 0.5, color: Colors.grey),
                majorTickLines: MajorTickLines(width: 0),
                minorTickLines: MinorTickLines(width: 0),
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),
              annotations: data
                  .asMap()
                  .entries
                  .where((e) => e.value.isSelected)
                  .map((e) {
                final point = e.value;
                return CartesianChartAnnotation(
                  widget: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xffA1CE50), width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${point.calories.toInt()}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: ' kcal',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  coordinateUnit: CoordinateUnit.point,
                  x: point.day,
                  y: point.calories + 300,
                );
              }).toList(),
              series: <CartesianSeries<CalorieData, String>>[
                // Line with area fill
                AreaSeries<CalorieData, String>(
                  dataSource: data,
                  xValueMapper: (d, _) => d.day,
                  yValueMapper: (d, _) => d.calories,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffE7F2D3),
                      Color(0xffffffff),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderColor: const Color(0xffA1CE50),
                  borderWidth: 4,

                  markerSettings: MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.circle,
                    height: 10.h,
                    width: 10.h,
                    borderColor: Color(0xffA1CE50),
                    borderWidth: 3,
                  ),
                  // pointColorMapper: (data, _) {
                  //   print("ISSELECTED ${data.isSelected}");
                  //   return data.isSelected
                  //     ? const Color(0xff000000)
                  //     : const Color(0xff000000);
                  // },
                ),

                // Calorie Intake Goal Dashed Line
                LineSeries<CalorieData, String>(
                  dataSource: data,
                  xValueMapper: (d, _) => d.day,
                  yValueMapper: (d, _) => calorieGoal,
                  color: const Color(0xffA1CE50),
                  width: 2,
                  dashArray: <double>[8, 15],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

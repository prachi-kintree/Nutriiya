import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/User_Progress/widgets/dashed_widget.dart';
import 'package:nutriya/views/User_Progress/widgets/weight_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/styles/app_text_styles.dart';

class CalorieChart extends StatefulWidget {
  const CalorieChart({super.key});

  @override
  State<CalorieChart> createState() => _CalorieChartState();
}

class _CalorieChartState extends State<CalorieChart> {
  final List<CalorieData> data = const [
    CalorieData(day: '16', calories: 2300),
    CalorieData(day: '17', calories: 2100, isSelected: true), // selected
    CalorieData(day: '18', calories: 2400),
    CalorieData(day: '19', calories: 2200),
    CalorieData(day: '20', calories: 2600),
    CalorieData(day: '21', calories: 2500),
    CalorieData(day: '22', calories: 2300),
  ];

  final double calorieGoal = 2500;
  int selectedFormat = 0;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Calorie (kcal)",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 15.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.semibold)),
              Container(
                // height: 36,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: List.generate(2, (index) {
                    final isSelected = selectedFormat == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedFormat = index),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 17.w),
                          // width: 40,
                          // height: 32,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xff4CAF00)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SvgPicture.asset(
                              index == 0
                                  ? isSelected
                                  ? svgEnabledBarGraph
                                  : svgDisabledBarGraph
                                  : isSelected
                                  ? svgEnabledUptrend
                                  : svgDisabledUptrend,
                              height: 14.h)

                        // Icon(
                        //   index == 0 ? Icons.bar_chart : Icons.show_chart,
                        //   color: isSelected ? Colors.white : Colors.grey,
                        //   size: 20,
                        // ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
          Divider(height: 20.h),
          Row(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffA1CE50)),
              ),
              5.sBW,
              Text("Selected",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 10.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
              20.sBW,
              CustomPaint(
                size: const Size(30, 1),
                painter: DashedLinePainter(color: const Color(0xffA1CE50)),
              ),
              8.sBW,
              Text(
                'Calorie Intake Goal',
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                    TextStyle(fontSize: 10.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.regular),
              ),
            ],
          ),
          10.sBH,
          SizedBox(
            height: 180.h,
            child: selectedFormat == 1
                ? SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true),
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
                          border: Border.all(
                              color: Color(0xffA1CE50), width: 3),
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
                  gradient: LinearGradient(
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
                : SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true),
              plotAreaBorderWidth: 0,
              primaryXAxis: const CategoryAxis(
                isVisible: true,
                majorTickLines: MajorTickLines(width: 0),
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),

              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 3000,
                interval: 500,
                majorTickLines: MajorTickLines(width: 0),
                minorTickLines: MinorTickLines(width: 0),
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
                plotBands: <PlotBand>[
                  PlotBand(
                    isVisible: true,
                    start: calorieGoal,
                    end: calorieGoal,
                    borderWidth: 2,
                    borderColor: Color(0xffA1CE50),
                    dashArray: <double>[8, 15],
                  )
                ],
              ),
              series: <CartesianSeries>[
                ColumnSeries<CalorieData, String>(
                  enableTooltip: true,

                  onPointTap: (ChartPointDetails details) {
                    setState(() {
                      final tappedIndex = details.pointIndex!;
                      for (int i = 0; i < data.length; i++) {
                        data[i] = CalorieData(
                          day: data[i].day,
                          calories: data[i].calories,
                          isSelected: i == tappedIndex,
                        );
                      }
                      print('Tapped index: $tappedIndex');
                      print('Tapped calories: ${data[tappedIndex].calories}');
                    });

                  },
                  dataSource: data,
                  xValueMapper: (d, _) => d.day,
                  yValueMapper: (d, _) => d.calories,
                  pointColorMapper: (d, _) => d.isSelected
                      ? const Color(0xffA1CE50)
                      : const Color(0xffD2E7AB),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20)),
                  dataLabelSettings: DataLabelSettings(
                    // isVisible: true,
                    labelPosition: ChartDataLabelPosition.inside,
                    connectorLineSettings: const ConnectorLineSettings(
                        width: 2, color: Colors.blue, length: "200"),
                    alignment: ChartAlignment.near,
                    margin: EdgeInsets.all(20),
                    color: Colors.teal,
                    angle: 30,
                    textStyle: TextStyle(fontSize: 10),
                    useSeriesColor: true,
                    borderRadius: 50,
                    borderColor: Colors.cyanAccent,
                    borderWidth: 4,
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    labelIntersectAction: LabelIntersectAction.shift,
                    opacity: 0.5,
                    overflowMode: OverflowMode.trim,
                    showZeroValue: false,
                    showCumulativeValues: true,
                    offset: Offset.infinite,
                    builder: (dataLabel, point, series, pointIndex,
                        seriesIndex) {
                      final CalorieData cd = dataLabel as CalorieData;
                      if (!cd.isSelected) return const SizedBox.shrink();
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('${cd.calories.toInt()} kcal',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


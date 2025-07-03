import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/styles/app_text_styles.dart';
import 'dashed_widget.dart';

class CalorieData {
  final String day;
  final double calories;
  final bool isSelected;

  const CalorieData({
    required this.day,
    required this.calories,
    this.isSelected = false,
  });
}

class WeightChart extends StatefulWidget {
  const WeightChart({super.key});

  @override
  State<WeightChart> createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  final List<CalorieData> data = const [
    CalorieData(day: '16', calories: 2300),
    CalorieData(day: '17', calories: 2100, isSelected: true),
    CalorieData(day: '18', calories: 2400),
    CalorieData(day: '19', calories: 2200),
    CalorieData(day: '20', calories: 2600),
    CalorieData(day: '21', calories: 2500),
    CalorieData(day: '22', calories: 2300),
  ];
  int selectedFormat = 0;
  final double calorieGoal = 2500;

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
              Text("Weight (kg)",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 15.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.semibold)),
              Container(
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
                          padding: EdgeInsets.symmetric(
                              vertical: 7.h, horizontal: 17.w),
                          // width: 40,
                          // height: 32,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xffFF5726)
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
                    shape: BoxShape.circle, color: Color(0xffFF5726)),
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
                painter: DashedLinePainter(color: Color(0xffFF5726)),
              ),
              8.sBW,
              Text(
                'Weight Goal',
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
                        args.color = const Color(0xffFF5726); // green fill
                        args.borderColor = const Color(0xffFF5726);
                        args.markerWidth = 10.h; // larger size
                        args.markerHeight = 10.h;
                      } else {
                        args.color = Colors.white; // white fill
                        args.borderColor = const Color(0xffFF5726);
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
                                    color: Color(0xffFF5726), width: 3),
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
                            Color(0xffFDCDBF),
                            Color(0xffffffff),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderColor: const Color(0xffFF5726),
                        borderWidth: 4,
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          height: 10.h,
                          width: 10.h,
                          borderColor: Color(0xffFF5726),
                          borderWidth: 3,
                        ),
                      ),

                      // Calorie Intake Goal Dashed Line
                      LineSeries<CalorieData, String>(
                        dataSource: data,
                        xValueMapper: (d, _) => d.day,
                        yValueMapper: (d, _) => calorieGoal,
                        color: const Color(0xffFF5726),
                        width: 2,
                        dashArray: <double>[8, 15],
                      ),
                    ],
                  )
                : SfCartesianChart(
                    tooltipBehavior: TooltipBehavior(enable: true,),
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
                      majorTickLines: const MajorTickLines(width: 0),
                      minorTickLines: MinorTickLines(width: 0),
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: AxisLine(width: 0),
                      plotBands: <PlotBand>[
                        PlotBand(
                          isVisible: true,
                          start: calorieGoal,
                          end: calorieGoal,
                          borderWidth: 2,
                          borderColor: Color(0xffFF5726),
                          dashArray: <double>[8, 15],
                        )
                      ],
                    ),
                    series: <CartesianSeries>[
                      ColumnSeries<CalorieData, String>(
                        dataSource: data,
                        xValueMapper: (d, _) => d.day,
                        yValueMapper: (d, _) => d.calories,
                        pointColorMapper: (d, _) => d.isSelected
                            ? const Color(0xffFF5726)
                            : const Color(0xffFFAE97),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        dataLabelSettings: DataLabelSettings(
                          // isVisible: true,
                          labelPosition: ChartDataLabelPosition.inside,
                          connectorLineSettings: const ConnectorLineSettings(
                              width: 2, color: Colors.blue, length: "200"),
                          alignment: ChartAlignment.near,
                          margin: const EdgeInsets.all(20),
                          // color: Colors.teal,
                          angle: 30,
                          textStyle: const TextStyle(fontSize: 10),
                          useSeriesColor: true,
                          borderRadius: 50,
                          // borderColor: Colors.cyanAccent,
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

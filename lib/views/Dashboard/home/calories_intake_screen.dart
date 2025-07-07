import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/styles/app_text_styles.dart';

class CaloriesIntakeScreen extends StatefulWidget {
  const CaloriesIntakeScreen({super.key});

  @override
  State<CaloriesIntakeScreen> createState() => _CaloriesIntakeScreenState();
}

class _CaloriesIntakeScreenState extends State<CaloriesIntakeScreen> {
  DateTime selectedDate = DateTime.now();

  void showCustomDateRangePicker(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        DateRangePickerController controller = DateRangePickerController();
        Color? primaryColor =
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen;
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            height: 400.h,
            child: Column(
              children: [
                // Header with title, close and save buttons
                Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: const Border(
                          bottom: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          final DateTime? selectedDate =
                              controller.selectedDate;
                          if (selectedDate != null) {
                            setState(() {
                              this.selectedDate = selectedDate;
                            });
                          }
                          Navigator.pop(context);
                        },
                        child: Text('SAVE',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                                outfitFont: OutfitFontStyle.semibold)),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Center(
                      child: Text("SELECTED DATE",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  letterSpacing: 1.2),
                              outfitFont: OutfitFontStyle.semibold)),
                    )),

                // Date picker
                Expanded(
                  child: SfDateRangePicker(
                    controller: controller,
                    selectionMode: DateRangePickerSelectionMode.single,
                    onViewChanged: (DateRangePickerViewChangedArgs args) {
                      // setState(() {
                      //   _visibleDate = args.visibleDateRange.startDate;
                      // });
                    },
                    selectionColor: primaryColor,
                    rangeTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular),
                    selectionTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(fontSize: 14.sp),
                        outfitFont: OutfitFontStyle.regular),
                    rangeSelectionColor: const Color(0xffD9ECCD),
                    startRangeSelectionColor: primaryColor,
                    endRangeSelectionColor: primaryColor,
                    todayHighlightColor: primaryColor,

                    navigationMode: DateRangePickerNavigationMode.scroll,
                    navigationDirection:
                        DateRangePickerNavigationDirection.vertical,
                    allowViewNavigation: true,
                    showNavigationArrow: true,
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      todayTextStyle: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: primaryColor),
                          outfitFont: OutfitFontStyle.semibold),
                      textStyle: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    // View settings
                    view: DateRangePickerView.month,
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                      enableSwipeSelection: true,
                      // showTrailingAndLeadingDates: true,
                    ),
                    // Set min and max date limits
                    minDate: DateTime(2000),
                    maxDate: DateTime(2100),

                    // Clean look
                    showActionButtons: false,
                    headerHeight: 30.h,
                    headerStyle: DateRangePickerHeaderStyle(
                        textStyle: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.black.withOpacity(0.7)),
                            outfitFont: OutfitFontStyle.semibold),
                        textAlign: TextAlign.center),
                  ),
                ),
                10.sBH
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Calorie Details ',
      ),
      body: Stack(
        children: [
          const CommonGradient(),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  15.sBH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        svgBackButton,
                        color: Colors.black,
                      ),
                      10.sBW,
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () async {
                              showCustomDateRangePicker(context);
                            },
                            child: Text(
                                DateFormat('dd/MM/yyyy').format(selectedDate),
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.medium)),
                          ),
                        ),
                      ])),
                      10.sBW,
                      SvgPicture.asset(
                        svgForwardArrowGreen,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  20.sBH,
                  const NutrientChart(
                    chartColor: Color(0xffA1CE50),
                    chartName: 'Calorie',
                    measurement: 'kcal',
                    intervalGap: 500,
                    limit: 3000,
                    listData: [
                      CalorieIntake(meal: 'Breakfast', calories: 800),
                      CalorieIntake(
                          meal: 'Lunch',
                          calories: 1700,
                          isSelected: true), // selected
                      CalorieIntake(meal: 'Snack', calories: 900),
                      CalorieIntake(meal: 'Dinner', calories: 1200),
                    ],
                  ),
                  10.sBH,
                  const NutrientChart(
                    intervalGap: 50,
                    limit: 400,
                    chartColor: Color(0xff4A90E2),
                    chartName: 'Protein',
                    measurement: 'g',
                    listData: [
                      CalorieIntake(meal: 'Breakfast', calories: 140),
                      CalorieIntake(
                          meal: 'Lunch',
                          calories: 350,
                          isSelected: true), // selected
                      CalorieIntake(meal: 'Snack', calories: 90),
                      CalorieIntake(meal: 'Dinner', calories: 220),
                    ],
                  ),
                  10.sBH,
                  const NutrientChart(
                    intervalGap: 50,
                    limit: 400,
                    chartColor: Color(0xffA1CE50),
                    chartName: 'Carbs',
                    measurement: 'g',
                    listData: [
                      CalorieIntake(meal: 'Breakfast', calories: 290),
                      CalorieIntake(
                          meal: 'Lunch',
                          calories: 340,
                          isSelected: true), // selected
                      CalorieIntake(meal: 'Snack', calories: 190),
                      CalorieIntake(meal: 'Dinner', calories: 380),
                    ],
                  ),
                  10.sBH,
                  const NutrientChart(
                    intervalGap: 50,
                    limit: 400,
                    chartColor: Color(0xffF5A623),
                    chartName: 'Fat',
                    measurement: 'g',
                    listData: [
                      CalorieIntake(meal: 'Breakfast', calories: 370),
                      CalorieIntake(
                          meal: 'Lunch',
                          calories: 270,
                          isSelected: true), // selected
                      CalorieIntake(meal: 'Snack', calories: 170),
                      CalorieIntake(meal: 'Dinner', calories: 220),
                    ],
                  ),
                  30.sBH,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NutrientChart extends StatefulWidget {
  const NutrientChart({
    super.key,
    required this.chartName,
    required this.measurement,
    required this.chartColor,
    required this.listData,
    required this.intervalGap,
    required this.limit,
  });
  final String chartName;
  final String measurement;
  final Color chartColor;
  final List<CalorieIntake> listData;
  final double intervalGap;
  final double limit;

  @override
  State<NutrientChart> createState() => NutrientChartState();
}

class NutrientChartState extends State<NutrientChart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: Colors.transparent,
      canShowMarker: false,
      tooltipPosition: TooltipPosition.pointer,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        return _buildCustomTooltip(data);
      },
    );
  }

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
              Text("${widget.chartName} (${widget.measurement})",
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
                                ? widget.chartColor
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
          Divider(
            height: 20.h,
            color: Colors.black,
          ),
          Row(
            children: [
              Container(
                height: 8.h,
                width: 8.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: widget.chartColor),
              ),
              5.sBW,
              Text("${widget.chartName} Intake",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
              // 20.sBW,
              // CustomPaint(
              //   size: const Size(30, 1),
              //   painter: DashedLinePainter(color: Color(0xff1A96F0)),
              // ),
              // 8.sBW,
              // Text(
              //   'Water Intake Goal',
              //   style: AppTextStyle.outfitStyle(
              //       withTextStyle:
              //           TextStyle(fontSize: 10.sp, color: Colors.black),
              //       outfitFont: OutfitFontStyle.regular),
              // ),
            ],
          ),
          10.sBH,
          SizedBox(
            height: 180.h,
            child: selectedFormat == 1
                ? SfCartesianChart(
                    tooltipBehavior: _tooltipBehavior,
                    plotAreaBorderWidth: 0,
                    onMarkerRender: (MarkerRenderArgs args) {
                      final point = widget.listData[args.pointIndex ?? 0];
                      if (point.isSelected) {
                        args.color = widget.chartColor; // green fill
                        args.borderColor = widget.chartColor;
                        args.markerWidth = 10.h; // larger size
                        args.markerHeight = 10.h;
                      } else {
                        args.color = Colors.white; // white fill
                        widget.chartColor;
                        args.markerWidth = 10.h; // default size
                        args.markerHeight = 10.h;
                      }
                    },
                    primaryXAxis: const CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                      axisLine: AxisLine(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      interval: widget.intervalGap,
                      minimum: 0,
                      maximum: widget.limit,
                      // edgeLabelPlacement: EdgeLabelPlacement.shift,

                      // title: AxisTitle(
                      //   text: 'g',
                      //   alignment: ChartAlignment.near,
                      // ),

                      // majorGridLines: const MajorGridLines(width: 0.5, color: Colors.grey),
                      majorTickLines: MajorTickLines(width: 0),
                      minorTickLines: MinorTickLines(width: 0),
                      majorGridLines: MajorGridLines(width: 0),
                      axisLine: AxisLine(width: 0),
                    ),
                    annotations: widget.listData
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
                                    color: widget.chartColor, width: 3),
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
                        x: point.meal,
                        y: point.calories + 300,
                      );
                    }).toList(),
                    series: <CartesianSeries<CalorieIntake, String>>[
                      // Line with area fill
                      AreaSeries<CalorieIntake, String>(
                        dataSource: widget.listData,
                        xValueMapper: (d, _) => d.meal,
                        yValueMapper: (d, _) => d.calories,
                        gradient: LinearGradient(
                          colors: [
                            widget.chartColor.withOpacity(0.6),
                            const Color(0xffffffff),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderColor: widget.chartColor,
                        borderWidth: 4,

                        markerSettings: MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          height: 10.h,
                          width: 10.h,
                          borderColor: widget.chartColor,
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
                      // LineSeries<CalorieIntake, String>(
                      //   dataSource: widget.listData,
                      //   xValueMapper: (d, _) => d.meal,
                      //   yValueMapper: (d, _) => calorieGoal,
                      //   color: widget.chartColor,
                      //   width: 2,
                      //   dashArray: <double>[8, 15],
                      // ),
                    ],
                  )
                : SfCartesianChart(
                    tooltipBehavior: _tooltipBehavior,
                    plotAreaBorderWidth: 0,
                    primaryXAxis: const CategoryAxis(
                      isVisible: true,
                      majorTickLines: MajorTickLines(width: 0),
                      majorGridLines: MajorGridLines(width: 0),
                      axisLine: AxisLine(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: widget.limit,
                      interval: widget.intervalGap,
                      majorTickLines: const MajorTickLines(width: 0),
                      minorTickLines: MinorTickLines(width: 0),
                      majorGridLines: MajorGridLines(width: 0),
                      axisLine: AxisLine(width: 0),
                      plotBands: <PlotBand>[
                        PlotBand(
                          isVisible: false,
                          start: calorieGoal,
                          end: calorieGoal,
                          borderWidth: 2,
                          borderColor: widget.chartColor,
                          dashArray: <double>[8, 15],
                        )
                      ],
                    ),
                    series: <CartesianSeries>[
                      ColumnSeries<CalorieIntake, String>(
                        width: 0.5,
                        dataSource: widget.listData,
                        xValueMapper: (d, _) => d.meal,
                        yValueMapper: (d, _) => d.calories,
                        pointColorMapper: (d, _) => d.isSelected
                            ? widget.chartColor
                            : widget.chartColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        dataLabelSettings: DataLabelSettings(
                          // isVisible: true,
                          labelPosition: ChartDataLabelPosition.inside,
                          connectorLineSettings: ConnectorLineSettings(
                              width: 2,
                              color: widget.chartColor,
                              length: '200'),
                          alignment: ChartAlignment.near,
                          margin: EdgeInsets.all(20),
                          // color: Colors.teal,
                          angle: 30,
                          textStyle: TextStyle(fontSize: 10),
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
                            final CalorieIntake cd = dataLabel as CalorieIntake;
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

  Widget _buildCustomTooltip(dynamic data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: widget.chartColor, width: 5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${data.calories}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.chartColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              Text(
                'mL',
                style: TextStyle(color: widget.chartColor, fontSize: 10),
              ),
            ],
          ),
        ),
        // ClipPath(
        //   clipper: TriangleClipper(),
        //   child: Container(
        //     color: widget.chartColor,
        //     height: 8,
        //     width: 12,
        //   ),
        // )
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CalorieIntake {
  final String meal;
  final double calories;
  final bool isSelected;

  const CalorieIntake({
    required this.meal,
    required this.calories,
    this.isSelected = false,
  });
}

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
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
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WalkingStatisticScreen extends StatefulWidget {
  const WalkingStatisticScreen({super.key});

  @override
  State<WalkingStatisticScreen> createState() => _WalkingStatisticScreenState();
}

class _WalkingStatisticScreenState extends State<WalkingStatisticScreen> {
  late List<HeartRateData> _chartData = [];
  bool _isLoading = true;
  late TrackballBehavior _trackballBehavior;
  Future<List<HeartRateData>> fetchHeartRateDataFromApi() async {
    // await Future.delayed(const Duration(seconds: 2));

    //! this is using random function which changes everytime
    final List<HeartRateData> data = [];
    final Random random = Random();
    final DateTime startTime =
        DateTime.now().subtract(const Duration(minutes: 80));
    for (int i = 0; i < 80; i++) {
      double previousBpm = i > 0 ? data[i - 1].bpm : 90;
      if (i > 0 && i % 15 == 0) {
        previousBpm += random.nextInt(35) - 10;
      }
      final double bpm =
          (previousBpm + random.nextDouble() * 10 - 5).clamp(75, 180);
      data.add(HeartRateData(startTime.add(Duration(minutes: i)), bpm));
    }
    return data;
  }

  Future<void> _loadData() async {
    final data = await fetchHeartRateDataFromApi();
    // Check if the widget is still mounted before calling setState
    if (mounted) {
      setState(() {
        _chartData = data;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // --- MINOR CHANGE 2: Call a new method to load data ---
    _loadData();

    // The trackball initialization can stay the same
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      lineType: TrackballLineType.vertical,
      lineColor: Colors.grey.withOpacity(0.5),
      lineWidth: 1,

      tooltipSettings: const InteractiveTooltip(
        enable: true,
      ),

      builder: _tooltipBuilder,
      // ),
      markerSettings: const TrackballMarkerSettings(
        markerVisibility: TrackballVisibilityMode.visible,
        shape: DataMarkerType.circle,
        height: 12,
        width: 12,
        color: Colors.white,
        borderColor: Color(0xFFF37F33),
        borderWidth: 3,
      ),
    );
  }

  static Widget _tooltipBuilder(
      BuildContext context, TrackballDetails trackballDetails) {
    // The point property gives us access to the data for that specific point.
    // It's a CartesianChartPoint which contains the x and y values.
    final CartesianChartPoint<dynamic> point = trackballDetails.point!;

    // Extract the x (time) and y (bpm) values from the point
    final DateTime time = point.x as DateTime;
    final double bpm = point.y as double;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('hh:mm a').format(time), // Use the extracted 'time'
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          // const SizedBox(height: 4),
          4.sBH,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${bpm.toInt()}', // Use the extracted 'bpm'
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(
                  text: ' bpm',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFF37F33),
        ),
      );
    }

    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Walking',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            gradient: AppDecoration().scaffoldGradient,
          ),
          child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0.r),
                    boxShadow: AppDecoration.addShadow()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Burned Calorie",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              fontSize: 11.sp, color: const Color(0xff484C52)),
                          outfitFont: OutfitFontStyle.semibold),
                    ),
                    Text(
                      "539 kcal",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              fontSize: 32.sp, color: const Color(0xff484C52)),
                          outfitFont: OutfitFontStyle.semibold),
                    ),
                    5.sBH,
                    SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      trackballBehavior: _trackballBehavior,
                      primaryXAxis: DateTimeAxis(
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        dateFormat: DateFormat('hh:mm a'),
                        initialVisibleMinimum: _chartData.isNotEmpty
                            ? _chartData[0].time
                            : DateTime.now(),
                        initialVisibleMaximum: _chartData.length > 60
                            ? _chartData[60].time
                            : DateTime.now(),
                        labelStyle: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 75,
                        maximum: 175,
                        interval: 25,
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(size: 0),
                        majorGridLines: MajorGridLines(
                          width: 1,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                      series: <CartesianSeries<HeartRateData, DateTime>>[
                        AreaSeries<HeartRateData, DateTime>(
                          dataSource: _chartData,
                          xValueMapper: (data, _) => data.time,
                          yValueMapper: (data, _) => data.bpm,
                          borderColor: const Color(0xFFF37F33),
                          borderWidth: 2,
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFF37F33).withOpacity(0.2),
                              const Color(0xFFF37F33).withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // 5.sBH,
              Text(
                "Key Statistics",
                style: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        fontSize: 20.sp, color: const Color(0xff484C52)),
                    outfitFont: OutfitFontStyle.semibold),
              ),
              // 5.sBH,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 180.h,
                      width: 28.w,
                      // margin:
                      //     EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0.r),
                        // boxShadow: AppDecoration.addShadow()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(svgSteps),
                              10.sBW,
                              Text("Steps",
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 14.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.regular)),
                            ],
                          ),
                          ProgressIndicator(
                              bgColor: Colors.grey[300]!,
                              fgColor: Color(0xffFFC600),
                              limit: "8000",
                              current: "5304",
                              measurementValue: '',
                              title: ""),
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
                                          outfitFont: OutfitFontStyle.medium),
                                      text: '8000',
                                      children: [
                                    TextSpan(
                                        text: " Steps",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: const Color(0xff5E5F60)),
                                            outfitFont:
                                                OutfitFontStyle.regular))
                                  ])),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  10.sBW,
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 85.h,
                          // width: 28.w,
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
                          height: 85.h,
                          // width: 58.w,
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              10.sBH,
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
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                " VS. 30 day average",
                style: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        fontSize: 12.sp, color: const Color(0xff484C52)),
                    outfitFont: OutfitFontStyle.regular),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 80.h,
                      // width: 28.w,
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0.r),
                        // boxShadow: AppDecoration.addShadow()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(svgAverageHR),
                              10.sBW,
                              Text("AVR HR",
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 14.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.regular)),
                            ],
                          ),
                          RichText(
                              text: TextSpan(
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 20.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.semibold),
                                  text: '133 ',
                                  children: [
                                TextSpan(
                                    text: "BPM",
                                    style: AppTextStyle.outfitStyle(
                                        withTextStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black),
                                        outfitFont: OutfitFontStyle.regular))
                              ])),
                        ],
                      ),
                    ),
                  ),
                  8.sBW,
                  Expanded(
                    child: Container(
                      height: 80.h,
                      // width: 28.w,
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0.r),
                        // boxShadow: AppDecoration.addShadow()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(svgMaxHr),
                              10.sBW,
                              Text("Max HR",
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 14.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.regular)),
                            ],
                          ),
                          RichText(
                              text: TextSpan(
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 20.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.semibold),
                                  text: '144 ',
                                  children: [
                                TextSpan(
                                    text: "BPM",
                                    style: AppTextStyle.outfitStyle(
                                        withTextStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black),
                                        outfitFont: OutfitFontStyle.regular))
                              ])),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              10.sBH,
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0.r),
                    boxShadow: AppDecoration.addShadow()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Typical range', // Use the extracted 'time'
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
                              outfitFont: OutfitFontStyle.regular),
                        ),
                        // const SizedBox(height: 4),
                        4.sBH,
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Duration:', // Use the extracted 'bpm'
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.light)),
                              TextSpan(
                                  text: ' 50 min 1 sec',
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 14.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.regular)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.sBH,
                    Text(
                      'Zone 5', // Use the extracted 'time'
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    10.sBH,
                    HeartRateZoneGauge(
                      isFilled: false,
                      bpmRange: "172",
                      percentage: 0,
                      duration: const Duration(minutes: 0, seconds: 0),
                    ),
                    10.sBH,
                    Text(
                      'Zone 4', // Use the extracted 'time'
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    10.sBH,
                    HeartRateZoneGauge(
                      isFilled: false,
                      bpmRange: "160-171 BPM",
                      percentage: 0,
                      duration: const Duration(minutes: 0, seconds: 0),
                    ),
                    10.sBH,
                    Text(
                      'Zone 3', // Use the extracted 'time'
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    10.sBH,
                    HeartRateZoneGauge(
                      isFilled: false,
                      bpmRange: "178-159 BPM",
                      percentage: 0,
                      duration: const Duration(minutes: 0, seconds: 0),
                    ),
                    10.sBH,
                    Text(
                      'Zone 2', // Use the extracted 'time'
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    10.sBH,
                    HeartRateZoneGauge(
                      isFilled: true,
                      bpmRange: "136-147 BPM",
                      percentage: 60,
                      duration: const Duration(minutes: 0, seconds: 0),
                    ),
                    10.sBH,
                    Text(
                      'Zone 1', // Use the extracted 'time'
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    10.sBH,
                    HeartRateZoneGauge(
                      isFilled: true,
                      bpmRange: "110-135 BPM",
                      percentage: 38,
                      duration: const Duration(minutes: 0, seconds: 0),
                    ),
                    10.sBH,
                    Text(
                      'Zone 0', // Use the extracted 'time'
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    10.sBH,
                    HeartRateZoneGauge(
                      isFilled: true,
                      bpmRange: "<110 BPM",
                      percentage: 10,
                      duration: const Duration(minutes: 0, seconds: 0),
                    ),
                    20.sBH
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeartRateData {
  HeartRateData(this.time, this.bpm);
  final DateTime time;
  final double bpm;
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.limit,
    required this.current,
    required this.title,
    this.measurementValue = 'g',
  });
  final Color bgColor;
  final Color fgColor;
  final String limit;
  final String current;
  final String title;
  final String measurementValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(2),
          height: 100.w,
          width: 100.w,
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
                  radiusFactor: 0.9,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.12.w,
                    color: bgColor,
                    thicknessUnit: GaugeSizeUnit.factor,
                    // cornerStyle: CornerStyle.startCurve,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: fgColor,
                      value: double.parse(current),
                      width: 0.12.w,
                      sizeUnit: GaugeSizeUnit.factor,
                      // cornerStyle: CornerStyle.endCurve
                    )
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
                            Text("/ $limit $measurementValue",
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

class HeartRateZoneGauge extends StatelessWidget {
  /// The text representing the BPM range, e.g., "136-147".
  final String bpmRange;

  /// The percentage of the bar to fill (0 to 100).
  final double percentage;

  /// The duration to display on the right side.
  final Duration duration;

  /// The color of the filled part of the progress bar.
  final Color progressColor;

  /// The color of the background track of the bar.
  final Color trackColor;

  /// The overall height of the bar.
  final double height;

  bool isFilled;

  HeartRateZoneGauge(
      {Key? key,
      required this.bpmRange,
      required this.percentage,
      required this.duration,
      this.progressColor = const Color(0xFFF97F09), // Default Orange
      this.trackColor = const Color(0xFFFFEDDE), // Default Light Orange
      this.height = 50.0,
      this.isFilled = true})
      : super(key: key);

  // Helper function to format the Duration into H:MM:SS
  String _formatDuration(Duration d) {
    if (d.isNegative) d = Duration.zero;
    return d.toString().split('.').first.padLeft(8, '0');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(children: [
        SfLinearGauge(
          animationDuration: 1000,
          // Set the gauge to represent a percentage scale.
          minimum: 0,
          maximum: 100,
          // Hide the default axis line, labels, and ticks.
          showLabels: false,
          showTicks: false,
          axisTrackStyle: const LinearAxisTrackStyle(thickness: 0),

          // Use two overlapping BarPointers to create the effect.
          // The first pointer in the list is drawn at the bottom.
          barPointers: [
            // 1. The Background Track Pointer
            // This pointer fills 100% of the width and acts as the background.
            LinearBarPointer(
              value: 100,
              thickness: height, // Use the full widget height
              color: isFilled ? trackColor : Color(0xffDEDEDE),
              enableAnimation: false,
              edgeStyle: LinearEdgeStyle.bothCurve,
              // cornerStyle: CornerStyle.bothCurve, // Makes it a pill shape
              // Place the duration text inside this background pointer.
              // child: Align(
              //   alignment: Alignment.centerRight,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     child: Text(
              //       _formatDuration(duration),
              //       style: const TextStyle(
              //         color: Color(0xFF333333),
              //         fontSize: 16,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // ),
              // child: Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           '$bpmRange BPM ${percentage.toInt()}%',
              //           style: AppTextStyle.outfitStyle(
              //               withTextStyle: TextStyle(
              //                   fontSize: 14.sp,
              //                   color: isFilled
              //                       ? Colors.white
              //                       : const Color(0xff484C52)),
              //               outfitFont: OutfitFontStyle.regular),
              //           maxLines: 1,
              //           overflow: TextOverflow.clip,
              //         ),
              //         Text(
              //           _formatDuration(duration),
              //           style: const TextStyle(
              //             color: Color(0xFF333333),
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ),

            // 2. The Foreground Progress Pointer
            // This pointer is drawn on top and represents the actual progress.
            LinearBarPointer(
              value: percentage, // Uses the dynamic percentage value
              thickness: height,
              color: progressColor,
              enableAnimation: false,
              edgeStyle: LinearEdgeStyle.bothCurve,
              // cornerStyle: CornerStyle.bothCurve,
              // Place the BPM and percentage text inside this progress pointer.
              // child: Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     child: Text(
              //       '$bpmRange BPM ${percentage.toInt()}%',
              //       style: TextStyle(
              //         color: isFilled ? Colors.white : Colors.black,
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //       ),
              //       maxLines: 1,
              //       overflow: TextOverflow.clip,
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$bpmRange BPM ${percentage.toInt()}%',
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: isFilled
                              ? Colors.white
                              : const Color(0xff484C52)),
                      outfitFont: OutfitFontStyle.regular),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  _formatDuration(duration),
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

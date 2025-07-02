import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
import 'package:nutriya/views/widget/gradient_scaffold.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class PersonalizationCaloriesCalculationScreen extends StatelessWidget {
  const PersonalizationCaloriesCalculationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomGradientBackground(),
          CaloriesCalculatorProgress(
            targetValue: 100,
          )
        ],
      ),
    );
  }
}

class CaloriesCalculatorProgress extends StatefulWidget {
  final double targetValue;
  const CaloriesCalculatorProgress({
    super.key,
    required this.targetValue,
  });

  @override
  State<CaloriesCalculatorProgress> createState() =>
      _CaloriesCalculatorProgressState();
}

class _CaloriesCalculatorProgressState extends State<CaloriesCalculatorProgress>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Create an animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Animation duration
      vsync: this,
    );

    // Create a Tween to animate from 0 to the target value
    _animation = Tween<double>(begin: 0, end: widget.targetValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addStatusListener((status) {
      // Check if the animation has completed
      if (status == AnimationStatus.completed) {
        // And if the target value was 100
        if (widget.targetValue == 100.0) {
          // A short delay for the user to see "100%" before navigating.
          Future.delayed(const Duration(milliseconds: 500), () {
            // It's good practice to check if the widget is still mounted
            // before trying to navigate.
            if (mounted) {
              appNavigator.pushNamed(routeCaloriesPlanReady);
            }
          });
        }
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        70.sBH,
        Text('Personalizing your Nutria experience',
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 26.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.semibold)),
        50.sBH,
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SfRadialGauge(
              enableLoadingAnimation: false,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 160,
                  endAngle: 160,
                  radiusFactor: 0.7,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2.w,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_silver!
                        .withOpacity(0.7),
                    thicknessUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothFlat,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen,
                        value: _animation.value,
                        width: 0.2.w,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor:
                          0.1, // Positions it vertically in the center
                      // angle: 10, // Positions it horizontally in the center
                      widget: Text('${_animation.value.toInt()}%',
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 46.sp, color: Colors.black),
                              outfitFont: OutfitFontStyle.semibold)),
                    )
                  ],
                )
              ],
            );
          },
        ),
        Spacer(),
        Text('We’re cooking up something just \nfor you—hang tight!',
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular)),
        30.sBH
      ],
    );
  }
}

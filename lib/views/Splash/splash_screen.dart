import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/widget/gradient_scaffold.dart';

import '../../RouteManager/navigator_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.addStatusListener((status) {
      // String userId = getIt<LocalDataManager>().userId;
      // print(userId);
      if (status == AnimationStatus.completed) {
        print("_______");
        //   print(getIt<AppDetailService>().appDetails?.appVersion);
        //
        //   if (shouldShowUpdatePop) {
        //   } else {
        //AnalyticsHelper.shared.trackUserEvent(eventName: "session_start");
        // hasLogout
        appNavigator.pushReplacementNamed(routeDashboard);
        // : appNavigator.pushReplacementNamed(
        // AppRouteManager.shared.determineRoute());
        // if (userId == "") {
        //   appNavigator.pushReplacementNamed(routeIntro);
        // } else {
        //   appNavigator.pushNamed(routeDashboard);
        // }
        // }
      }
    });
  }

  setupAnimation() {
    _logoScaleAnimation = Tween<double>(begin: 1.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setupAnimation();
    return GradientScaffold(
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _logoScaleAnimation.value,
                  child: SizedBox(
                    width: 120.w,
                    height: 120.w,
                    child: Image.asset(
                      svgNutriyaLogo, // Replace with your logo path
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: SlideTransition(
                    position: _textSlideAnimation,
                    child: Text(
                      'India’s First AI Nutrition\nCoach for Every Plate.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 22.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.semibold),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// import 'dart:math';
//
// import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nutriya/RouteManager/navigator_service.dart';
// import 'package:nutriya/extension/extension_sized_box.dart';
// import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// import '../../../../utils/CustomWidgets/Button/custom_button.dart';
// import '../../../../utils/styles/app_text_styles.dart';
// import '../../../utils/app_string/app_image_path.dart';
// import '../../widgets/gradient_scaffold.dart';
//
// class IntroScreen extends StatefulWidget {
//   // final UserBasicDetailsViewModel controller;
//
//   const IntroScreen({super.key});
//
//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   // List<Legend> legends = [
//   //   Legend(color: const Color(0xff1A96F0), legendDesc: "Very severely underweight"),
//   //   Legend(color: const Color(0xff00A9F1), legendDesc: "Severely underweight"),
//   //   Legend(color: const Color(0xff00BCD3), legendDesc: "Underweight"),
//   //   Legend(color: const Color(0xff4AAF57), legendDesc: "Normal"),
//   //   Legend(color: const Color(0xffFFC02D), legendDesc: "Overweight"),
//   //   Legend(color: const Color(0xffFF981F), legendDesc: "Obese Class I"),
//   //   Legend(color: const Color(0xffFF5726), legendDesc: "Obese Class II"),
//   //   Legend(color: const Color(0xffF54336), legendDesc: "Obese Class III"),
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             const CustomGradientBackground(),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.w),
//               child: Column(
//                 children: [
//                   20.sBH,
//                   // Text("BMI (kg/m2)",
//                   //     style: AppTextStyle.outfitStyle(
//                   //         withTextStyle:
//                   //         TextStyle(fontSize: 26.sp, color: Colors.black),
//                   //         outfitFont: OutfitFontStyle.medium)),
//                   // 10.sBH,
//                   // Text("What do you usually eat?",
//                   //     style: AppTextStyle.outfitStyle(
//                   //         withTextStyle:
//                   //         TextStyle(fontSize: 16.sp, color: Colors.black),
//                   //         outfitFont: OutfitFontStyle.regular)),
//   _intro(),
//                   const Spacer(),
//                   // Consumer<UserBasicDetailsViewModel>(
//                   //     builder: (context, controller, child) {
//                   //       return CustomButton(
//                   //           buttonText: "Next",
//                   //           padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
//                   //           buttonTextStyle: AppTextStyle.outfitStyle(
//                   //               withTextStyle: TextStyle(fontSize: 16.sp),
//                   //               outfitFont: OutfitFontStyle.medium),
//                   //           width: 500.w,
//                   //           onPressed: (startLoading, stopLoading, btnState) {
//                   //             controller.changeCurrentPage();
//                   //             appNavigator.goBack();
//                   //           },
//                   //           isDisabled: false,
//                   //           disableElevation: false);
//                   //     }
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _intro() {
//     return Column(
//       children: [
//         10.sBH,
//         Container(
//           height: 200.h,
//             child: Image.asset(pngIntro1, scale: 3.5)),
//         10.sBH,
//         Text("Snap & Track : One snap. Full breakdown.", style: AppTextStyle.outfitStyle(
//             withTextStyle:
//             TextStyle(fontSize: 26.sp, color: Colors.black),
//             outfitFont: OutfitFontStyle.semibold)),
//         10.sBH,
//         Text("Discover the groundbreaking features that make Nutria the\nfirst true AI nutrition coach for InNutriya’s AI understands\nyour plate — even if it’s bhindi, kadhi, or pongal.\n Just click a photo. We’ll handle the rest.dia's diverse culinary\nlandscape."),
//         10.sBH,
//         ArcProgressBar(
//             percentage: 30,
//             arcThickness: 5,
//             innerPadding: 16,
//             animateFromLastPercent: true,
//             handleSize: 20,
//             // animationCurve: Curves.,
//
//             backgroundColor: Colors.black12,
//             foregroundColor: Colors.black,
//         )
//         // const CustomDropdown(
//         //   options: [
//         //     "Dairy / Lactose",
//         //     "Gluten / Wheat",
//         //     "Eggs",
//         //     "Shellfish",
//         //     "Seafood",
//         //     "Spices (e.g., red chili, mustard seeds)",
//         //     "Soy",
//         //     "Citrus fruits",
//         //     "Other (Add manually)"
//         //   ],
//         //   selectedValue: 'Allergy',
//         // ),
//         // // 10.sBH,
//         //
//         // CustomButton(
//         //     buttonText: "Continue",
//         //     padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
//         //     buttonTextStyle: AppTextStyle.outfitStyle(
//         //         withTextStyle: TextStyle(fontSize: 16.sp),
//         //         outfitFont: OutfitFontStyle.medium),
//         //     width: 500.w,
//         //     onPressed: (startLoading, stopLoading, btnState) {
//         //       widget.controller.changeCurrentPage();
//         //     },
//         //     isDisabled: false,
//         //     disableElevation: false),
//       ],
//     );
//   }
// }
//
//
// // class CurvedProgressBar extends StatelessWidget {
// //   final double progress; // 0.0 to 1.0
// //
// //   const CurvedProgressBar({super.key, required this.progress});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomPaint(
// //       painter: _ArcPainter(progress),
// //       child: const SizedBox(
// //         width: double.infinity,
// //         height: 60,
// //       ),
// //     );
// //   }
// // }
// //
// // class _ArcPainter extends CustomPainter {
// //   final double progress;
// //   _ArcPainter(this.progress);
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final Paint paint = Paint()
// //       ..color = Colors.green
// //       ..strokeWidth = 4
// //       ..style = PaintingStyle.stroke;
// //
// //     // Adjusted center to go BELOW the screen, so we only see top of arc
// //     final center = Offset(size.width / 2, size.height + 40);
// //
// //     // Smaller radius
// //     final radius = size.width * 0.5;
// //
// //     // Start from left and draw a slight arc
// //     final startAngle = pi; // 180 degrees
// //     final sweepAngle = pi * progress * 0.5; // Only 90 degrees max
// //
// //     final rect = Rect.fromCircle(center: center, radius: radius);
// //     canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
// //   }
// //
// //   @override
// //   bool shouldRepaint(_ArcPainter oldDelegate) {
// //     return oldDelegate.progress != progress;
// //   }
// // }
//
//
//
// class CurvedProgressBar extends StatefulWidget {
//   @override
//   _CurvedProgressBarState createState() => _CurvedProgressBarState();
// }
//
// class _CurvedProgressBarState extends State<CurvedProgressBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..forward();
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 20,
//       decoration: BoxDecoration(
//         color: Colors.blue[50],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return CustomPaint(
//               painter: CurvedProgressPainter(progress: _animation.value),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class CurvedProgressPainter extends CustomPainter {
//   final double progress;
//
//   CurvedProgressPainter({required this.progress});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.green
//       ..strokeWidth = size.height
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke;
//
//     final startPoint = Offset(0, size.height / 2);
//     final endPoint = Offset(size.width * progress, size.height / 2);
//     final controlPoint1 = Offset(size.width * progress * 0.3, size.height / 2 - size.height / 4);
//     final controlPoint2 = Offset(size.width * progress * 0.7, size.height / 2 + size.height / 4);
//
//     final path = Path();
//     path.moveTo(startPoint.dx, startPoint.dy);
//     path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, endPoint.dx, endPoint.dy);
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/app_routes.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  int _step = 1;
  static const int maxSteps = 3;
  List<IntroScreenModel> introScreenModelList = [
    IntroScreenModel(
        image: pngIntro1,
        title: "Snap & Track : One snap.\nFull breakdown.",
        subtitle:
            "Nutriya’s AI understands your plate — even if it’s\nbhindi, kadhi, or pongal. Just click a photo. We’ll handle the rest."),
    IntroScreenModel(
        image: pngIntro2,
        title: "India's Most Comprehensive\nFood Database",
        subtitle:
            "Whether it’s Kashmiri Rogan Josh or Tamil Nadu’s Rasam,\nNutriya understands what’s really on your plate — macros,\nmicros, magic and all."),
    IntroScreenModel(
        image: pngIntro3,
        title: "Track Your Progress,\nVisually",
        subtitle:
            "Nutriya shows your progress in smart, simple visuals.\nSo you always know what’s working — and what’s not."),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double linearProgress = _step / maxSteps;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F7),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            _currentPage(introScreenModelList[_step - 1]),
            const Spacer(),
            CustomPaint(
              size: Size(screenWidth, 50.h),
              painter: CurvedProgressBarPainter(progress: linearProgress),
            ),
            // 15.sBH,
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_step < maxSteps) {
                    _step++;
                  } else {
                    appNavigator.pushNamed(routeLogin);
                    // _step = maxSteps;
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  // color: Colors.green,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: const Color(0xff8BE84F), width: 1),
                ),
                child: Container(
                  width: 200.w,
                  height: 43.h,
                  // padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .primaryGreen,
                    borderRadius: BorderRadius.circular(32),
                    // border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: _step == maxSteps
                      ? Text(
                          "Get Started",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 18.sp, color: Colors.white),
                              outfitFont: OutfitFontStyle.semibold),
                        )
                      : const Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _currentPage(IntroScreenModel model) {
    return Column(
      children: [
        Image.asset(
          model.image, // Replace with your asset
          scale: 3.2,
        ),
        SizedBox(height: 25.h),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 26.sp, color: Colors.black),
              outfitFont: OutfitFontStyle.semibold),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            model.subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular),
          ),
        ),
      ],
    );
  }
}

class CurvedProgressBarPainter extends CustomPainter {
  final double progress;

  CurvedProgressBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint basePaint = Paint()
      ..color = const Color(0xff8BE84F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.h;

    final Paint progressPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.h;

    final Path fullPath = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width / 2, 90, size.width, 0);

    // Draw the full base path (background line)
    canvas.drawPath(fullPath, basePaint);

    // Clip the path according to progress (approximate by scaling X)
    final Path progressPath = Path();
    final double endX = size.width * progress;
    progressPath.moveTo(0, 0);
    progressPath.quadraticBezierTo(
        endX / 2, 80 * progress / 0.95, endX, progress != 1 ? 40 : 0);
    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(CurvedProgressBarPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class IntroScreenModel {
  final String image;
  final String title;
  final String subtitle;

  IntroScreenModel(
      {required this.image, required this.title, required this.subtitle});
}

import 'package:flutter/material.dart';

import '../../utils/app_string/app_image_path.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientScaffold({
    super.key,
    required this.child,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(pngGradientBg), scale: 3.5),
      ),
      child: SafeArea(child: child),
    ));
  }
}

class CustomGradientBackground extends StatelessWidget {
  const CustomGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left pink radial
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 4,
                colors: [
                  const Color(0xFFFF8BCF).withOpacity(0.3),
                  Colors.white.withOpacity(0.0),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),

        // Bottom-right blue radial
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomRight,
                radius: 1.8,
                colors: [
                  const Color(0xFFE0F4FF),
                  Colors.white.withOpacity(0.0),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class CustomGradientBackground extends StatelessWidget {
//   const CustomGradientBackground({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: GradientBackgroundPainter(),
//       child: Container(), // This lets it expand fully
//     );
//   }
// }
//
// class GradientBackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Rect rect = Offset.zero & size;
//
//     // Draw gradient background
//     final gradient = LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       transform: GradientRotation(-0.5),
//       colors: [
//         const Color(0xFFFF8BCF).withOpacity(0.1),
//         const Color(0xFFD5D5D5),
//         const Color(0xFFE0F4FF),
//       ],
//       stops: [0.0, 0.48, 0.7],
//     );
//
//     final paint = Paint()..shader = gradient.createShader(rect);
//
//     canvas.drawRect(rect, paint);
//
//     // Draw the white-ish circular lines
//     // final circlePaint = Paint()
//     //   ..color = const Color(0xffD5D5D5)
//     //   ..style = PaintingStyle.stroke
//     //   ..strokeWidth = 1;
//     //
//     // final center = Offset(size.width / 2, size.height / 2);
//     // // final radiusStep = size.width * 0.5; // Adjust as needed
//     // final double radiusStep = 130; // Your fixed increment
//     // final int circleCount = 4;
//     //
//     // for (int i = 1; i <= circleCount; i++) {
//     //   if(i == 1) continue;
//     //   canvas.drawCircle(center, radiusStep * i, circlePaint);
//     // }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

import 'package:flutter/material.dart';

class CommonGradient extends StatelessWidget {
  const CommonGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // center: Alignment.topLeft,
          // radius: 4,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFEDEDED),
          ],
          stops: [0.0, 0.8],
        ),
      ),

      // // Bottom-right blue radial
      // Positioned.fill(
      //   child: Container(
      //     decoration: BoxDecoration(
      //       gradient: RadialGradient(
      //         center: Alignment.bottomRight,
      //         radius: 1.8,
      //         colors: [
      //           const Color(0xFFE0F4FF),
      //           Colors.white.withOpacity(0.0),
      //         ],
      //         stops: [0.0, 1.0],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

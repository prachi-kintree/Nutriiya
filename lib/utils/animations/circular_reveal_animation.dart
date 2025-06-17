import 'package:flutter/material.dart';

class CircularRevealRoute extends PageRouteBuilder {
  final Widget enterWidget;

  CircularRevealRoute(
      {required this.enterWidget, required RouteSettings settings})
      : super(
          opaque: false,
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionDuration: Duration(milliseconds: 1500),
          reverseTransitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.fastLinearToSlowEaseIn,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
                alignment: Alignment(0.0, 0.90),
                scale: animation,
                child: child);
          },
        );
}

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

// https://verygood.ventures/blog/a-deep-dive-into-the-flutter-animations-package
class FadeInRoute extends PageRouteBuilder {
  final Widget page;

  FadeInRoute({required this.page, required RouteSettings settings})
      : super(
          settings: settings, // set name here
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 500),
        );
}

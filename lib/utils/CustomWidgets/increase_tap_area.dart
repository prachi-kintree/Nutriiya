import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';

class IncreaseTapArea extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  IncreaseTapArea({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return ExpandTapWidget(
      onTap: onTap,
      tapPadding: EdgeInsets.all(5),
      child: child,
    );
  }
}

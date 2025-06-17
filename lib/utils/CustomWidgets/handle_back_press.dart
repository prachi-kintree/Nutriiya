import 'package:flutter/material.dart';

class BackButtonGestureHandlerWidget extends StatelessWidget {
  final Function onBackPress;
  final Widget child;
  BackButtonGestureHandlerWidget(
      {required this.onBackPress, required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: child,
        onWillPop: () async {
          onBackPress();
          return true;
        });
  }
}

import 'package:flutter/material.dart';

class ErrorWidgetClass extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  ErrorWidgetClass({required this.errorDetails});
  @override
  Widget build(BuildContext context) {
    return Text(errorDetails.toString());
  }
}

import 'package:flutter/material.dart';

class InitWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const InitWrapper({required this.onInit, required this.child});
  @override
  _InitWrapperState createState() => _InitWrapperState();
}

class _InitWrapperState extends State<InitWrapper> {
  @override
  void initState() {
    widget.onInit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

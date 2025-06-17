import 'package:flutter/material.dart';

class KeyBoardAwareWidget extends StatelessWidget {
  final Widget child;
  KeyBoardAwareWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: child);
  }
}

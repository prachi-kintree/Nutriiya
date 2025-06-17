import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../theme/theme_model.dart';

class BottomCurvedContainer extends StatelessWidget {
  final Widget child;
  const BottomCurvedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25.h, left: 20.w,right: 20.w),
        height: 450.h,
        decoration: BoxDecoration(
            color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h), topRight: Radius.circular(20.h))),
        child: child);
  }
}

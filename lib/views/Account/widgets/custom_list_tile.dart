import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';

class CustomListTile extends StatelessWidget {
  final Widget child;
  const CustomListTile({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsetsGeometry.only(bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        color: Colors.white,
        boxShadow: AppDecoration.commonBoxShadow()
      ),
      child: child,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../app_string/app_image_path.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';


class MemeberCard extends StatelessWidget {
  final String memberName;
  final String imagePath;
  final bool isFilled;
  final bool isSelectable;
  MemeberCard(
      {required this.memberName,
      required this.imagePath,
      required this.isFilled,
      required this.isSelectable});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 130.h,
      decoration: BoxDecoration(
          color: isSelectable
              ? ThemeManagerPlus.of<AppTheme>(context).currentTheme.white
              : ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .circular_background,
          //boxShadow: AppDecoration.addShadow(),
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 90.w, height: 90.w, child: Image.asset(imagePath)),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  memberName,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: isSelectable
                              ? ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .black
                              : ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .disabledGrey,
                          fontSize: 16.sp),
                      jakartaFont: JakartaStyle.bold),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 6.w, end: 10.w),
              child: isFilled
                  ? SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        svgTick,
                        fit: BoxFit.scaleDown,
                      ))
                  : Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15.w)),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

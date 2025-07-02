import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../styles/app_decoration.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';


class GenderCard extends StatelessWidget {
  final String imagePath;
  final String genderTile;
  final bool isSelected;
  GenderCard(
      {required this.imagePath,
      required this.genderTile,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 130.h,
      decoration: BoxDecoration(
          color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
          boxShadow: AppDecoration.addShadow(),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  genderTile,
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .grey,
                          fontSize: 16.sp),
                      outfitFont: OutfitFontStyle.medium),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 6.w, end: 10.w),
              child: isSelected
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .feeling_bg_light_pink,
                              borderRadius: BorderRadius.circular(10.w)),
                        ),
                        Container(
                          width: 13.w,
                          height: 13.w,
                          decoration: BoxDecoration(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .purple_500,
                              borderRadius: BorderRadius.circular(10.w)),
                        ),
                      ],
                    )
                  : Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .feeling_bg_light_pink,
                          borderRadius: BorderRadius.circular(10.w)),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

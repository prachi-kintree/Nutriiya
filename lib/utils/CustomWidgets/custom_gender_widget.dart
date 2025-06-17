import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import '../../translation/locale_keys.g.dart';
import '../app_string/app_image_path.dart';
import '../app_string/app_strings.dart';
import '../styles/app_decoration.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';
import 'gender_card.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                // controller.setGender(1);
                // controller.setGenderError(false);
              },
              child: Gender(
                  imagePath: pngMaleSymbol,
                  genderTile: LocaleKeys.general_male.tr(),
                  isSelected: false,
                  // controller: controller
              ),
            ),
            20.sBH,
            InkWell(
              onTap: () {
                // controller.setGender(2);
                // controller.setGenderError(false);
              },
              child: Gender(
                imagePath: pngFemaleSymbol,
                genderTile: LocaleKeys.general_female.tr(),
                isSelected: true,
                // controller: controller
              ),

            ),
            20.sBH,
            Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w),
                  child: Text(
                    LocaleKeys.error_empty_gender_2.tr(),
                    style: AppTextStyle.jakartaStyle(
                        withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .error),
                        jakartaFont: JakartaStyle.medium),
                  ),
                )),
          ],
        );

  }
}

class Gender extends StatelessWidget {
  final String imagePath;
  final String genderTile;
  final bool isSelected;
  // final UserBasicDetailViewModel controller;

  Gender(
      {required this.imagePath,
        required this.genderTile,
        required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.h),
      // width: 140.w,
      // height: 130.h,
      decoration: BoxDecoration(
          color: isSelected ? ThemeManagerPlus.of<AppTheme>(context).currentTheme.purple_500 : ThemeManagerPlus.of<AppTheme>(context).currentTheme.feeling_bg_light_pink,
          shape: BoxShape.circle,
          boxShadow: AppDecoration.addShadow(),
          // border: Border.all(color: controller.genderError ? ThemeManagerPlus.of<AppTheme>(context).currentTheme.error! : ThemeManagerPlus.of<AppTheme>(context).currentTheme.purple_500!.withOpacity(0.5))
          // borderRadius: BorderRadius.circular(10)
      ),
      child:
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imagePath, scale: 3, color: isSelected ? ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .white : ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .black),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  genderTile,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: isSelected ? ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .white : ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .light_black_text_color,
                          fontSize: 16.sp),
                      jakartaFont: JakartaStyle.medium),
                )
              ],
            ),
          ),

          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: EdgeInsetsDirectional.only(top: 6.w, end: 10.w),
          //     child: isSelected
          //         ? Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         Container(
          //           width: 20.w,
          //           height: 20.w,
          //           decoration: BoxDecoration(
          //               color: ThemeManagerPlus.of<AppTheme>(context)
          //                   .currentTheme
          //                   .feeling_bg_light_pink,
          //               borderRadius: BorderRadius.circular(10.w)),
          //         ),
          //         Container(
          //           width: 13.w,
          //           height: 13.w,
          //           decoration: BoxDecoration(
          //               color: ThemeManagerPlus.of<AppTheme>(context)
          //                   .currentTheme
          //                   .purple_500,
          //               borderRadius: BorderRadius.circular(10.w)),
          //         ),
          //       ],
          //     )
          //         : Container(
          //       width: 20.w,
          //       height: 20.w,
          //       decoration: BoxDecoration(
          //           color: ThemeManagerPlus.of<AppTheme>(context)
          //               .currentTheme
          //               .feeling_bg_light_pink,
          //           borderRadius: BorderRadius.circular(10.w)),
          //     ),
          //   ),
          // )

    );
  }
}


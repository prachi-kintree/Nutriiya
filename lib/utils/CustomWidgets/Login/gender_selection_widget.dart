import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';


import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../custom_gender_widget.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      20.sBH,
      Text(
        userInfoHead3,
        textAlign: TextAlign.center,
        style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 24.sp),
            jakartaFont: JakartaStyle.semibold),
      ),
      12.sBH,
      Text(
        userInfoSubHead3,
        textAlign: TextAlign.center,
        style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 12.sp),
            jakartaFont: JakartaStyle.regular),
      ),
      SizedBox(
        height: 40.h,
      ),

      GenderWidget(),

      SizedBox(
        height: 20.h,
      ),
    ]);
  }
}

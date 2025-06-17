import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
// import 'package:kintree/extension/extension_sized_box.dart';
// import 'package:kintree/utils/CustomWidgets/custom_calender.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
// import 'package:theme_manager_plus/theme_wrapper.dart';

// import '../../../view_model/Login/user_basic_detail_view_model.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../custom_calender.dart';

class BirthdaySelectionWidget extends StatelessWidget {
  const BirthdaySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      20.sBH,
      Text(
        userInfoHead2,
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
        userInfoSubHead2,
        textAlign: TextAlign.center,
        style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 12.sp),
            jakartaFont: JakartaStyle.regular),
      ),


      CustomCalender(),

      SizedBox(
        height: 20.h,
      ),
    ]);
  }
}

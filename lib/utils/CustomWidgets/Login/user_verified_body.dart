import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/app_routes.dart';
import '../../../RouteManager/navigator_service.dart';
import '../../app_string/app_image_path.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../Button/custom_button.dart';

class UserVerifiedBodyWidget extends StatelessWidget {
  const UserVerifiedBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.sBH,
        Image.asset(pngFamilyExplorer, scale: 3.5),
        40.sBH,
        Text(knowUserMore,
            textAlign: TextAlign.center,
            style: AppTextStyle.jakartaStyle(
                withTextStyle: TextStyle(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .black,
                    fontSize: 22.sp),
                jakartaFont: JakartaStyle.semibold)),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(left:10.w, right: 10.w, bottom: 30.h),
          child: CustomButton(
            // isDisabled: !controller.enableBtn,
            onPressed: (startLoading, stopLoading, btnState) async {
              appNavigator.pushReplacementNamed(routeLoginBasicDetail);
            },
            width: 500.h,
            height: 45.h,
            buttonText: btnCreateProfile,
            buttonTextStyle: AppTextStyle.jakartaStyle(
              withTextStyle: TextStyle(
                  color:
                      ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
                  fontSize: 15.sp),
              jakartaFont: JakartaStyle.bold,
            ),
          ),
        ),
      ],
    );
  }
}

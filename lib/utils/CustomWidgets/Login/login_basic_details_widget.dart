import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../Injector/app_injector.dart';
import '../../TextFieldValidator/fleld_validator.dart';
import '../../app_string/app_placeholder_text.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../Textfields/floating_text_field.dart';

class LoginBasicDetailsWidget extends StatelessWidget {
  const LoginBasicDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      20.sBH,
      Text(
        userInfoHead1,
        style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 24.sp),
            jakartaFont: JakartaStyle.semibold),
      ),
      12.sBH,
      Text(
        userInfoSubHead1,
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
      // Consumer<UserBasicDetailViewModel>(builder: (context, controller, child) {
      //   return FloatingLabelTextField(
      //       textStyle: AppTextStyle.figTreeStyle(
      //           withTextStyle: TextStyle(
      //               color: ThemeManagerPlus.of<AppTheme>(context)
      //                   .currentTheme
      //                   .black,
      //               fontSize: 15.sp),
      //           figTreeFont: FigTreeFontStyle.bold),
      //       enabledBorderWidth: 3,
      //       contentPadding:
      //           EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      //       floatingLabelText: plcFirstName,
      //       textInputType: TextInputType.name,
      //       isRequired: true,
      //       onValueChanged: (value) {
      //         controller.setFirstName(value);
      //       },
      //       textValidator: (userInput) {
      //         return getIt<FieldValidator>().validateName(
      //             message: "Enter Valid First Name", text: userInput?.trim());
      //       });
      // }),
      SizedBox(
        height: 20.h,
      ),
      // Consumer<UserBasicDetailViewModel>(builder: (context, controller, child) {
      //   return FloatingLabelTextField(
      //     textStyle: AppTextStyle.figTreeStyle(
      //         withTextStyle: TextStyle(
      //             color:
      //                 ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
      //             fontSize: 15.sp),
      //         figTreeFont: FigTreeFontStyle.bold),
      //     enabledBorderWidth: 3,
      //     contentPadding:
      //         EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      //     floatingLabelText: "Middle Name",
      //     textInputType: TextInputType.name,
      //     isRequired: false,
      //
      //     onValueChanged: (value) {
      //       controller.setMiddleName(value.trim());
      //     },
      //   );
      // }),
      SizedBox(
        height: 20.h,
      ),
      // Consumer<UserBasicDetailViewModel>(builder: (context, controller, child) {
      //   return FloatingLabelTextField(
      //     textStyle: AppTextStyle.figTreeStyle(
      //         withTextStyle: TextStyle(
      //             color:
      //                 ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
      //             fontSize: 15.sp),
      //         figTreeFont: FigTreeFontStyle.bold),
      //     enabledBorderWidth: 3,
      //     contentPadding:
      //         EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      //     floatingLabelText: plcLastName,
      //     textInputType: TextInputType.name,
      //     isRequired: true,
      //     onValueChanged: (value) {
      //       controller.setLastName(value);
      //     },
      //     textValidator: (userInput) {
      //       return getIt<FieldValidator>().validateName(
      //           message: "Enter Valid Last Name", text: userInput?.trim());
      //     },
      //   );
      // }),
      SizedBox(
        height: 20.h,
      ),
    ]);
  }
}

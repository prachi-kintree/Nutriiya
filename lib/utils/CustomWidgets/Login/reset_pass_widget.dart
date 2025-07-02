import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../translation/locale_keys.g.dart';
import '../../app_string/app_placeholder_text.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../Button/custom_button.dart';
import '../Textfields/floating_password_text_field.dart';


class ResetPasswordFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ResetPasswordFormWidget(
      {super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: Text(
                  LocaleKeys.reset_header.tr(),
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .purple_500,
                          fontSize: 25.sp),
                      outfitFont: OutfitFontStyle.bold),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, top: 10),
                child: Text(
                  "(You're just one step away)",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .light_black_text_color,
                          fontSize: 14.sp),
                      outfitFont: OutfitFontStyle.regular),
                ),
              ),
              20.sBH,
              FloatingLabelPasswordField(
                  enabledBorderWidth: 3,
                  floatingLabelText: plcEnterPassword,
                  textInputType: TextInputType.name,
                  // isVisible: controller.isEnterPasswordVisible,
                  // enabledBorderWidth: 3,
                  onValueChanged: (userInput) {
                    // controller.capturePassword(userPassword: userInput);
                  },
                  onEyeButtonClick: () {
                    // controller.showPassword();
                  },
                  textValidator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Hey! you forgot to set the password";
                    } else if ((value ?? "").length < 5) {
                      return "Your password must contain at least 5 characters";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: 15.h,
              ),
              FloatingLabelPasswordField(
                  floatingLabelText: plcConfirmPassword,
                  enabledBorderWidth: 3,
                  isEyeVisible: true,
                  textInputType: TextInputType.name,
                  onValueChanged: (userInput) {
                    // controller.captureConfirmPassword(
                    //     userConfirmPassword: userInput);
                  },
                  onEyeButtonClick: () {
                    // controller.showPassword();
                  },
                  textValidator: (value) {
                    // if ((value ?? "").isEmpty) {
                    //   return "Hey! you forgot to set confirm password.";
                    // } else if (controller.confirmPassword !=
                    //     controller.password) {
                    //   return "Passwords do not match";
                    // } else {
                    //   return null;
                    // }
                  }),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CustomButton(
                  isDisabled: false,
                  width: 160.w,
                  onPressed: (startLoading, stopLoading, btnState) async {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState?.validate() ?? false) {
                      // controller.resetPassword(
                      //     startLoading: startLoading,
                      //     stopLoading: stopLoading,
                      //     context: context);
                    } else {
                      stopLoading();
                    }
                  },
                  buttonText: LocaleKeys.reset_header.tr(),
                  buttonTextStyle: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .white,
                        fontSize: 15.sp),
                    outfitFont: OutfitFontStyle.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

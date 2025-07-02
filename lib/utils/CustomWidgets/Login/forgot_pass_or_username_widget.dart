import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';


import '../../../translation/locale_keys.g.dart';
import '../../../utils/CustomWidgets/Button/custom_outlined_button.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../Button/custom_button.dart';


class ForgotPasswordOrUsernameWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  // final ForgetUserNameOrPasswordViewModel controller;
  const ForgotPasswordOrUsernameWidget(
      {super.key, required this.formKey,
        // required this.controller
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Form(
            key: formKey,
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   controller.isForUserName
                    //       ? LocaleKeys.forgot_username.tr()
                    //       : forgetPassword,
                    //   style: AppTextStyle.figTreeStyle(
                    //       withTextStyle: TextStyle(
                    //           color: ThemeManagerPlus.of<AppTheme>(context)
                    //               .currentTheme
                    //               .purple_500,
                    //           fontSize: 24.sp),
                    //       figTreeFont: FigTreeFontStyle.bold),
                    // ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.only(start: 10.w, top: 10),
                      // child: Text(
                      //   !controller.isForUserName
                      //       ? "(Not to worry, let's get you a new one)"
                      //       : "(Let's get to know your username)",
                      //   style: AppTextStyle.figTreeStyle(
                      //       withTextStyle: TextStyle(
                      //           color: ThemeManagerPlus.of<AppTheme>(context)
                      //               .currentTheme
                      //               .light_black_text_color,
                      //           fontSize: 14.sp),
                      //       figTreeFont: FigTreeFontStyle.regular),
                      // ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //MobileTextField()

                // if (controller.shouldDisplayMobileField) ...[
                //   MobileTextField(
                //     initialValue: controller.userInput,
                //     keyboardType: TextInputType.emailAddress,
                //     enabledBorderWidth: 3,
                //     shouldAutoFocus:
                //         controller.userInput.isEmpty ? false : true,
                //         countryFlag: controller.countryFlag,
                //         onValueChanged: (text) {
                //           controller.trackUserInput(text);
                //         },
                //         textValidator: (value) {
                //           return getIt<FieldValidator>()
                //               .validateEmailOrMobile(
                //               text: value,
                //               isEmail:
                //               !controller.shouldDisplayMobileField);
                //         },
                //         countryPrefix: controller.countryCode,
                //         onCountryCodePressed: (value) {},
                //       )
                //     ] else ...[
                //       FloatingLabelTextField(
                //           initialValue: controller.userInput,
                //           shouldAutoFocus:
                //           controller.userInput.isEmpty ? false : true,
                //       enabledBorderWidth: 3,
                //       onValueChanged: (text) {
                //         controller.trackUserInput(text);
                //       },
                //       textValidator: (value) {
                //         return getIt<FieldValidator>().validateEmailOrMobile(
                //             text: value,
                //             isEmail: !controller.shouldDisplayMobileField);
                //       },
                //       floatingLabelText: plcEmail,
                //       textInputType: TextInputType.emailAddress),
                // ],
                SizedBox(
                  height: 15.h,
                ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: CustomButton(

                        onPressed:
                            (startLoading, stopLoading, btnState) async {
                              FocusScope.of(context).unfocus();
                          // if (formKey.currentState?.validate() ?? false) {
                          //   await controller.validateForgetEmailOrMobileField(
                          //       startLoading: startLoading,
                          //       stopLoading: stopLoading);
                          // } else {
                          //   stopLoading();
                          // }
                        },
                        width: 500.h,
                        height: 37.h,
                        buttonText: LocaleKeys.button_continue.tr(),
                        buttonTextStyle: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .white,
                              fontSize: 15.sp),
                          outfitFont: OutfitFontStyle.bold,
                        ),
                      ),
                    ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: CustomOutlinedButton(
                    // isDisabled: controller.isLoading,
                    // onPressed: (startLoading, stopLoading, btnState) {
                    //   controller.resetData();
                    //   controller.shouldDisplayMobileField
                    //       ? controller.showMobileField(shouldDisplay: false)
                    //       : controller.showMobileField(shouldDisplay: true);
                    // },
                    // btnIcon: controller.shouldDisplayMobileField
                    //     ? svgMailBox
                    //     : svgMobileDown,
                    width: 500.h,
                    height: 40.h,
                    buttonColor: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .white,
                    borderColor: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .purple_700,
                    buttonText:
                        'Continue with Email ID',
                        buttonTextStyle: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              color: Color(0xFF242424), fontSize: 15.sp),
                          outfitFont: OutfitFontStyle.bold,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        )
      ],
    );
  }
}

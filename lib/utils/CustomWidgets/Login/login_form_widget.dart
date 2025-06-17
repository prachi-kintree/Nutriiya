import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Injector/app_injector.dart';
import '../../../RouteManager/app_routes.dart';
import '../../../RouteManager/navigator_service.dart';
import '../../../repository/Analytics/analytics_helper.dart';
import '../../../translation/locale_keys.g.dart';
import '../../app_string/app_error_string.dart';
import '../Button/custom_button.dart';
import '../Textfields/floating_password_text_field.dart';
import '../Textfields/floating_text_field.dart';
import '../keyboard_aware_widget.dart';
import '../../TextFieldValidator/fleld_validator.dart';
import '../../app_string/app_image_path.dart';
import '../../app_string/app_placeholder_text.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import 'otp_custom_widget.dart';

class LoginFOrmWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginFOrmWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return OtpCustomWidget();
          // : SingleChildScrollView(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Form(
          //           key: formKey,
          //           child: KeyBoardAwareWidget(
          //             child: Container(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     controller.loginType == LoginType.email
          //                         ? emailLoginHead
          //                         : controller.loginType == LoginType.mobile
          //                             ? mobileLoginHead
          //                             : usernameLoginHead,
          //                     style: AppTextStyle.figTreeStyle(
          //                         withTextStyle: TextStyle(
          //                             color: Color(0xff943F7F),
          //                             // ThemeManagerPlus.of<AppTheme>(context)
          //                             //     .currentTheme
          //                             //     .slight_light_primary,
          //                             fontSize: 24.sp),
          //                         figTreeFont: FigTreeFontStyle.bold),
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsetsDirectional.only(
          //                         start: 10.w, top: 10),
          //                     child: Text(
          //                       controller.loginType == LoginType.email
          //                           ? emailLoginSubHead
          //                           : controller.loginType == LoginType.mobile
          //                               ? mobileLoginSubHead
          //                               : usernameLoginSubHead,
          //                       textAlign: TextAlign.center,
          //                       style: AppTextStyle.figTreeStyle(
          //                           withTextStyle: TextStyle(
          //                               color: ThemeManagerPlus.of<AppTheme>(
          //                                       context)
          //                                   .currentTheme
          //                                   .light_black_text_color,
          //                               fontSize: 14.sp),
          //                           figTreeFont: FigTreeFontStyle.regular),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 20.h,
          //                   ),
          //                   //MobileTextField()
          //
          //                   if (controller.loginType == LoginType.email) ...[
          //                     FloatingLabelTextField(
          //                       textValidator:
          //                           getIt<FieldValidator>().validateEmail,
          //                       enabledBorderWidth: 3,
          //                       onValueChanged: (value) {
          //                         controller.captureUserInput(value);
          //                         controller.shouldEnableBtn(value);
          //                       },
          //                       floatingLabelText: plcEmail,
          //                       textInputType: TextInputType.emailAddress,
          //                     )
          //                   ] else if (controller.loginType ==
          //                       LoginType.mobile) ...[
          //                     MobileTextField(
          //                       onValueChanged: (value) {
          //                         controller.captureUserInput(value);
          //                         controller.shouldEnableBtn(value);
          //                       },
          //                       enabledBorderWidth: 3,
          //                       textValidator: getIt<FieldValidator>()
          //                           .validateMobileNumber,
          //                       countryPrefix: controller.numberPrefix,
          //                       countryFlag: controller.countryFlag,
          //                       onCountryCodePressed: (value) {},
          //                     )
          //                   ] else ...[
          //                     Consumer<LoginUserNameViewModel>(
          //                       builder: (_, c, w) {
          //                         return Column(
          //                           children: [
          //                             FloatingLabelTextField(
          //                               initialValue: c.userName,
          //                               floatingLabelText: plcUserName,
          //                               enabledBorderWidth: 3,
          //                               isRequired: true,
          //                               textInputType:
          //                                   TextInputType.emailAddress,
          //                               onValueChanged: (value) {
          //                                 c.captureUserName(
          //                                     userNameValue: value);
          //                               },
          //                               textValidator: (value) {
          //                                 if (value?.isNotEmpty ?? false) {
          //                                   return null;
          //                                 } else if ((value ?? "").isEmpty) {
          //                                   return LocaleKeys.login_username_empty_error.tr();
          //                                 } else {
          //                                   return LocaleKeys.error_invalid_username.tr();
          //                                 }
          //                               },
          //                             ),
          //                             SizedBox(
          //                               height: 20.h,
          //                             ),
          //                             FloatingLabelPasswordField(
          //                                 floatingLabelText: plcPassword,
          //                                 isVisible: c.isPasswordVisible,
          //                                 enabledBorderWidth: 3,
          //                                 textInputType:
          //                                     TextInputType.emailAddress,
          //                                 onValueChanged: (value) {
          //                                   c.capturePassword(
          //                                       userPasswordValue: value);
          //                                 },
          //                                 onEyeButtonClick: () {
          //                                   c.showPassword();
          //                                 },
          //                                 textValidator: (value) {
          //                                   if (value?.isNotEmpty ?? false) {
          //                                     return null;
          //                                   } else if ((value ?? "").isEmpty) {
          //                                     return LocaleKeys.login_password_empty_error.tr();
          //                                   } else {
          //                                     return LocaleKeys.error_invalid_password.tr();
          //                                   }
          //                                 })
          //                           ],
          //                         );
          //                       },
          //                     ),
          //                   ],
          //                   if (controller.loginType == LoginType.username) ...[
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                           left: 10.w, right: 10.w, top: 10.h),
          //                       child: RichText(
          //                           text: TextSpan(children: [
          //                         TextSpan(
          //                             text: "Forgotten? Let’s retrieve your ",
          //                             style: AppTextStyle.figTreeStyle(
          //                                 withTextStyle: TextStyle(
          //                                     color:
          //                                         ThemeManagerPlus.of<AppTheme>(
          //                                                 context)
          //                                             .currentTheme
          //                                             .black,
          //                                     fontSize: 13.sp),
          //                                 figTreeFont:
          //                                     FigTreeFontStyle.regular)),
          //                         TextSpan(
          //                             text: "username",
          //                             style: AppTextStyle.figTreeStyle(
          //                                 withTextStyle: TextStyle(
          //                                     color:
          //                                         ThemeManagerPlus.of<AppTheme>(
          //                                                 context)
          //                                             .currentTheme
          //                                             .purple_500,
          //                                     fontSize: 13.sp),
          //                                 figTreeFont:
          //                                     FigTreeFontStyle.semibold),
          //                             recognizer: TapGestureRecognizer()
          //                               ..onTap = () {
          //                                 context
          //                                     .read<
          //                                         ForgetUserNameOrPasswordViewModel>()
          //                                     .isForUserName = true;
          //                                 context
          //                                     .read<
          //                                         ForgetUserNameOrPasswordViewModel>()
          //                                     .clearData();
          //                                 appNavigator
          //                                     .pushNamed(routeForgetPassword);
          //                               }),
          //                         TextSpan(
          //                             text: " or reset the ",
          //                             style: AppTextStyle.figTreeStyle(
          //                                 withTextStyle: TextStyle(
          //                                     color:
          //                                         ThemeManagerPlus.of<AppTheme>(
          //                                                 context)
          //                                             .currentTheme
          //                                             .black,
          //                                     fontSize: 13.sp),
          //                                 figTreeFont:
          //                                     FigTreeFontStyle.regular)),
          //                         TextSpan(
          //                             text: "password",
          //                             style: AppTextStyle.figTreeStyle(
          //                                 withTextStyle: TextStyle(
          //                                     color:
          //                                         ThemeManagerPlus.of<AppTheme>(
          //                                                 context)
          //                                             .currentTheme
          //                                             .purple_500,
          //                                     fontSize: 13.sp),
          //                                 figTreeFont:
          //                                     FigTreeFontStyle.semibold),
          //                             recognizer: TapGestureRecognizer()
          //                               ..onTap = () {
          //                                 context
          //                                     .read<
          //                                         ForgetUserNameOrPasswordViewModel>()
          //                                     .isForUserName = false;
          //                                 context
          //                                     .read<
          //                                         ForgetUserNameOrPasswordViewModel>()
          //                                     .clearData();
          //                                 appNavigator
          //                                     .pushNamed(routeForgetPassword);
          //                               }),
          //                       ])),
          //                     )
          //                   ],
          //                   SizedBox(
          //                     height: 15.h,
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: 10.w, vertical: 10.h),
          //                     child: CustomButton(
          //                       // isDisabled: !controller.enableBtn,
          //
          //                       onPressed: (startLoading, stopLoading,
          //                           btnState) async {
          //                         FocusScope.of(context).unfocus();
          //                         if (formKey.currentState?.validate() ??
          //                             false) {
          //                           AnalyticsHelper.shared.trackUserEvent(
          //                               eventName:
          //                                   "onboarding_otp_continue_login_btn");
          //                           if (!(controller.loginType ==
          //                               LoginType.email)) {
          //                             AnalyticsHelper.shared.trackUserEvent(
          //                                 eventName: "user_mobile_login");
          //                           }
          //                           controller.resetOtpVariable();
          //                           if (!(controller.loginType ==
          //                               LoginType.username)) {
          //                             // await controller.validateLogin(
          //                             //     startLoading: startLoading,
          //                             //     stopLoading: stopLoading);
          //                             await controller.validateLoginNew(
          //                                 startLoading: startLoading,
          //                                 stopLoading: stopLoading);
          //                           } else {
          //                             context
          //                                 .read<LoginUserNameViewModel>()
          //                                 .loginWithUserName(
          //                                     startLoading: startLoading,
          //                                     stopLoading: stopLoading);
          //                           }
          //                         } else {
          //                           stopLoading();
          //                         }
          //                       },
          //                       width: 500.h,
          //                       height: 40.h,
          //                       buttonText: LocaleKeys.button_continue.tr(),
          //                       buttonTextStyle: AppTextStyle.figTreeStyle(
          //                         withTextStyle: TextStyle(
          //                             color:
          //                                 ThemeManagerPlus.of<AppTheme>(context)
          //                                     .currentTheme
          //                                     .white,
          //                             fontSize: 16.sp),
          //                         figTreeFont: FigTreeFontStyle.bold,
          //                       ),
          //                     ),
          //                   ),
          //
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       Container(
          //                         height: 1.h,
          //                         width: 90.w,
          //                         margin: EdgeInsets.only(right: 10.w),
          //                         color: ThemeManagerPlus.of<AppTheme>(context)
          //                             .currentTheme
          //                             .profile_picture_border,
          //                       ),
          //                       Text(otherWays,
          //                           style: AppTextStyle.figTreeStyle(
          //                               withTextStyle: TextStyle(
          //                                   color:
          //                                       ThemeManagerPlus.of<AppTheme>(
          //                                               context)
          //                                           .currentTheme
          //                                           .light_black_text_color,
          //                                   fontSize: 12.h),
          //                               figTreeFont: FigTreeFontStyle.medium)),
          //                       Container(
          //                         height: 1.h,
          //                         width: 90.w,
          //                         margin: EdgeInsets.only(left: 10.w),
          //                         color: ThemeManagerPlus.of<AppTheme>(context)
          //                             .currentTheme
          //                             .profile_picture_border,
          //                       )
          //                     ],
          //                   ),
          //
          //                   Padding(
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: 10.w, vertical: 10.h),
          //                     child: CustomOutlinedButton(
          //                       onPressed:
          //                           (startLoading, stopLoading, btnState) {
          //                         controller.clearUserData();
          //                         String alternativeLogin =
          //                             _getAlternativeLoginType(
          //                                 controller.loginType, 1);
          //                         LoginType alternative = controller
          //                             .getEnumFromString(alternativeLogin);
          //                         controller.changeFieldType(alternative);
          //                       },
          //                       btnIcon: _getAlternativeLoginType(
          //                                   controller.loginType, 1)
          //                               .contains("Email ID")
          //                           ? svgMailBox
          //                           : _getAlternativeLoginType(
          //                                       controller.loginType, 1)
          //                                   .contains("Mobile Number")
          //                               ? svgMobileDown
          //                               : svgUserIcon,
          //                       width: 500.h,
          //                       height: 40.h,
          //                       buttonColor:
          //                           ThemeManagerPlus.of<AppTheme>(context)
          //                               .currentTheme
          //                               .white,
          //                       borderColor:
          //                           ThemeManagerPlus.of<AppTheme>(context)
          //                               .currentTheme
          //                               .purple_700,
          //                       buttonText:
          //                           'Continue with ${_getAlternativeLoginType(controller.loginType, 1)}',
          //                       buttonTextStyle: AppTextStyle.figTreeStyle(
          //                         withTextStyle: TextStyle(
          //                             color: Color(0xFF242424),
          //                             fontSize: 14.sp),
          //                         figTreeFont: FigTreeFontStyle.bold,
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: 10.w, vertical: 10.h),
          //                     child: CustomOutlinedButton(
          //                       onPressed:
          //                           (startLoading, stopLoading, btnState) {
          //                         AnalyticsHelper.shared.trackUserEvent(
          //                             eventName: "login_with_otp");
          //                         controller.clearUserData();
          //                         String alternativeLogin =
          //                             _getAlternativeLoginType(
          //                                 controller.loginType, 2);
          //                         LoginType alternative = controller
          //                             .getEnumFromString(alternativeLogin);
          //                         controller.changeFieldType(alternative);
          //                       },
          //                       btnIcon: _getAlternativeLoginType(
          //                                   controller.loginType, 2)
          //                           .contains("Email ID")
          //                           ? svgMailBox
          //                           : _getAlternativeLoginType(
          //                                       controller.loginType, 2)
          //                                   .contains("Mobile Number")
          //                               ? svgMobileDown
          //                               : svgUserIcon,
          //                       width: 500.h,
          //                       height: 40.h,
          //                       buttonColor:
          //                           ThemeManagerPlus.of<AppTheme>(context)
          //                               .currentTheme
          //                               .white,
          //                       borderColor:
          //                           ThemeManagerPlus.of<AppTheme>(context)
          //                               .currentTheme
          //                               .purple_700,
          //                       buttonText:
          //                           'Continue with ${_getAlternativeLoginType(controller.loginType, 2)}',
          //                       buttonTextStyle: AppTextStyle.figTreeStyle(
          //                         withTextStyle: TextStyle(
          //                             color: Color(0xFF242424),
          //                             fontSize: 14.sp),
          //                         figTreeFont: FigTreeFontStyle.bold,
          //                       ),
          //                     ),
          //                   ),
          //                   // Row(
          //                   //   mainAxisAlignment: MainAxisAlignment.end,
          //                   //   children: [
          //                   //     InkWell(
          //                   //       onTap: () {
          //                   //         controller.clearUserData();
          //                   //         appNavigator.pushNamed(routeLoginUserName);
          //                   //       },
          //                   //       child: Text(
          //                   //         "Login with Username ",
          //                   //         style: AppTextStyle.figTreeStyle(
          //                   //             withTextStyle: TextStyle(
          //                   //                 color: ThemeManagerPlus.of<AppTheme>(
          //                   //                     context)
          //                   //                     .currentTheme
          //                   //
          //                   //                    .purple_500,
          //                   //                 fontSize: 13.sp),
          //                   //             figTreeFont: FigTreeFontStyle.semibold),
          //                   //       ),
          //                   //     ),
          //                   //     SizedBox(
          //                   //       width: 4.w,
          //                   //     ),
          //                   //     Text(
          //                   //       "|",
          //                   //       style: AppTextStyle.figTreeStyle(
          //                   //           withTextStyle: TextStyle(
          //                   //               color:
          //                   //               ThemeManagerPlus.of<AppTheme>(context)
          //                   //                   .currentTheme
          //                   //                   .purple_500,
          //                   //               fontSize: 13.sp),
          //                   //           figTreeFont: FigTreeFontStyle.semibold),
          //                   //     ),
          //                   //     SizedBox(
          //                   //       width: 4.w,
          //                   //     ),
          //                   //     controller.isForEmail
          //                   //         ? InkWell(
          //                   //       onTap: () {
          //                   //         AnalyticsHelper.shared.trackUserEvent(
          //                   //             eventName: "login_with_otp");
          //                   //         controller.clearUserData();
          //                   //         controller.hideOrShowMobile();
          //                   //       },
          //                   //       child: Text(
          //                   //         "Use Mobile Number",
          //                   //         style: AppTextStyle.figTreeStyle(
          //                   //             withTextStyle: TextStyle(
          //                   //                 color:
          //                   //                 ThemeManagerPlus.of<AppTheme>(
          //                   //                     context)
          //                   //                     .currentTheme
          //                   //                     .purple_500,
          //                   //                 fontSize: 13.sp),
          //                   //             figTreeFont:
          //                   //             FigTreeFontStyle.semibold),
          //                   //       ),
          //                   //     )
          //                   //         : InkWell(
          //                   //       onTap: () {
          //                   //         controller.clearUserData();
          //                   //         controller.hideOrShowMobile();
          //                   //       },
          //                   //       child: Text(
          //                   //         "Use Email-ID",
          //                   //         style: AppTextStyle.figTreeStyle(
          //                   //             withTextStyle: TextStyle(
          //                   //                 color:
          //                   //                 ThemeManagerPlus.of<AppTheme>(
          //                   //                     context)
          //                   //                     .currentTheme
          //                   //                     .purple_500,
          //                   //                 fontSize: 13.sp),
          //                   //             figTreeFont:
          //                   //             FigTreeFontStyle.semibold),
          //                   //       ),
          //                   //     ),
          //                   //     SizedBox(
          //                   //       width: 10.w,
          //                   //     ),
          //                   //   ],
          //                   // ),
          //                   SizedBox(
          //                     height: 15.h,
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsetsDirectional.only(start: 10.w),
          //                     child: RichText(
          //                       text: TextSpan(
          //                         text: "By using Kintree, you agree to the ",
          //                         style: AppTextStyle.figTreeStyle(
          //                             withTextStyle: TextStyle(
          //                                 color: ThemeManagerPlus.of<AppTheme>(
          //                                         context)
          //                                     .currentTheme
          //                                     .black,
          //                                 fontSize: 10.h),
          //                             figTreeFont: FigTreeFontStyle.semibold),
          //                         children: <TextSpan>[
          //                           TextSpan(
          //                               text: 'Terms',
          //                               style: AppTextStyle.figTreeStyle(
          //                                   withTextStyle: TextStyle(
          //                                       color: ThemeManagerPlus.of<
          //                                               AppTheme>(context)
          //                                           .currentTheme
          //                                           .purple_500,
          //                                       fontSize: 10.h),
          //                                   figTreeFont:
          //                                       FigTreeFontStyle.semibold),
          //                               recognizer: TapGestureRecognizer()
          //                                 ..onTap = () {
          //                                   Navigator.of(context).push(
          //                                       MaterialPageRoute(
          //                                           builder: (_) =>
          //                                               LinkViewerPage(
          //                                                   webUrl:
          //                                                       "https://kintree.com/terms-and-condition-webview/",
          //                                                   pageTitile:
          //                                                       "Terms & Conditions",
          //                                                   onBackButtonPressed:
          //                                                       () {
          //                                                     appNavigator
          //                                                         .goBack();
          //                                                   })));
          //                                 }),
          //                           TextSpan(
          //                               text: " and ",
          //                               style: AppTextStyle.figTreeStyle(
          //                                   withTextStyle: TextStyle(
          //                                       color: ThemeManagerPlus.of<
          //                                               AppTheme>(context)
          //                                           .currentTheme
          //                                           .black,
          //                                       fontSize: 10.h),
          //                                   figTreeFont:
          //                                       FigTreeFontStyle.semibold)),
          //                           TextSpan(
          //                               text: 'Privacy Policy.',
          //                               style: AppTextStyle.figTreeStyle(
          //                                   withTextStyle: TextStyle(
          //                                       color: ThemeManagerPlus.of<
          //                                               AppTheme>(context)
          //                                           .currentTheme
          //                                           .purple_500,
          //                                       fontSize: 10.h),
          //                                   figTreeFont:
          //                                       FigTreeFontStyle.semibold),
          //                               recognizer: TapGestureRecognizer()
          //                                 ..onTap = () {
          //                                   Navigator.of(context).push(
          //                                       MaterialPageRoute(
          //                                           builder: (_) =>
          //                                               LinkViewerPage(
          //                                                 webUrl:
          //                                                     "https://kintree.com/privacy-policy-webview/",
          //                                                 pageTitile:
          //                                                     "Privacy Policy",
          //                                                 onBackButtonPressed:
          //                                                     () {
          //                                                   appNavigator
          //                                                       .goBack();
          //                                                 },
          //                                               )));
          //                                 }),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   if (controller.loginType == LoginType.username)
          //                     SizedBox(
          //                       height: 40.h,
          //                     ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   );
    // });
  }

  String _getAlternativeLoginType( int buttonNumber) {
    switch (buttonNumber) {
      case 1:
        return buttonNumber == 1 ? 'Mobile Number' : 'Username';
      case 2:
        return buttonNumber == 1 ? 'Email ID' : 'Username';
      case 3:
        return buttonNumber == 1 ? 'Email ID' : 'Mobile Number';
      default:
        return '';
    }
  }
}
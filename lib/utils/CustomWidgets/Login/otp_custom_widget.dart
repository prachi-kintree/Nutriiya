import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/navigator_service.dart';
import '../../../repository/Analytics/analytics_helper.dart';
import '../../../translation/locale_keys.g.dart';

import '../../app_string/app_button_text.dart';
import '../../app_string/app_image_path.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_decoration.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../Button/custom_button.dart';
import '../Button/resend_button.dart';

class OtpCustomWidget extends StatelessWidget {
  const OtpCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Text(
              otpHead,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .purple_500,
                      fontSize: 24.sp),
                  outfitFont: OutfitFontStyle.bold),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, top: 10),
            // child: Text(
            //   controller.loginType == LoginType.email
            //       ? otpSubHeadEmail
            //       : controller.isIndianUser
            //           ? otpSubHeadMobileIndian
            //           : otpSubHeadMobileForeign,
            //   textAlign: TextAlign.center,
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
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  //   Text(
                  //   controller.loginType == LoginType.email
                  //       ? controller.userEmail
                  //       : controller.numberPrefix +
                  //           "-" +
                  //           controller.userPhoneNumber,
                  //   style: AppTextStyle.figTreeStyle(
                  //       withTextStyle: TextStyle(
                  //           color: ThemeManagerPlus.of<AppTheme>(context)
                  //               .currentTheme
                  //               .black,
                  //           fontSize: 16.sp),
                  //       figTreeFont: FigTreeFontStyle.semibold),
                  // ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    // AnalyticsHelper.shared.trackUserEvent(
                    //     eventName: "onboarding_otp_edit_login_btn");
                    // // appNavigator.maybePop();
                    // controller.setOtpStatus(false);
                  },
                  child: SvgPicture.asset(svgEditMobile),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:

            EdgeInsetsDirectional.only(end: 70.w, start: 70.w)     ,
            child:
            PinFieldAutoFill(
                // codeLength: controller.isIndianUser ? 4 : 6,
                // controller: controller.otpController,
                // currentCode: controller.otpController.text,
                onCodeChanged: (value) {
                  if (value != null) {
                    // controller.enteredOtp = value;
                    // if (value.length >= (controller.isIndianUser ? 4 : 6)) {
                    //   try {
                    //     FocusScope.of(context).unfocus();
                    //   } catch (e) {}
                    //   controller.submitOTP(value);
                    } else {}
                  // }
                },
                cursor: Cursor(
                  width: 2,
                  height: 15,
                  enabled: true,
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .purple_500!,
                ),
                decoration: CirclePinDecoration(
                  gapSpace: 0.w,
                  bgColorBuilder: FixedColorBuilder(Colors.white),
                  strokeWidth: 1.h,
                  strokeColorBuilder: PinListenColorBuilder(
                      ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .purple_500!,
                      ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .grey!),
                  textStyle: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .black,
                        fontSize: 12.h),
                    outfitFont: OutfitFontStyle.medium,
                  ),
                  // FixedColorBuilder(
                  //     ThemeManagerPlus.of<AppTheme>(context)
                  //         .currentTheme
                  //         .grey!),
                )
                // BoxLooseDecoration(
                //     bgColorBuilder: FixedColorBuilder(Colors.white),
                //
                //     radius: Radius.circular(100.h),
                //     strokeColorBuilder: FixedColorBuilder(
                //         ThemeManagerPlus.of<AppTheme>(context)
                //             .currentTheme
                //             .grey!)),
                ),
          ),
          // Visibility(
          //   visible: controller.showInvalidOtp,
          //   child: SizedBox(
          //     height: 20.h,
          //   ),
          // ),
          // Visibility(
          //     visible: controller.showInvalidOtp,
          //     child: Padding(
          //       padding: EdgeInsetsDirectional.only(start: 10.w),
          //       child: Text(
          //         controller.enteredOtp.isEmpty
          //             ? "${LocaleKeys.error_empty_otp.tr()} "
          //             : controller.enteredOtp.length <
          //                     (controller.isIndianUser ? 4 : 6)
          //                 ? "${LocaleKeys.enter_otp_text.tr(namedArgs: {
          //                         'digit': (controller.isIndianUser ? 4 : 6)
          //                             .toString()
          //                       })}"
          //                 : LocaleKeys.error_incorrect_passcode.tr(),
          //         style: AppTextStyle.figTreeStyle(
          //             withTextStyle: TextStyle(
          //                 color: ThemeManagerPlus.of<AppTheme>(context)
          //                     .currentTheme
          //                     .error),
          //             figTreeFont: FigTreeFontStyle.medium),
          //       ),
          //     )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            LocaleKeys.not_received_otp.tr(),
            style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .black),
              outfitFont: OutfitFontStyle.medium,
            ),
          ),
          ResendOtpText(
            onResend: () {
              // AnalyticsHelper.shared
              //     .trackUserEvent(eventName: "onboarding_otp_resend_login_btn");
              // AppDecoration.showToast(
              //     message: LocaleKeys.general_otp_sent.tr());
              // controller.requestForResendOtp();
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: CustomButton(
              // isDisabled: !((!controller.showInvalidOtp) &&
              //     controller.enteredOtp.isNotEmpty &&
              //     controller.enteredOtp.length >= 6),
              isDisabled: false,
              width: 500.w,
              height: 45.h,
              onPressed: (startLoading, stopLoading, btnState) async {
                // AnalyticsHelper.shared
                //     .trackWebEngageEvent(eventName: "VerificationInititated");
                // // controller.validateOtp(
                // //     startLoading: startLoading, stopLoading: stopLoading);
                // controller.validateOtpNew(
                //     startLoading: startLoading, stopLoading: stopLoading);
              },
              buttonText: LocaleKeys.verif_verify_button.tr(),
              buttonTextStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .white,
                    fontSize: 17.sp),
                outfitFont: OutfitFontStyle.semibold,
              ),
            ),
          ),
        ],
      );

  }
}

class ForgotUsernameOrPassOtpWidget extends StatelessWidget {
  const ForgotUsernameOrPassOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Text(
              otpHead,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .purple_500,
                      fontSize: 24.sp),
                  outfitFont: OutfitFontStyle.bold),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, top: 10),
            // child: Text(
            //   controller.shouldDisplayMobileField
            //       ? controller.isIndianUser
            //           ? otpSubHeadMobileIndian
            //           : otpSubHeadMobileForeign
            //       : otpSubHeadEmail,
            //   // otpSubHeadEmail,
            //   textAlign: TextAlign.center,
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
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Consumer<ForgetUserNameOrPasswordViewModel>(
                //     builder: (context, controller, child) {
                //   return
                //     Text(
                //     !controller.shouldDisplayMobileField
                //         ? controller.userInput
                //         : controller.countryCode + "-" + controller.userInput,
                //     style: AppTextStyle.figTreeStyle(
                //         withTextStyle: TextStyle(
                //             color: ThemeManagerPlus.of<AppTheme>(context)
                //                 .currentTheme
                //                 .black,
                //             fontSize: 16.sp),
                //         figTreeFont: FigTreeFontStyle.semibold),
                //   ),
                // }),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    // AnalyticsHelper.shared.trackUserEvent(
                    //     eventName: "onboarding_otp_edit_login_btn");
                    // controller.setOtpStatus(false);
                    // appNavigator.goBack();
                  },
                  child: SvgPicture.asset(svgEditMobile),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          // Padding(
          //   padding: controller.shouldDisplayMobileField
          //       ? controller.isIndianUser
          //           ? EdgeInsetsDirectional.only(end: 70.w, start: 70.w)
          //           : EdgeInsets.symmetric(horizontal: 20.w)
          //       : EdgeInsets.symmetric(horizontal: 20.w),
          //   child: PinFieldAutoFill(
          //       // codeLength: 6,
          //       // codeLength:
          //       //     controller.countryCode.replaceAll("+", "") == "91" ? 4 : 6,
          //       codeLength: controller.shouldDisplayMobileField
          //           ? controller.isIndianUser
          //               ? 4
          //               : 6
          //           : 6,
          //       controller: controller.otpController,
          //       currentCode: controller.otpController.text,
          //       onCodeChanged: (value) {
          //         if (value != null) {
          //           controller.enteredOtp = value;
          //           if (value.length >=
          //               (controller.shouldDisplayMobileField
          //                   ? controller.isIndianUser
          //                       ? 4
          //                       : 6
          //                   : 6)) {
          //             // if (value.length >= 6) {
          //             try {
          //               FocusScope.of(context).unfocus();
          //             } catch (e) {}
          //             controller.submitOTP(value);
          //           } else {}
          //         }
          //       },
          //       cursor: Cursor(
          //         width: 2,
          //         height: 15,
          //         enabled: true,
          //         color: ThemeManagerPlus.of<AppTheme>(context)
          //             .currentTheme
          //             .purple_500!,
          //       ),
          //       decoration: CirclePinDecoration(
          //         gapSpace: 5.w,
          //         bgColorBuilder: FixedColorBuilder(Colors.white),
          //         strokeWidth: 1.h,
          //         strokeColorBuilder: PinListenColorBuilder(
          //             ThemeManagerPlus.of<AppTheme>(context)
          //                 .currentTheme
          //                 .purple_500!,
          //             ThemeManagerPlus.of<AppTheme>(context)
          //                 .currentTheme
          //                 .grey!),
          //         textStyle: AppTextStyle.figTreeStyle(
          //           withTextStyle: TextStyle(
          //               color: ThemeManagerPlus.of<AppTheme>(context)
          //                   .currentTheme
          //                   .black,
          //               fontSize: 12.h),
          //           figTreeFont: FigTreeFontStyle.medium,
          //         ),
          //         // FixedColorBuilder(
          //         //     ThemeManagerPlus.of<AppTheme>(context)
          //         //         .currentTheme
          //         //         .grey!),
          //       )
          //       // BoxLooseDecoration(
          //       //     bgColorBuilder: FixedColorBuilder(Colors.white),
          //       //
          //       //     radius: Radius.circular(100.h),
          //       //     strokeColorBuilder: FixedColorBuilder(
          //       //         ThemeManagerPlus.of<AppTheme>(context)
          //       //             .currentTheme
          //       //             .grey!)),
          //       ),
          // ),
          // Visibility(
          //   visible: controller.showInvalidOtp,
          //   child: SizedBox(
          //     height: 20.h,
          //   ),
          // ),
          // Visibility(
          //     visible: controller.showInvalidOtp,
          //     child: Padding(
          //       padding: EdgeInsetsDirectional.only(start: 10.w),
          //       child: Text(
          //         controller.enteredOtp.isEmpty
          //             ? "${LocaleKeys.error_empty_otp.tr()} "
          //             : controller.enteredOtp.length <
          //                     (controller.isIndianUser ? 4 : 6)
          //                 ? "${LocaleKeys.enter_otp_text.tr(namedArgs: {
          //                         'digit': (controller.isIndianUser ? 4 : 6)
          //                             .toString()
          //                       })}"
          //                 : LocaleKeys.error_incorrect_passcode.tr(),
          //         style: AppTextStyle.figTreeStyle(
          //             withTextStyle: TextStyle(
          //                 color: ThemeManagerPlus.of<AppTheme>(context)
          //                     .currentTheme
          //                     .error),
          //             figTreeFont: FigTreeFontStyle.medium),
          //       ),
          //     )),
          SizedBox(
            height: 20.h,
          ),

          Text(
            LocaleKeys.not_received_otp.tr(),
            style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .black),
              outfitFont: OutfitFontStyle.medium,
            ),
          ),
          ResendOtpText(
            onResend: () {
              // AnalyticsHelper.shared
              //     .trackUserEvent(eventName: "onboarding_otp_resend_login_btn");
              // AppDecoration.showToast(
              //     message: LocaleKeys.general_otp_sent.tr());
              // controller.resendOtpTo();
            },
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(start: 15.w),
          //   child: Row(
          //     children: [
          //       RichText(
          //         text: TextSpan(
          //           text: didNotRecieveOtp,
          //           style: AppTextStyle.figTreeStyle(
          //             withTextStyle: TextStyle(
          //                 color: ThemeManagerPlus.of<AppTheme>(context)
          //                     .currentTheme
          //                     .black),
          //             figTreeFont: FigTreeFontStyle.medium,
          //           ),
          //         ),
          //       ),
          //       ResendOtpButton(
          //         onPressed: () {
          //           AnalyticsHelper.shared.trackUserEvent(
          //               eventName: "onboarding_otp_resend_login_btn");
          //           AppDecoration.showToast(message: "OTP Sent Successfully");
          //           controller.requestForResendOtp();
          //         },
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: CustomButton(
              // isDisabled: !((!controller.showInvalidOtp) &&
              //     controller.enteredOtp.isNotEmpty &&
              //     controller.enteredOtp.length >= 6),
              isDisabled: false,
              width: 500.w,
              height: 45.h,
              onPressed: (startLoading, stopLoading, btnState) async {
                // AnalyticsHelper.shared
                //     .trackWebEngageEvent(eventName: "VerificationInititated");
                // controller.validateOtpForForgetUsernameOrPassword(
                //   startLoading: startLoading,
                //   stopLoading: stopLoading,
                // );
              },
              buttonText: LocaleKeys.verif_verify_button.tr(),
              buttonTextStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .white,
                    fontSize: 17.sp),
                outfitFont: OutfitFontStyle.semibold,
              ),
            ),
          ),
        ],
      );

  }
}

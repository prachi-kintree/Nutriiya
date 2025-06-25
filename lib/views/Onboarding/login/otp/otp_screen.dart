import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';

import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../translation/locale_keys.g.dart';
import '../../../../viewmodel/login/login_view_model.dart';
import '../../../widget/gradient_scaffold.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [CustomGradientBackground(), OtpWidget()],
        ),
      ),
    );
  }
}

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, controller, child) {
      return Center(
        child: Column(
          children: [
            60.sBH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Verify your\nIdentity",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 30.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.medium)),
                    20.sBH,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "We have just sent a code to 9876543210 ",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color:
                                        ThemeManagerPlus.of<AppTheme>(context)
                                            .currentTheme
                                            .subtitleGrey),
                                outfitFont: OutfitFontStyle.regular)),
                        WidgetSpan(
                          child: InkWell(
                              child: Icon(
                                Icons.edit,
                                size: 15.h,
                              ),
                              onTap: () {
                                appNavigator.goBack();
                              }),
                        )
                      ])),
                    ),
                    20.sBH,
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: SizedBox(
                        height: 50.h,
                        child: PinFieldAutoFill(
                            codeLength: 4,
                            controller: controller.otpController,
                            currentCode: controller.otpController.text,
                            onCodeChanged: (value) {
                              if(value?.isNotEmpty ?? false) {
                                controller.enteredOtp = value ?? "";
                                if ((value?.length ?? 0) >= 4) {
                                  try {
                                    FocusScope.of(context).unfocus();
                                    appNavigator.pushReplacementNamed(routeSelectUserLanguage);
                                    // controller.invalidOtp();
                                  } catch (e) {}
                                } else {}
                              }


                            },
                            // },
                            cursor: Cursor(
                              width: 2,
                              height: 15,
                              enabled: true,
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .primaryGreen!,
                            ),
                            decoration: BoxLooseDecoration(
                              strokeWidth: 0,
                              gapSpace: 20,
                              strokeColorBuilder: FixedColorBuilder(
                                  ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .otpTextFieldGrey!),
                              bgColorBuilder: FixedColorBuilder(
                                  ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .otpTextFieldGrey!),
                              textStyle: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    color:
                                        ThemeManagerPlus.of<AppTheme>(context)
                                            .currentTheme
                                            .black,
                                    fontSize: 15.sp),
                                outfitFont: OutfitFontStyle.medium,
                              ),
                              radius: Radius.circular(20),
                            )),
                      ),
                    ),


                    Visibility(
                        visible: controller.showInvalidOtp,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 10.w),
                          child: Text(
                            controller.enteredOtp.isEmpty
                                ? "${LocaleKeys.error_empty_otp.tr()} "
                                : controller.enteredOtp.length < 4
                                ? LocaleKeys.enter_otp_text.tr(namedArgs: {
                              'digit': 4
                                  .toString()
                            })
                                : LocaleKeys.error_incorrect_passcode.tr(),
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                  fontSize: 15.sp,
                                    color: ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .secondaryOrange),
                                outfitFont: OutfitFontStyle.medium),
                          ),
                        )),
                    Visibility(
                      visible: controller.showInvalidOtp,
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),

                    // Text("30 sec", style: AppTextStyle.outfitStyle(
                    //     withTextStyle: TextStyle(
                    //         fontSize: 15.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                    //         .currentTheme
                    //         .secondaryOrange),
                    //     outfitFont: OutfitFontStyle.regular)),
                    ResendOtpText(
                      onResend: () {},
                    ),
                    10.sBH,
                    // CustomButton(
                    //     buttonText: "Verify",
                    //     padding: EdgeInsets.only(top: 10.h),
                    //     buttonTextStyle: AppTextStyle.jakartaStyle(
                    //         withTextStyle: TextStyle(fontSize: 16.sp),
                    //         jakartaFont: JakartaStyle.regular),
                    //     width: 500.w,
                    //     onPressed: (startLoading, stopLoading, btnState) {},
                    //     isDisabled: false,
                    //     disableElevation: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

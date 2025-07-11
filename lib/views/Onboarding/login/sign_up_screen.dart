import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Textfields/mobile_textfield.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../Injector/app_injector.dart';
import '../../../viewmodel/login/login_view_model.dart';
import '../../widget/gradient_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [const CustomGradientBackground(), SignUpScreen()],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            60.sBH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Join Nutria Today",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 30.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.medium)),
                    20.sBH,
                    Text("Let’s create your account",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 15.sp,
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .subtitleGrey),
                            outfitFont: OutfitFontStyle.regular)),
                    20.sBH,
                    Consumer<LoginViewModel>(
                      builder: (context, controller, child) {
                        return MobileTextField(
                          floatingLabelText: "Enter Your Mobile Number",
                          textController: controller.mobileController,
                          countryFlag: pngIndianFlag,
                          onValueChanged: (String) {},
                          isPaddingThere: false,
                          onCountryCodePressed: (String) {},
                          textValidator:
                              getIt<FieldValidator>().validateMobileNumber,
                          countryPrefix: '+91',
                        );
                      }
                    ),
                    CustomButton(
                        buttonText: "Continue",
                        padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                        buttonTextStyle: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(fontSize: 16.sp),
                            outfitFont: OutfitFontStyle.medium),
                        width: 500.w,
                        onPressed: (startLoading, stopLoading, btnState) {
                          if (formKey.currentState?.validate() ?? false) {
                            appNavigator.pushNamed(routeOtp);
                          }
                        },
                        isDisabled: false,
                        disableElevation: false),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .subtitleGrey),
                              outfitFont: OutfitFontStyle.regular)),
                      TextSpan(
                        text: "Sign In",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 15.sp,
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .primaryGreen),
                            outfitFont: OutfitFontStyle.medium),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            appNavigator.pushNamed(routeSignIn);
                          },
                      ),
                    ])),
                    20.sBH,
                  ],
                ),
              ),
            ),
            const DashedDividerWithText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginMethods(
                    icon: svgGoogleIcon,
                    context: context,
                    title: "Google",
                    onTap: () {}),
                _loginMethods(
                    icon: svgAppleIcon,
                    context: context,
                    title: "Apple",
                    onTap: () {}),
                _loginMethods(
                    icon: svgFacebookIcon,
                    context: context,
                    title: "Facebook",
                    onTap: () {}),
              ],
            ),
            40.sBH,
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "By clicking on “Continue” you are agree to our",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .black,
                              fontSize: 14.sp),
                          outfitFont: OutfitFontStyle.regular)),
                  TextSpan(
                      text: "\nTerms of use and privacy policy",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .primaryGreen,
                              fontSize: 14.sp),
                          outfitFont: OutfitFontStyle.regular),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ]))
          ],
        ),
      ),
    );
  }

  _loginMethods(
      {required String icon,
      required String title,
      required BuildContext context,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18.h),
            margin: EdgeInsets.all(5.h),
            decoration: const BoxDecoration(
                color: Color(0xffFFF5E6), shape: BoxShape.circle),
            child: icon.contains("svg")
                ? SvgPicture.asset(icon, height: 22.h)
                : Image.asset(
                    icon,
                    height: 22.h,
                  ),
          ),
          Text(
            title,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    fontSize: 11.sp,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .subtitleGrey),
                outfitFont: OutfitFontStyle.medium),
          )
        ],
      ),
    );
  }
}

class DashedDividerWithText extends StatelessWidget {
  final String text;
  final Color dashColor;
  final double dashWidth;
  final double dashSpacing;

  const DashedDividerWithText({
    super.key,
    this.text = "Or",
    this.dashColor = Colors.grey,
    this.dashWidth = 12,
    this.dashSpacing = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.h),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final boxWidth = constraints.constrainWidth();
              final dashCount = (boxWidth / (dashWidth + dashSpacing)).floor();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(dashCount, (_) {
                  return Container(
                    width: dashWidth,
                    height: 1,
                    color: dashColor,
                  );
                }),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(text,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .subtitleGrey,
                      fontSize: 14.sp),
                  outfitFont: OutfitFontStyle.medium)),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final boxWidth = constraints.constrainWidth();
              final dashCount = (boxWidth / (dashWidth + dashSpacing)).floor();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(dashCount, (_) {
                  return Container(
                    width: dashWidth,
                    height: 1,
                    color: dashColor,
                  );
                }),
              );
            },
          ),
        ),
        SizedBox(width: 10.h),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:nutriya/extension/extension_string.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../RouteManager/navigator_service.dart';
import '../../translation/locale_keys.g.dart';
import '../CustomWidgets/Button/custom_outlined_button.dart';
import '../theme/theme_model.dart';
import 'app_text_styles.dart';

class AppDecoration {
  static List<BoxShadow> addShadow() {
    return [
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.1),
        offset: Offset(1, 0),
        blurRadius: 2,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.09),
        offset: Offset(4, 0),
        blurRadius: 4,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.05),
        offset: const Offset(8, 0),
        blurRadius: 5,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.01),
        offset: Offset(15, 0),
        blurRadius: 6,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.00),
        offset: Offset(23, 0),
        blurRadius: 7,
      ),
    ];
  }

  static List<BoxShadow> addCustomShadow(
      {Color? color, double? blurRadius, Offset? offset}) {
    return [
      BoxShadow(
        // spreadRadius: 0,
        color: color ?? Colors.grey.withOpacity(0.2),
        blurRadius: blurRadius ?? 1.0,
        offset: offset ?? Offset(0.0, 3.0),
        // spreadRadius: 4
      ),
    ];
  }

  static Widget addDivider(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: Theme.of(context).dividerColor,
    );
  }

  static List<BoxShadow> commonBoxShadow() {
    return [
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.1),
        offset: Offset(1, 0),
        blurRadius: 2,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.09),
        offset: Offset(4, 0),
        blurRadius: 4,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.05),
        offset: const Offset(8, 0),
        blurRadius: 5,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.01),
        offset: Offset(15, 0),
        blurRadius: 6,
      ),
      BoxShadow(
        color: Color(0xff7D7D7D).withOpacity(0.00),
        offset: Offset(23, 0),
        blurRadius: 7,
      ),
    ];
  }

  static Widget addCustomDivider(
      {required BuildContext context,
      Color? color,
      double? thickness,
      double? height}) {
    return Divider(
      height: height ?? 1,
      thickness: thickness ?? 0.5,
      color: color ?? Theme.of(context).dividerColor,
    );
  }

  static showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showToastTop({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Gradient scaffoldGradient = const LinearGradient(
      colors: [Color(0xffFFFFFF), Color(0xffEDEDED)],
      begin: Alignment.topCenter);

  void commonDialog(
      {required String title,
      String? boldtextMsg,
      String? subtitle,
      String? lighttextMsg,
      bool isSecondaryBtn = true,
      String? primaryBtnName,
      String? secondaryBtnName,
      Color? primaryBtnColor,
      Color? secondaryBtnColor,
      Color? primaryBtnTextColor,
      Color? secondaryBtnTextColor,
      bool? isDismissible,
      Function(Function startLoading, Function stopLoading,
              ButtonState btnState)?
          onPrimaryBtnTap,
      Function(Function startLoading, Function stopLoading,
              ButtonState btnState)?
          onSecondaryBtnTap,
      // required String kinCoinsEarned,
      bool showProfileCompleted = false}) {
    showDialog(
      barrierDismissible: isDismissible ?? true,
      context: appNavigator.navigationContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0.r)),
          content: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    title ?? "",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 24.sp,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .button_color),
                        outfitFont: OutfitFontStyle.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    subtitle ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                          fontSize: 12.sp,
                          // color: ThemeManagerPlus.of<AppTheme>(context)
                          //     .currentTheme
                          //     .black
                        ),
                        outfitFont: OutfitFontStyle.regular),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Container(
                        height: 80.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .purple_500!),
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .feeling_bg_light_pink,
                            borderRadius: BorderRadius.circular(12.0.r)),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text:
                                    boldtextMsg?.capitalizeFirstLetter() ?? "",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        color: Colors.black, fontSize: 14.sp),
                                    outfitFont: OutfitFontStyle.bold),
                                children: [
                                  TextSpan(
                                    text: lighttextMsg ?? "",
                                    style: AppTextStyle.outfitStyle(
                                        withTextStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp),
                                        outfitFont: OutfitFontStyle.regular),
                                  )
                                ]))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  Divider(
                    height: 1.h,
                    color: Theme.of(context).dividerColor,
                  ),
                  isSecondaryBtn
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CustomOutlinedButton(
                                buttonText:
                                    "$primaryBtnName " ?? LocaleKeys.yes.tr(),
                                onPressed: onPrimaryBtnTap,
                                height: 30.h,
                                width: 300.w,
                                // width: 100.w,
                                borderColor: Color(0xFFFFFFFF),
                                buttonColor: Colors.transparent,
                                buttonTextStyle: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                      color: primaryBtnTextColor ??
                                          ThemeManagerPlus.of<AppTheme>(context)
                                              .currentTheme
                                              .black,
                                      fontSize: 14.sp,
                                    ),
                                    outfitFont: OutfitFontStyle.semibold),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                              child: VerticalDivider(
                                  thickness: 0.8.w,
                                  width: 0.8.w,
                                  color: Theme.of(context).dividerColor),
                            ),
                            Expanded(
                              child: CustomOutlinedButton(
                                buttonText: secondaryBtnName ?? "No",
                                onPressed: onSecondaryBtnTap,
                                height: 30.h,
                                // width: 300.w,

                                // width: 150.w,
                                borderColor: Colors.transparent,
                                buttonColor: secondaryBtnColor ?? Colors.white,
                                buttonTextStyle: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                      color: secondaryBtnTextColor ??
                                          ThemeManagerPlus.of<AppTheme>(context)
                                              .currentTheme
                                              .white,
                                      fontSize: 14.sp,
                                    ),
                                    outfitFont: OutfitFontStyle.semibold),
                              ),
                            )
                          ],
                        )
                      : CustomOutlinedButton(
                          buttonText: primaryBtnName ?? LocaleKeys.yes.tr(),
                          onPressed: onPrimaryBtnTap,
                          height: 30.h,
                          width: 300.w,

                          buttonColor: primaryBtnColor ?? Colors.white,
                          buttonTextStyle: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                color: primaryBtnTextColor ??
                                    ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .black,
                                fontSize: 14.sp,
                              ),
                              outfitFont: OutfitFontStyle.semibold),
                        )
                ],
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 160.h,
              //   child: Lottie.asset(lottieSuccess,
              //       fit: BoxFit.fill,
              //       repeat: false // Replace with your Lottie animation file
              //       ),
              // ),
            ],
          ),
        );
      },
    );
    // Automatically dismiss the dialog after 2 seconds
    // Future.delayed(Duration(seconds: 180), () {
    //   appNavigator.maybePop().then((value) {
    //     Rewards? rewards =
    //         appNavigator.navigationContext!.read<ProfileViewModel>().rewards;
    //     double percentageCompleted = appNavigator.navigationContext!
    //             .read<ProfileViewModel>()
    //             .percentageCompleted
    //             ?.totalPercentage ??
    //         0;
    //     if (((rewards?.basicSection ?? "0") == "1") &&
    //         ((rewards?.contactSection ?? "0") == "1") &&
    //         ((rewards?.additionalSection ?? "0") == "1") &&
    //         ((rewards?.educationalSection ?? "0") == "1") &&
    //         (hasCompletedProfile == "0") &&
    //         ((percentageCompleted) == 100) &&
    //         !hasShownPopUp &&
    //         showProfileCompleted) {
    //       appNavigator.popUntil(routeDashboard);
    //       appNavigator.navigationContext!
    //           .read<ProfileViewModel>()
    //           .hasShownPopup = true;
    //       coinsSuccess(
    //           memberName: '',
    //           message: "Profile Completed ",
    //           kinCoinsEarned: rewards?.profileCoinsEarned ?? "0");
    //     }
    //   });
    // });
  }
}

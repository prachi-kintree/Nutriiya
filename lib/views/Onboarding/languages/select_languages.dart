import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import '../../../RouteManager/app_routes.dart';
import '../../../RouteManager/navigator_service.dart';
import '../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../widget/gradient_scaffold.dart';
import 'languages_widget/languages.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:
          Stack(
            children: [CustomGradientBackground(),
              Languages()
            ],
          ),
        ),
      );
  }
}


class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          60.sBH,
          Text("Pick your language",
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                  TextStyle(fontSize: 30.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.medium)),
          20.sBH,

          LanguagePage(),
          const Spacer(),

          CustomButton(
              buttonText: "Continue",
              padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
              buttonTextStyle: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(fontSize: 16.sp),
                  outfitFont: OutfitFontStyle.medium),
              width: 500.w,
              onPressed: (startLoading, stopLoading, btnState) {
                appNavigator.pushNamed(routeUserDetails);
              },
              isDisabled: false,
              disableElevation: false),

          20.sBH,

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.w),
          //   child: Center(
          //     child: Column(
          //       // mainAxisSize: MainAxisSize.min,
          //       children: [
          //
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

}

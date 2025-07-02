import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/views/Account/subscription/subscription_plan.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/navigator_service.dart';
import '../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../utils/app_string/app_image_path.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/gradient_scaffold.dart';

class SubscriptionDonePage extends StatelessWidget {
  const SubscriptionDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientBackground(),
          PremiumCompleted(),
        ],
      ),
    );
  }
}

class PremiumCompleted extends StatelessWidget {
  final features = [
    SubscriptionFeature(
      title: "Simple Calorie Counting",
      iconPath: svgCalorieCounting,
    ),
    SubscriptionFeature(
      title: "Personalized Goals",
      iconPath: svgGoalSetting,
    ),
    SubscriptionFeature(
      title: "Daily Motivation",
      iconPath: svgMotivation,
    ),
    SubscriptionFeature(
      title: "Progress Insights",
      iconPath: svgProgressInsights,
    ),
    SubscriptionFeature(
      title: "Customizable Plans",
      iconPath: svgPlans,
    )
  ];

  PremiumCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          80.sBH,
          // _appIcon(),
          SizedBox(
            height: 200.h,
            width: 250.h,
            child: Center(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.h,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .primaryGreen),
                          child: SvgPicture.asset(svgCrown),
                        ),
                        20.sBH,
                        Text("Congratulations!",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 26.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                        10.sBH,
                        Text("You've Unlocked One Month Subscriptions",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Lottie.asset(lottieSuccess)),
                ],
              ),
            ),
          ),
          // Lottie.asset(lottieSuccess),
          // 20.sBH,
          // Text("Congratulations!",
          //     style: AppTextStyle.outfitStyle(
          //         withTextStyle:
          //             TextStyle(fontSize: 26.sp, color: Colors.black),
          //         outfitFont: OutfitFontStyle.regular)),
          // 10.sBH,
          // Text("You've Unlocked One Month Subscriptions",
          //     style: AppTextStyle.outfitStyle(
          //         withTextStyle:
          //             TextStyle(fontSize: 14.sp, color: Colors.black),
          //         outfitFont: OutfitFontStyle.regular)),
          15.sBH,
          Divider(
            indent: 50,
            endIndent: 50,
            color: Colors.black.withOpacity(0.4),
          ),
          10.sBH,
          Text("Benefits Unlocked",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 22.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.regular)),
          15.sBH,
          _featuresList(),
          10.sBH,
          Divider(
            indent: 50,
            endIndent: 50,
            color: Colors.black.withOpacity(0.4),
          ),
          5.sBH,
          // PricingToggle(),
          // Spacer(),
          // 20.sBH,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your journey just got an upgrade.\nWith powerful tools and personalized insights, it’s time to \nmove forward—smarter and more inspired.",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 14.sp, color: Color(0xff5E5F60)),
                  outfitFont: OutfitFontStyle.regular),
              textAlign: TextAlign.center,
            ),
          ),
          50.sBH,

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 30.w),
            child: CustomButton(
                // height: 45.h,
                buttonText: "Start Exploring",
                padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                buttonTextStyle: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(fontSize: 16.sp),
                    outfitFont: OutfitFontStyle.medium),
                width: 500.w,
                onPressed: (startLoading, stopLoading, btnState) {
                  // appNavigator.sub
                  appNavigator.goBack();
                  appNavigator.goBack();
                },
                isDisabled: false,
                disableElevation: false),
          ),
        ],
      ),
    );
  }

  _appIcon() {
    return Center(
      child: Column(
        children: [
          Image.asset(svgNutriyaLogo, scale: 4.5),
          10.sBH,
          Text("The Daily Nutrition Tracker",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 16.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.regular))
        ],
      ),
    );
  }

  _featuresList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length + 1,
      // +1 for Logout
      padding: EdgeInsets.symmetric(horizontal: 84.w),
      itemBuilder: (context, index) {
        if (index < features.length) {
          final item = features[index];
          // return ListTile(
          //     // titleAlignment: ListTileTitleAlignment.top,
          //     title: Padding(
          //   padding: EdgeInsets.only(left: 60.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SvgPicture.asset(item.iconPath, width: 22.h, height: 22.h),
          //       20.sBW,
          //       Text(item.title,
          //           style: AppTextStyle.outfitStyle(
          //               withTextStyle: TextStyle(
          //                   fontSize: 14.sp,
          //                   color: ThemeManagerPlus.of<AppTheme>(context)
          //                       .currentTheme
          //                       .black),
          //               outfitFont: OutfitFontStyle.regular))
          //     ],
          //   ),
          // ));
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(item.iconPath, width: 22.h, height: 22.h),
              20.sBW,
              Text(item.title,
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .black),
                      outfitFont: OutfitFontStyle.regular))
            ],
          );
        }
      },
    );
  }
}

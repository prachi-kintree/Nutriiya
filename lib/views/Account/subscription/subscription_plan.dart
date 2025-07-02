import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../utils/app_string/app_image_path.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/gradient_scaffold.dart';

class SubscriptionPlanPage extends StatelessWidget {
  const SubscriptionPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientBackground(),
          PremiumPlan(),
          Positioned(
              top: 40.h,
              right: 20.w,
              child: InkWell(
                  onTap: () {
                    appNavigator.goBack();
                  },
                  child: SvgPicture.asset(svgCancel)))
        ],
      ),
    );
  }
}

class PremiumPlan extends StatelessWidget {
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

  PremiumPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        100.sBH,
        _appIcon(),
        20.sBH,
        _featuresList(),
        40.sBH,
        PricingToggle(),
        Spacer(),
        // 20.sBH,

        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 30.w),
          child: CustomButton(
              // height: 45.h,
              buttonText: "Subscribe",
              padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
              buttonTextStyle: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(fontSize: 16.sp),
                  outfitFont: OutfitFontStyle.medium),
              width: 500.w,
              onPressed: (startLoading, stopLoading, btnState) {
                // appNavigator.sub
              },
              isDisabled: false,
              disableElevation: false),
        ),
      ],
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
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      itemBuilder: (context, index) {
        if (index < features.length) {
          final item = features[index];
          return ListTile(
              // titleAlignment: ListTileTitleAlignment.top,
              title: Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Row(
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
            ),
          ));
        }
      },
    );
  }
}

class PricingToggle extends StatefulWidget {
  @override
  _PricingToggleState createState() => _PricingToggleState();
}

class _PricingToggleState extends State<PricingToggle> {
  bool isMonthlySelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Monthly Plan
        GestureDetector(
          onTap: () {
            setState(() {
              isMonthlySelected = true;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(13.h),
                height: 125.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isMonthlySelected
                        ? ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen!
                        : ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color!.withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    if (isMonthlySelected)
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 6,
                        blurStyle: BlurStyle.outer,
                      ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Monthly",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    SizedBox(height: 4),
                    Text("₹ 200.00",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 20.sp,
                                color: isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    Spacer(),
                    Text("Billed Monthly",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 12.sp,
                                color: isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
              ),
              if (isMonthlySelected)
                Positioned(
                  top: -5,
                  right: -5,
                  child: SvgPicture.asset(
                    svgSubsTick,
                    height: 16.h,
                    width: 16.h,
                  ),
                )
            ],
          ),
        ),
        SizedBox(width: 16),

        // Yearly Plan
        GestureDetector(
          onTap: () {
            setState(() {
              isMonthlySelected = false;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(13.h),
                height: 125.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: !isMonthlySelected
                        ? ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen!
                        : ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color!.withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    if (!isMonthlySelected)
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.outer,
                      ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yearly",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    SizedBox(height: 4),
                    Text("₹ 2200.00",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 20.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    SizedBox(height: 4),
                    Text("Save ₹ 200.00",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 10.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    Spacer(),
                    Text("Free 1 Week Trial",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 12.sp,
                                color: !isMonthlySelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                  ],
                ),
              ),
              if (!isMonthlySelected)
                Positioned(
                  top: -5,
                  right: -5,
                  child: SvgPicture.asset(
                    svgSubsTick,
                    height: 16.h,
                    width: 16.h,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class SubscriptionFeature {
  final String title;
  final String iconPath;

  SubscriptionFeature({required this.title, required this.iconPath});
}

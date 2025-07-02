import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Button/custom_button.dart';
import 'package:nutriya/utils/CustomWidgets/Button/custom_outlined_button.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/bottom_sheets/common_bottomsheet.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class MySubscriptionPlanScreen extends StatefulWidget {
  const MySubscriptionPlanScreen({super.key});

  @override
  State<MySubscriptionPlanScreen> createState() =>
      _MySubscriptionPlanScreenState();
}

class _MySubscriptionPlanScreenState extends State<MySubscriptionPlanScreen> {
  _featuresList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length + 1,
      // +1 for Logout
      padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 5.h),
      itemBuilder: (context, index) {
        if (index < features.length) {
          final item = features[index];
          // return ListTile(
          //     contentPadding: EdgeInsets.zero,
          //     // titleAlignment: ListTileTitleAlignment.top,
          //     title: Padding(
          //       padding: EdgeInsets.only(left: 60.w),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SvgPicture.asset(item.iconPath, width: 18.h, height: 18.h),
          //           20.sBW,
          //           Text(item.title,
          //               style: AppTextStyle.outfitStyle(
          //                   withTextStyle: TextStyle(
          //                       fontSize: 14.sp,
          //                       color: ThemeManagerPlus.of<AppTheme>(context)
          //                           .currentTheme
          //                           .white),
          //                   outfitFont: OutfitFontStyle.regular))
          //         ],
          //       ),
          //     ));
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(item.iconPath, width: 18.h, height: 18.h),
                20.sBW,
                Text(item.title,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .white),
                        outfitFont: OutfitFontStyle.regular))
              ],
            ),
          );
        }
      },
    );
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Billing & Subscription',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          gradient: AppDecoration().scaffoldGradient,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.sBH,
              Container(
                height: 313.h,
                width: 350.w,
                decoration: BoxDecoration(
                    boxShadow: AppDecoration.addShadow(),
                    color: Color(0xff42A004).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12.0.r)),
                child: Column(
                  children: [
                    20.sBH,
                    Text('Nutria Premium',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 16.sp,
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .white),
                            outfitFont: OutfitFontStyle.medium)),
                    4.sBH,
                    RichText(
                        text: TextSpan(
                            text: '₹200.00',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 39.sp, color: Colors.white),
                                outfitFont: OutfitFontStyle.regular),
                            children: [
                          TextSpan(
                            text: "/Monthly",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                                outfitFont: OutfitFontStyle.regular),
                          )
                        ])),
                    8.sBH,
                    Divider(
                      color: Colors.white,
                      endIndent: 15.w,
                      indent: 15.w,
                      height: 1.1.h,
                    ),
                    8.sBH,
                    _featuresList(),
                    8.sBH,
                    Divider(
                      color: Colors.white,
                      endIndent: 15.w,
                      indent: 15.w,
                      height: 1.1.h,
                    ),
                    10.sBH,
                    Text('Your current plan',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 16.sp,
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .white),
                            outfitFont: OutfitFontStyle.medium)),
                  ],
                ),
              ),
              20.sBH,
              Text('Your subscription will expire on 05/07/2025',
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .black),
                      outfitFont: OutfitFontStyle.regular)),
              20.sBH,
              const BenifitsCard(
                bgColor: Color(0xFFCDDEBB),
                title: 'Your Personalized Journey',
                subtitle: 'built around your habits, goals, and \npreferences.',
              ),
              15.sBH,
              const BenifitsCard(
                bgColor: Color(0xffA5C1E1),
                title: 'Slim Down the Smart Way',
                subtitle:
                    'Enjoy nutritious meals, track your journey, and \nreach your goals — without the constant hunger.',
              ),
              15.sBH,
              const BenifitsCard(
                bgColor: Color(0xFFE9C995),
                title: 'Health Beyond the Scale',
                subtitle:
                    'It’s not just about weight — it’s about energy, \nconfidence, and feeling great every day.',
              ),
              10.sBH,
              Container(
                // height: 1.sh,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                  boxShadow: AppDecoration.addShadow(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0.r),
                ),
                child: Column(
                  spacing: 10.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Personalized Meal Plans',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Calorie Tracker',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Macronutrient Breakdown',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Water Intake Reminder',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Weight Tracker',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Food Library',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('AI Smart Suggestions',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Progress Badges',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Meal Reminder Alerts',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(svgGreenCheckIcon2),
                        20.sBW,
                        Text('Weekly Reports',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                  ],
                ),
              ),
              15.sBH,
              InkWell(
                onTap: () {
                  openBottomSheet(
                      isCancelable: false,
                      isOnlyChild: true,
                      height: 150.h,
                      context: context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Cancel Subscription?',
                              style: AppTextStyle.jakartaStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 26.sp, color: Colors.black),
                                  jakartaFont: JakartaStyle.medium)),
                          10.sBH,
                          Divider(
                            height: 10.h,
                            thickness: 1.h,
                            indent: 15,
                            endIndent: 15,
                          ),
                          10.sBH,
                          Text(
                              'You’ll lose access to premium features \nafter your current plan ends',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 16.sp, color: Colors.black),
                                  outfitFont: OutfitFontStyle.regular)),
                          15.sBH,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  onPressed:
                                      (startLoading, stopLoading, btnState) {
                                    appNavigator.goBack();
                                  },
                                  height: 45.h,
                                  width: 155.w,
                                  buttonTextStyle: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                      outfitFont: OutfitFontStyle.medium),
                                  buttonText: 'Keep my plan'),
                              CustomOutlinedButton(
                                  onPressed:
                                      (startLoading, stopLoading, btnState) {
                                    appNavigator.goBack();
                                    openBottomSheet(
                                        height: 170.h,
                                        isCancelable: false,
                                        isOnlyChild: true,
                                        context: context,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Cancellation Survey',
                                                style:
                                                    AppTextStyle.jakartaStyle(
                                                        withTextStyle:
                                                            TextStyle(
                                                                fontSize: 26.sp,
                                                                color: Colors
                                                                    .black),
                                                        jakartaFont:
                                                            JakartaStyle
                                                                .medium)),
                                            10.sBH,
                                            Divider(
                                              height: 10.h,
                                              thickness: 1.h,
                                              indent: 20,
                                              endIndent: 20,
                                            ),
                                            10.sBH,
                                            SizedBox(
                                              width: 0.8.sw,
                                              // alignment: Alignment.center,
                                              child: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  PointerTile(
                                                    title: 'Too Expensive',
                                                  ),
                                                  PointerTile(
                                                    title:
                                                        'Not using it enough',
                                                  ),
                                                  PointerTile(
                                                    title: 'other',
                                                  )
                                                ],
                                              ),
                                            ),
                                            10.sBH,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomOutlinedButton(
                                                    onPressed: (startLoading,
                                                        stopLoading, btnState) {
                                                      appNavigator.goBack();
                                                    },
                                                    height: 42.h,
                                                    borderColor:
                                                        ThemeManagerPlus.of<
                                                                    AppTheme>(
                                                                context)
                                                            .currentTheme
                                                            .primaryGreen,
                                                    buttonColor:
                                                        Colors.transparent,
                                                    buttonTextStyle:
                                                        AppTextStyle.outfitStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .black),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .medium),
                                                    width: 155.w,
                                                    buttonText: 'Cancel'),
                                                CustomButton(
                                                    onPressed: (startLoading,
                                                        stopLoading, btnState) {
                                                      appNavigator.goBack();
                                                    },
                                                    height: 45.h,
                                                    width: 155.w,
                                                    buttonTextStyle:
                                                        AppTextStyle.outfitStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .white),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .medium),
                                                    buttonText: 'Submit'),
                                              ],
                                            )
                                          ],
                                        ));
                                  },
                                  height: 42.h,
                                  borderColor:
                                      ThemeManagerPlus.of<AppTheme>(context)
                                          .currentTheme
                                          .primaryGreen,
                                  buttonColor: Colors.transparent,
                                  buttonTextStyle: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 15.sp, color: Colors.black),
                                      outfitFont: OutfitFontStyle.medium),
                                  width: 155.w,
                                  buttonText: 'Cancel Subscription')
                            ],
                          )
                        ],
                      ));
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Cancel my subscription',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 14.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                        children: [
                      TextSpan(
                        text: " here",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .primaryGreen),
                            outfitFont: OutfitFontStyle.regular),
                      )
                    ])),
              ),
              15.sBH,
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionFeature {
  final String title;
  final String iconPath;

  SubscriptionFeature({required this.title, required this.iconPath});
}

class BenifitsCard extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String subtitle;
  const BenifitsCard({
    super.key,
    required this.bgColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 330.w,
      padding: EdgeInsets.all(10.0.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          boxShadow: AppDecoration.addShadow(),
          color: bgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 24.sp),
                outfitFont: OutfitFontStyle.regular),
          ),
          5.sBH,
          Text(
            subtitle,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp),
                outfitFont: OutfitFontStyle.regular),
          ),
        ],
      ),
    );
  }
}

class PointerTile extends StatelessWidget {
  final String title;
  const PointerTile({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 12.w,
            width: 12.w,
            decoration: BoxDecoration(
                border: Border.all(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .primaryGreen!),
                shape: BoxShape.circle),
          ),
          10.sBW,
          Text(title,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 16.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.light))
        ],
      ),
    );
  }
}

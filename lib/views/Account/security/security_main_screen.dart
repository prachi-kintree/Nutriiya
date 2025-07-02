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
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/bottom_sheets/common_bottomsheet.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class SecurityMainScreen extends StatelessWidget {
  const SecurityMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Account & Security',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(gradient: AppDecoration().scaffoldGradient),
        child: Column(
          children: [
            30.sBH,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0.r),
                  boxShadow: AppDecoration.addShadow(),
                  color: Colors.white),
              child: Column(
                spacing: 10.h,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      openBottomSheet(
                          isCancelable: false,
                          isOnlyChild: true,
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Here’s what will happen',
                                  style: AppTextStyle.jakartaStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 26.sp, color: Colors.black),
                                      jakartaFont: JakartaStyle.medium)),
                              10.sBH,
                              Divider(
                                height: 10.h,
                                thickness: 1.h,
                                indent: 20,
                                endIndent: 20,
                              ),
                              10.sBH,
                              SizedBox(
                                width: 0.7.sw,
                                // alignment: Alignment.center,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PointerTile(
                                      title: 'Your progress will be saved',
                                    ),
                                    PointerTile(
                                      title: 'You won’t receive notifications',
                                    ),
                                    PointerTile(
                                      title: 'You can reactivate anytime',
                                    )
                                  ],
                                ),
                              ),
                              10.sBH,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      onPressed: (startLoading, stopLoading,
                                          btnState) {
                                        appNavigator.goBack();
                                      },
                                      height: 45.h,
                                      width: 155.w,
                                      buttonTextStyle: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                          outfitFont: OutfitFontStyle.medium),
                                      buttonText: 'Keep Account'),
                                  CustomOutlinedButton(
                                      onPressed: (startLoading, stopLoading,
                                          btnState) {
                                        appNavigator.goBack();
                                        openBottomSheet(
                                            isCancelable: false,
                                            isOnlyChild: true,
                                            height: 140.h,
                                            context: context,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('Are you sure?',
                                                    style: AppTextStyle
                                                        .jakartaStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        26.sp,
                                                                    color: Colors
                                                                        .black),
                                                            jakartaFont:
                                                                JakartaStyle
                                                                    .medium)),
                                                10.sBH,
                                                Divider(
                                                  height: 10.h,
                                                  thickness: 1.h,
                                                  indent: 15,
                                                  endIndent: 15,
                                                ),
                                                10.sBH,
                                                Text(
                                                    'You’re about to deactivate your Nutria account.',
                                                    style: AppTextStyle
                                                        .outfitStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .black),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .regular)),
                                                15.sBH,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomButton(
                                                        onPressed: (startLoading,
                                                            stopLoading,
                                                            btnState) {
                                                          appNavigator.goBack();
                                                        },
                                                        height: 45.h,
                                                        width: 155.w,
                                                        buttonTextStyle: AppTextStyle.outfitStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .white),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .medium),
                                                        buttonText: 'Cancel'),
                                                    CustomOutlinedButton(
                                                        onPressed: (startLoading,
                                                            stopLoading,
                                                            btnState) {
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
                                                        buttonTextStyle: AppTextStyle.outfitStyle(
                                                            withTextStyle: TextStyle(
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .black),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .medium),
                                                        width: 155.w,
                                                        buttonText:
                                                            'Yes, Deactivate')
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
                                              fontSize: 16.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.medium),
                                      width: 155.w,
                                      buttonText: 'Yes, Deactivate')
                                ],
                              )
                            ],
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        5.sBH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Deactivate Account',
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.regular)),
                            15.sBW,
                            SvgPicture.asset(svgForwardArrow,
                                color: Colors.black),
                          ],
                        ),
                        8.sBH,
                        Text(
                            "Take a break or leave anytime. You can reactivate whenever you're ready.",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp, color: Color(0xff5E5F60)),
                                outfitFont: OutfitFontStyle.regular))
                      ],
                    ),
                  ),
                  Divider(
                    height: 10.h,
                    thickness: 1.h,
                  ),
                  InkWell(
                    onTap: () {
                      openBottomSheet(
                          height: 200.h,
                          isCancelable: false,
                          isOnlyChild: true,
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Are you sure?',
                                  style: AppTextStyle.jakartaStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 26.sp, color: Colors.black),
                                      jakartaFont: JakartaStyle.medium)),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PointerTile(
                                      title:
                                          'Your account and all data will be \npermanently deleted',
                                    ),
                                    PointerTile(
                                      title: 'This action cannot be undone',
                                    ),
                                    PointerTile(
                                      title:
                                          'You’ll lose access to all features & \nhistory',
                                    )
                                  ],
                                ),
                              ),
                              10.sBH,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                      onPressed: (startLoading, stopLoading,
                                          btnState) {
                                        appNavigator.goBack();
                                      },
                                      height: 45.h,
                                      width: 155.w,
                                      buttonTextStyle: AppTextStyle.outfitStyle(
                                          withTextStyle: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                          outfitFont: OutfitFontStyle.medium),
                                      buttonText: 'Cancel'),
                                  CustomOutlinedButton(
                                      onPressed: (startLoading, stopLoading,
                                          btnState) {
                                        appNavigator.goBack();
                                        openBottomSheet(
                                            isCancelable: false,
                                            isOnlyChild: true,
                                            height: 150.h,
                                            context: context,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('Are you sure?',
                                                    style: AppTextStyle
                                                        .jakartaStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        26.sp,
                                                                    color: Colors
                                                                        .black),
                                                            jakartaFont:
                                                                JakartaStyle
                                                                    .medium)),
                                                10.sBH,
                                                Divider(
                                                  height: 10.h,
                                                  thickness: 1.h,
                                                  indent: 15,
                                                  endIndent: 15,
                                                ),
                                                10.sBH,
                                                Text(
                                                    'You’re about to permanently delete your \nNutriiya account. This can’t be undone.',
                                                    style: AppTextStyle
                                                        .outfitStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .black),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .regular)),
                                                15.sBH,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomButton(
                                                        onPressed: (startLoading,
                                                            stopLoading,
                                                            btnState) {
                                                          appNavigator.goBack();
                                                        },
                                                        height: 45.h,
                                                        width: 155.w,
                                                        buttonTextStyle: AppTextStyle.outfitStyle(
                                                            withTextStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .white),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .medium),
                                                        buttonText: 'Cancel'),
                                                    CustomOutlinedButton(
                                                        onPressed: (startLoading,
                                                            stopLoading,
                                                            btnState) {
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
                                                        buttonTextStyle: AppTextStyle.outfitStyle(
                                                            withTextStyle: TextStyle(
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .black),
                                                            outfitFont:
                                                                OutfitFontStyle
                                                                    .medium),
                                                        width: 155.w,
                                                        buttonText:
                                                            'Delete Account')
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
                                              fontSize: 16.sp,
                                              color: Colors.black),
                                          outfitFont: OutfitFontStyle.medium),
                                      width: 155.w,
                                      buttonText: 'Delete Account')
                                ],
                              )
                            ],
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        5.sBH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delete Account',
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.regular)),
                            15.sBW,
                            SvgPicture.asset(svgForwardArrow,
                                color: Colors.black),
                          ],
                        ),
                        8.sBH,
                        Text(
                            "Delete your account permanently. This action can’t be undone.",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp, color: Color(0xff5E5F60)),
                                outfitFont: OutfitFontStyle.regular))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .primaryGreen,
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

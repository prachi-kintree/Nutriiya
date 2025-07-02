import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../utils/styles/app_text_styles.dart';
import '../../utils/theme/theme_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Account',
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 20.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.semibold),
            )),
      ),
      body: SafeArea(child: Account()),
    );
  }
}

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final items = [
    SettingsItem(
        title: "Notification Settings",
        iconPath: svgNotification,
        onTap: () => appNavigator.pushNamed(routeBmiReport)),
    SettingsItem(
        title: "Languages",
        iconPath: svgLanguage,
        onTap: () => appNavigator.pushNamed(routeBmiReport)),
    SettingsItem(
        title: "Reminder",
        iconPath: svgReminder,
        onTap: () => appNavigator.pushNamed(routeBmiReport)),
    SettingsItem(
        title: "Unit & Measures",
        iconPath: svgUnitAndMeasures,
        onTap: () => appNavigator.pushNamed(routeBmiReport)),
    SettingsItem(
        title: "Goal Settings",
        iconPath: svgGoalSetting,
        onTap: () => appNavigator.pushNamed(routeGoalSettingScreen)),
    SettingsItem(
        title: "Billing & Subscription",
        iconPath: svgBillingAndSubs,
        onTap: () => appNavigator.pushNamed(routeMySubScriptionScreen)),
    SettingsItem(
        title: "Account & Security",
        iconPath: svgAccountAndSecurity,
        onTap: () => appNavigator.pushNamed(routeSecurityScreen)),
    SettingsItem(
        title: "Help & Support",
        iconPath: svgHelpAndSupport,
        onTap: () => appNavigator.pushNamed(routeHelpSupportScreen)),
    SettingsItem(
      title: "Share app",
      iconPath: svgShare,
      onTap: () {
        // Your share logic here
      },
    ),
    SettingsItem(
      title: "Rate us",
      iconPath: svgRateUs,
      onTap: () {
        // Open Play Store or App Store
      },
    ),
  ];

  // String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subscriptionCard(),
              _userCard(),
              _navigationOptions(),
              30.sBH
            ],
          ),
        ));
  }

  _subscriptionCard() {
    return InkWell(
      onTap: () {
        appNavigator.pushNamed(routeSubscription);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .primaryGreen),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(13.h),
              margin: EdgeInsets.only(right: 10.h),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffD9ECCD)),
              child: SvgPicture.asset(svgCrown),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Go Premium",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.white),
                        outfitFont: OutfitFontStyle.semibold)),
                5.sBH,
                Text(
                    "Level up your experience with smarter tools,\npriority access, and powerful features.",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 12.sp, color: Colors.white),
                        outfitFont: OutfitFontStyle.regular)),
              ],
            )
          ],
        ),
      ),
    );
  }

  _userCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                offset: Offset(1, 0),
                spreadRadius: 0,
                color: Color(0xff7D7D7D).withOpacity(0.1))
          ],
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffD9ECCD)),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(13.h),
            margin: EdgeInsets.only(right: 10.h),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .primaryGreen),
            child: SvgPicture.asset(svgCrown),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Raj Shah",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 16.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.medium)),
              5.sBH,
              Text("9876543210",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 12.sp,
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .subtitleGrey),
                      outfitFont: OutfitFontStyle.regular)),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(svgForwardArrowGreen)
        ],
      ),
    );
  }

  _navigationOptions() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.only(top: 13.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 2,
            offset: Offset(1, 0),
            spreadRadius: 0,
            color: Color(0xff7D7D7D).withOpacity(0.1))
      ], borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length + 1, // +1 for Logout
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          if (index < items.length) {
            final item = items[index];
            return ListTile(
              leading:
                  SvgPicture.asset(item.iconPath, width: 22.h, height: 22.h),
              title: Text(item.title,
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 16.sp,
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .black),
                      outfitFont: OutfitFontStyle.regular)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: item.onTap,
            );
          } else {
            return ListTile(
              leading: SvgPicture.asset(svgLogout, width: 22.h, height: 22.h),
              title: Text("Logout",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 16.sp, color: const Color(0xffF64650)),
                      outfitFont: OutfitFontStyle.regular)),
              onTap: () {
                // Handle logout
              },
            );
          }
        },
      ),
    );
  }
}

class SettingsItem {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  SettingsItem({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/views/Account/help/help_support_main_screen.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class ChangePreferencesMainScreen extends StatefulWidget {
  const ChangePreferencesMainScreen({super.key});

  @override
  State<ChangePreferencesMainScreen> createState() =>
      _ChangePreferencesMainScreenState();
}

class _ChangePreferencesMainScreenState
    extends State<ChangePreferencesMainScreen> {
  List<ChangePreferencesOption> preferences = [
    ChangePreferencesOption(
        title: 'Dietary Preferences',
        subtitle: 'Non-veg',
        onTap: () {
          appNavigator.pushNamed(routeDietScreen);
        }),
    ChangePreferencesOption(
        title: 'What’s your goal?',
        subtitle: 'Lose Weight',
        onTap: () {
          appNavigator.pushNamed(routeWhatsYourGoalScreen);
        }),
    ChangePreferencesOption(
        title: 'Regional Food Preferences',
        subtitle: 'West Indian',
        onTap: () {
          appNavigator.pushNamed(routeRegionalFoodScreen);
        }),
    ChangePreferencesOption(
        title: 'Tell us how you shop',
        subtitle: 'A bit of both',
        onTap: () {
          appNavigator.pushNamed(routeShopScreen);
        }),
    ChangePreferencesOption(
        title: 'What’s your real reason for this journey?',
        subtitle: 'To reach a personal goal',
        onTap: () {
          appNavigator.pushNamed(routeRealReasonScreen);
        }),
    ChangePreferencesOption(
        title: 'Do you have any other goals?',
        subtitle: 'Get stronger and more toned',
        onTap: () {
          appNavigator.pushNamed(routeAnyOtherGoalScreen);
        }),
    ChangePreferencesOption(
        title: 'Where are you in your journey?',
        subtitle: 'Already on the journey',
        onTap: () {
          appNavigator.pushNamed(routeJourneyProgressScreen);
        }),
    ChangePreferencesOption(
        title: 'Stay on Track with Confidence',
        subtitle: 'Celebrate Small Wins',
        onTap: () {
          appNavigator.pushNamed(routeStayOnTrackScreen);
        }),
    ChangePreferencesOption(
        title: 'What’s your daily time budget for Nutria?',
        subtitle: '30 Min',
        onTap: () {
          appNavigator.pushNamed(routeTimeBudgetScreen);
        }),
    ChangePreferencesOption(
        title: 'Ready to Build a Streak?',
        subtitle: '30 Days',
        onTap: () {
          appNavigator.pushNamed(routeBuildStreakScreen);
        }),
    ChangePreferencesOption(
        title: 'Why Do Cravings Hit You?',
        subtitle: 'Looks or smells too good',
        onTap: () {
          appNavigator.pushNamed(routeCarvingsHitScreen);
        }),
    ChangePreferencesOption(
        title: 'Big Wins Deserve Big Joy',
        subtitle: 'Treat yourself',
        onTap: () {
          appNavigator.pushNamed(routeBigWinsScreen);
        }),
    ChangePreferencesOption(
        title: 'What’s Your Work Rhythm?',
        subtitle: 'Flexible hours',
        onTap: () {
          appNavigator.pushNamed(routeWorkRhythmScreen);
        }),
    ChangePreferencesOption(title: 'Allergies', subtitle: 'N/A', onTap: () {}),
    ChangePreferencesOption(
        title: 'Any existing conditions?', subtitle: 'N/A', onTap: () {}),
    ChangePreferencesOption(
        title: 'How often do you cook at home?', subtitle: 'N/A', onTap: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Change Preferences',
      ),
      body: Container(
          height: 1.sh,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(gradient: AppDecoration().scaffoldGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    // height: 290.h,
                    margin: EdgeInsets.symmetric(vertical: 15.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0.r),
                        boxShadow: AppDecoration.addShadow(),
                        color: Colors.white),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: preferences.length,
                      itemBuilder: (context, index) {
                        bool isLast = index == preferences.length - 1;
                        return PreferencesTile(
                            isLast: isLast,
                            title: preferences[index].title,
                            subtitle: preferences[index].subtitle,
                            ontap: preferences[index].onTap);
                      },
                    )),
              ],
            ),
          )),
    );
  }
}

class PreferencesTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback ontap;
  final bool isLast;
  const PreferencesTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.ontap,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular)),
                  Text(subtitle,
                      style: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular)),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                svgForwardArrow,
                color: Colors.black,
              ),
              10.sBW,
            ],
          ),
          10.sBH,
          isLast
              ? const SizedBox()
              : Divider(
                  height: 10.h,
                  thickness: 1.h,
                ),
          isLast ? 0.sBH : 10.sBH,
        ],
      ),
    );
  }
}

class ChangePreferencesOption {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  ChangePreferencesOption({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

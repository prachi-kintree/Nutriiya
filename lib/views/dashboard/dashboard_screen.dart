import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/viewmodel/dashboard/dashboard_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/food_logger_viewmodel.dart';
// import 'package:nutriya/views/dashboard/Scanner/scanner_screen.dart';
// import 'package:nutriya/views/dashboard/history/history_screen.dart';
import 'package:nutriya/views/dashboard/home/home_screen.dart' hide Meals;
// import 'package:nutriya/views/dashboard/profile/profile_screen.dart';
// import 'package:nutriya/views/dashboard/progress/progress_screen.dart';
import 'package:nutriya/views/widget/bottom_sheets/common_bottomsheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InitWrapper(
          onInit: () {},
          child: Consumer<DashboardViewmodel>(
              builder: (context, controller, child) {
            return controller.getCurrentScreen();
          }),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            openBottomSheet(
                context: context,
                title: "Log your meal",
                subTitle: "Choose how you want to log today’s meal",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        appNavigator.goBack();
                        openBottomSheet(
                            context: context,
                            title: "Select Category",
                            subTitle: "Choose the meal you want to add.",
                            child: Expanded(
                              child: Consumer<FoodLoggerViewmodel>(
                                builder: (context, value, child) {
                                  return GridView.builder(
                                    itemCount: value.meals.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12.h,
                                      crossAxisSpacing: 12.w,
                                      mainAxisExtent: 38.h.h,
                                    ),
                                    itemBuilder: (context, index) {
                                      Meals currentMeal = value.meals[index];
                                      return InkWell(
                                        onTap: () {
                                          appNavigator.goBack();
                                          value.navigateToDesireMeal(
                                              currentMeal);
                                        },
                                        child: SelectableMealContainer(
                                          meals: currentMeal,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ));
                      },
                      child: Container(
                        height: 135.h,
                        width: 158.w,
                        padding: EdgeInsets.only(left: 10.w, right: 5.w),
                        decoration: BoxDecoration(
                            color: Color(0xffD9ECCD),
                            borderRadius: BorderRadius.circular(12.0.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(svgLogFood)),
                            10.sBH,
                            Text('Describe',
                                textAlign: TextAlign.start,
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.regular)),
                            Text(
                                "Write down what you ate— quick and easy tracking.",
                                textAlign: TextAlign.start,
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.light)),
                          ],
                        ),
                      ),
                    ),
                    20.sBW,
                    InkWell(
                      onTap: () {
                        appNavigator.pushNamed(routeMealCameraScreen);
                      },
                      child: Container(
                        height: 135.h,
                        width: 158.w,
                        padding: EdgeInsets.only(left: 10.w, right: 5.w),
                        decoration: BoxDecoration(
                            color: Color(0xffD9ECCD),
                            borderRadius: BorderRadius.circular(12.0.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(svgScanFood)),
                            20.sBH,
                            Text('Capture',
                                textAlign: TextAlign.start,
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.regular)),
                            Text(
                                "Snap a photo of your meal for visual logging.",
                                textAlign: TextAlign.start,
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.light)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
          child: Container(
            height: 50.h,
            width: 50.h,
            margin: EdgeInsets.only(top: 20.h),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: SvgPicture.asset(
              svgScanDashboard,
              height: 25.h,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Consumer<DashboardViewmodel>(
          builder: (context, controller, child) {
            return ConvexAppBar(
                // key: context.read<DashBoardViewModel>().globalKey,
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .light_black,
                activeColor: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .primaryGreen,
                backgroundColor:
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
                height: 45.h,
                // curveSize: 70,
                style: TabStyle.fixed,
                // cornerRadius: 20,
                // elevation: 5,
                items: [
                  TabItem(
                    icon: SvgPicture.asset(
                      svgInactiveHomeIcon,
                      height: 25.h,
                    ),
                    activeIcon: Stack(children: [
                      SvgPicture.asset(
                        svgActiveHomeIcon,
                        height: 25.h,
                      ),
                    ]),
                    title: "Home",
                  ),
                  TabItem(
                    activeIcon: SvgPicture.asset(
                      svgActiveProgressIcon,
                      height: 25,
                    ),
                    icon: SvgPicture.asset(
                      svgInActiveProgressIcon,
                      height: 25,
                    ),
                    title: "Progress",
                  ),
                  TabItem(
                    activeIcon: SvgPicture.asset(
                      svgAddButtonCircle,
                      height: 25.h,
                    ),
                    icon: SvgPicture.asset(
                      svgAddButtonCircle,
                      height: 25.h,
                    ),
                    title: "",
                  ),
                  TabItem(
                    activeIcon: SvgPicture.asset(
                      svgActiveHistoryIcon,
                      height: 25,
                    ),
                    icon: SvgPicture.asset(
                      svgInActiveHistoryIcon,
                      height: 25,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 6.h, top: 8.h),
                    //   child: SvgPicture.asset(
                    //     svgDnaInactive,
                    //     height: 25,
                    //   ),
                    // ),
                    title: "History",
                  ),
                  TabItem(
                    activeIcon: SvgPicture.asset(
                      svgActiveProfileIcon,
                      height: 25,
                    ),
                    icon: SvgPicture.asset(
                      svgInActiveProfileIcon,
                      height: 25,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 6.h, top: 8.h),
                    //   child: SvgPicture.asset(
                    //     svgProfileIconInactive,
                    //     height: 25,
                    //   ),
                    // ),
                    title: "Profile",
                  ),
                ],
                initialActiveIndex: controller.tabIndex,
                onTap: (val) {
                  // if (val == 1) {
                  //   context.read<FamilyTreeViewModel>().shouldUpdate = false;
                  // }
                  context.read<DashboardViewmodel>().updateTabIndex(val);
                });
          },
        ));
  }
}

class SelectableMealContainer extends StatelessWidget {
  final Meals meals;
  const SelectableMealContainer({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: 155.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          color: meals.isSelected!
              ? ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .primaryGreen!
              : Colors.transparent,
          border: Border.all(
              color: !meals.isSelected!
                  ? ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .primaryGreen!
                  : Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(meals.icon!),
          Text(meals.title!,
              textAlign: TextAlign.start,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      fontSize: 14.sp,
                      color: meals.isSelected! ? Colors.white : Colors.black),
                  outfitFont: OutfitFontStyle.regular)),
        ],
      ),
    );
  }
}

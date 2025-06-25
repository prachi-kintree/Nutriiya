import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/viewmodel/dashboard/dashboard_viewmodel.dart';
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
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(svgActiveHomeIcon),
        inactiveIcon: SvgPicture.asset(svgInactiveHomeIcon),
        title: ("Home"),
        activeColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen!,
        inactiveColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.light_black!,
        // activeColorPrimary: CupertinoColors.activeBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,

        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: "/",
        //   routes: {
        //     "/first": (final context) => const HomeScreen(),
        //     "/second": (final context) => const ProgressScreen(),
        //   },
        // ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(svgActiveProgressIcon),
        inactiveIcon: SvgPicture.asset(svgInActiveProgressIcon),
        title: ("Progress"),
        textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 12.sp),
            outfitFont: OutfitFontStyle.regular),
        activeColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen!,
        inactiveColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.light_black!,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: SvgPicture.asset(svgAddIcon),
        title: (""),
        textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 12.sp),
            outfitFont: OutfitFontStyle.regular),
        activeColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen!,
        inactiveColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.light_black!,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(svgActiveHistoryIcon),
        inactiveIcon: SvgPicture.asset(svgInActiveHistoryIcon),
        title: ("History"),
        textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 12.sp),
            outfitFont: OutfitFontStyle.regular),
        activeColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen!,
        inactiveColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.light_black!,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(svgActiveProfileIcon),
        inactiveIcon: SvgPicture.asset(svgInActiveProfileIcon),
        title: ("Account"),
        textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 12.sp),
            outfitFont: OutfitFontStyle.regular),
        activeColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen!,
        inactiveColorPrimary:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.light_black!,
      ),
    ];
  }

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
                child: Row(
                  children: [
                    Container(
                      height: 50.h,
                      color: Colors.amber,
                    ),
                    20.sBW,
                    Container(
                      height: 50.h,
                      color: Colors.amber,
                    ),
                  ],
                ));
          },
          child: Container(
            height: 50.h,
            width: 50.h,
            margin: EdgeInsets.only(top: 20.h),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: SvgPicture.asset(
              svgAddButtonCircle,
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
                height: 40.h,
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

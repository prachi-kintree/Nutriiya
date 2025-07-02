import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

class HelpSupportMainScreen extends StatelessWidget {
  const HelpSupportMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Help & Support',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     colors: [Color(0xffFFFFFF), Color(0xffEDEDED)],
          //     begin: Alignment.topCenter),
          gradient: AppDecoration().scaffoldGradient,
        ),
        child: Column(
          spacing: 10.h,
          children: [
            CustomListTile(
              child: InkWell(
                onTap: () {
                  appNavigator.pushNamed(routeFaqHelpScreen);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FAQ',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      SvgPicture.asset(svgForwardArrow, color: Colors.black)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                appNavigator.pushNamed(routeContactHelpScreen);
              },
              child: CustomListTile(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contact Support',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      SvgPicture.asset(svgForwardArrow, color: Colors.black)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: CustomListTile(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Privacy Policy',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      SvgPicture.asset(svgForwardArrow, color: Colors.black)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                appNavigator.pushNamed(routeFeedbackHelpScreen);
              },
              child: CustomListTile(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Feedback',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      SvgPicture.asset(svgForwardArrow, color: Colors.black)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomListTile({super.key, required this.child, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      margin: EdgeInsetsGeometry.only(bottom: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        color: Colors.white,
        boxShadow: AppDecoration.addShadow(),
      ),
      child: child,
    );
  }
}

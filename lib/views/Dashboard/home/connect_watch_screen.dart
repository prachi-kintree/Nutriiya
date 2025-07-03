import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Button/custom_button.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/Account/help/help_support_main_screen.dart';
import 'package:nutriya/views/Account/notification/selected_mode_settings.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';

class ConnectWatchScreen extends StatefulWidget {
  const ConnectWatchScreen({super.key});

  @override
  State<ConnectWatchScreen> createState() => _ConnectWatchScreenState();
}

class _ConnectWatchScreenState extends State<ConnectWatchScreen> {
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  bool switchValue4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Connect Your Watch',
      ),
      body: Stack(
        children: [
          const CommonGradient(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            // decoration: BoxDecoration(
            //   gradient: AppDecoration().scaffoldGradient,
            // ),
            child: Column(
              spacing: 15.h,
              children: [
                Text(
                    "Sync your smartwatch to automatically track \nyour steps, workouts, and calories. Stay on top of \nyour fitness goals without manual logging.",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: const Color(0xff484C52)),
                        outfitFont: OutfitFontStyle.regular)),
                CustomListTile(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                    child: CustomSwitchTile(
                      onToggle: (value) {
                        setState(() {
                          switchValue1 = value;
                        });
                      },
                      title: 'Apple Watch',
                      value: switchValue1,
                      leadingWidget: SvgPicture.asset(
                        svgAppleIcon,
                        height: 25.h,
                      ),
                    ),
                  ),
                ),
                CustomListTile(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                    child: CustomSwitchTile(
                      onToggle: (value) {
                        setState(() {
                          switchValue2 = value;
                        });
                      },
                      title: 'Fitbit',
                      value: switchValue2,
                      leadingWidget: Image.asset(
                        svgFitBitIcon,
                        height: 25.h,
                      ),
                    ),
                  ),
                ),
                CustomListTile(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                    child: CustomSwitchTile(
                      onToggle: (value) {
                        setState(() {
                          switchValue3 = value;
                        });
                      },
                      title: 'Google Fit',
                      value: switchValue3,
                      leadingWidget: Image.asset(
                        svgGoogleFitIcon,
                        height: 25.h,
                      ),
                    ),
                  ),
                ),
                CustomListTile(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                    child: CustomSwitchTile(
                      onToggle: (value) {
                        setState(() {
                          switchValue4 = value;
                        });
                      },
                      title: 'Garmin',
                      value: switchValue4,
                      leadingWidget: Image.asset(
                        svgGarminIcon,
                        height: 25.h,
                      ),
                    ),
                  ),
                ),
                // CustomListTile(
                //     child: Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         svgAppleIcon,
                //         height: 25.h,
                //       ),
                //       20.sBW,
                //       Text("Apple Watch",
                //           style: AppTextStyle.outfitStyle(
                //               withTextStyle: TextStyle(
                //                   fontSize: 14.sp, color: const Color(0xff484C52)),
                //               outfitFont: OutfitFontStyle.regular)),
                //       const Spacer(),
                //       CupertinoSwitch(
                //         value: switchValue1,
                //         onChanged: (val) {
                //           setState(() {
                //             switchValue1 = val;
                //           });
                //         },
                //       )
                //     ],
                //   ),
                // )),
                // CustomListTile(
                //     child: Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         svgFitBitIcon,
                //         height: 25.h,
                //       ),
                //       20.sBW,
                //       Text("Fitbit",
                //           style: AppTextStyle.outfitStyle(
                //               withTextStyle: TextStyle(
                //                   fontSize: 14.sp, color: const Color(0xff484C52)),
                //               outfitFont: OutfitFontStyle.regular)),
                //       const Spacer(),
                //       CupertinoSwitch(
                //         value: switchValue2,
                //         onChanged: (val) {
                //           setState(() {
                //             switchValue2 = val;
                //           });
                //         },
                //       )
                //     ],
                //   ),
                // )),
                // CustomListTile(
                //     child: Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         svgGoogleFitIcon,
                //         height: 25.h,
                //       ),
                //       20.sBW,
                //       Text("Google Fit",
                //           style: AppTextStyle.outfitStyle(
                //               withTextStyle: TextStyle(
                //                   fontSize: 14.sp, color: const Color(0xff484C52)),
                //               outfitFont: OutfitFontStyle.regular)),
                //       const Spacer(),
                //       CupertinoSwitch(
                //         value: switchValue3,
                //         onChanged: (val) {
                //           setState(() {
                //             switchValue3 = val;
                //           });
                //         },
                //       )
                //     ],
                //   ),
                // )),
                // CustomListTile(
                //     child: Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         svgGarminIcon,
                //         height: 25.h,
                //       ),
                //       20.sBW,
                //       Text("Garmin",
                //           style: AppTextStyle.outfitStyle(
                //               withTextStyle: TextStyle(
                //                   fontSize: 14.sp, color: const Color(0xff484C52)),
                //               outfitFont: OutfitFontStyle.regular)),
                //       const Spacer(),
                //       CupertinoSwitch(
                //         value: switchValue4,
                //         onChanged: (val) {
                //           setState(() {
                //             switchValue4 = val;
                //           });
                //         },
                //       )
                //     ],
                //   ),
                // )),

                const Spacer(),
                CustomButton(
                    onPressed: (startLoading, stopLoading, btnState) {},
                    height: 40.h,
                    width: 500.w,
                    buttonTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 18.sp, color: Colors.white),
                        outfitFont: OutfitFontStyle.medium),
                    buttonText: 'Done'),
                10.sBH
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';

class CommonBottomsheet extends StatelessWidget {
  const CommonBottomsheet(
      {super.key,
      this.title = "Title",
      this.subTitle = "SubTitle",
      this.height = 250,
      required this.isCancelable,
      required this.isOnlyChild,
      required this.child});
  final String title;
  final String subTitle;
  final double height;
  final Widget child;
  final bool isCancelable;
  final bool isOnlyChild;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if (isCancelable) {
        //   return true;
        // }
        return true;
      },
      child: Container(
        height: height.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0.r),
                topRight: Radius.circular(30.0.r))),
        child: Column(
          children: [
            isCancelable ? 15.sBH : 0.sBH,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isCancelable
                    ? InkWell(
                        onTap: () {
                          appNavigator.goBack();
                        },
                        child: SvgPicture.asset(svgCancel))
                    : const SizedBox(),
                15.sBW
              ],
            ),
            !isOnlyChild
                ? Text(title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 26.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.semibold))
                : 0.sBH,
            !isOnlyChild
                ? Text(subTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.medium))
                : 0.sBH,
            20.sBH,
            child
          ],
        ),
      ),
    );
  }
}

Future<void> openBottomSheet(
    {required BuildContext context,
    required Widget child,
    String? title,
    String? subTitle,
    double? height,
    bool? isCancelable,
    bool? isOnlyChild}) {
  return showModalBottomSheet(
    // isDismissible: isCancelable ?? true,
    isDismissible: true,
    context: context,
    builder: (context) {
      return CommonBottomsheet(
        isOnlyChild: isOnlyChild ?? false,
        isCancelable: isCancelable ?? true,
        title: title ?? "",
        subTitle: subTitle ?? "",
        height: height ?? 250,
        child: child,
      );
    },
  );
}

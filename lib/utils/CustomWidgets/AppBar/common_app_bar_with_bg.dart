import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/app_routes.dart';
import '../../../RouteManager/navigator_service.dart';
import '../../../translation/locale_keys.g.dart';
import '../../app_string/app_image_path.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';


class CommonAppBarWithBg extends StatelessWidget
    implements PreferredSizeWidget {
  Widget? leadingIcon;
  String appBarTitle;
  bool shouldCenterTitle;
  Color? backgroundColor;
  List<Widget>? actions;
  VoidCallback? onBackButtonPressed;
  VoidCallback? onPostPressed;
  bool isPostBtnDisable;
  bool backOrCancel;
  bool isLeadingAnIcon;
  bool applyLeading;
  bool isPostButton;
  double? elevation;
  String? kinCoins;
  String? bottomTitle1;
  bool? isBottomTitle;
  String? postBtnTitle;

  bool showBottom;

  CommonAppBarWithBg(
      {this.isLeadingAnIcon = false,
      this.leadingIcon,
      this.applyLeading = true,
      this.actions,
      this.backgroundColor,
      this.appBarTitle = "",
      this.elevation,
      this.isPostBtnDisable = false,
      this.onPostPressed,
      this.isPostButton = false,
      this.backOrCancel = true,
      this.showBottom = false,
      this.shouldCenterTitle = false,
      this.bottomTitle1 = 'You will earn ',
      this.isBottomTitle = false,
      this.kinCoins = "0",
      this.postBtnTitle = 'Done',
      this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth; // Full screen width
    return AppBar(
      // clipBehavior: Clip.hardEdge,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      flexibleSpace: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pngAppBarBg), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      backgroundColor: Colors.transparent,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      elevation: elevation ?? 0,
      shadowColor: Colors.black.withOpacity(0.2),

      toolbarHeight: 50.h,  // Set the height of the AppBar to 60.h
      automaticallyImplyLeading: false,

      centerTitle: shouldCenterTitle,
      actions: [Padding(
        padding: EdgeInsets.only(top: showBottom ? 10.h : 20.h, bottom: showBottom ? 10.h : 0.h),
        child: Row(
          crossAxisAlignment: showBottom ? CrossAxisAlignment.center : CrossAxisAlignment.end,
          children:  (isPostButton
              ? [
            InkWell(
              onTap: onPostPressed,
              child: Container(
                margin:
                EdgeInsets.only(top: 10.h, left: 26.w,right: 26.w),
                decoration: BoxDecoration(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .white,
                    borderRadius: BorderRadius.circular(24.0.r)),
                width: 64.w,
                child: Center(
                  child: isPostBtnDisable
                      ? Container(
                    padding: const EdgeInsets.all(10),
                    width: 26.w,
                    height: 26.w,
                    child: CircularProgressIndicator(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .purple_500,
                    ),
                  )
                      : Text(
                    // "${LocaleKeys.foreroom_no_post_button.tr()}".toUpperCase(),
                    postBtnTitle!,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            color:
                            ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .purple_500,
                            fontSize: 14.sp),
                        outfitFont: OutfitFontStyle.semibold),
                  ),
                ),
              ),
            )
          ]
              : actions) ?? [],

        ),
      )],
      // leadingWidth: backOrCancel ? 0 : 55.w,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:showBottom ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: showBottom ? 10.h : 0.h),
            child: applyLeading?
            isLeadingAnIcon
                ? Container(
                    height: 20.h,
                    margin: EdgeInsets.only(top: 3.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.5.w),
                    child: leadingIcon)
                : backOrCancel
                    ? InkWell(
                        onTap: onBackButtonPressed == null
                            ? () {
                                FocusScope.of(context).unfocus();
                                appNavigator.popUntil(routeDashboard);
                              }
                            : onBackButtonPressed,
                        child: Container(
                            height: 20.h,
                            margin: EdgeInsets.only(top: 3.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 1.5.h, horizontal: 2.5.w),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1.2.h),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 9.h,
                            )
                            //  SvgPicture.asset(
                            //   svgBackButton,
                            //   color: ThemeManagerPlus.of<AppTheme>(context)
                            //       .currentTheme
                            //       .white,
                            //   fit: BoxFit.scaleDown,
                            // ),
                            ),
                      )
                    : InkWell(
                        onTap: onBackButtonPressed == null
                            ? () {
                                FocusScope.of(context).unfocus();
                                appNavigator.popUntil(routeDashboard);
                              }
                            : onBackButtonPressed,
                        child: Container(
                            height: 20.h,
                            margin: EdgeInsets.only(top: 3.h),
                            padding: EdgeInsets.symmetric(
                              vertical: 1.5.h,
                            ),
                            child: Icon(
                              CupertinoIcons.clear_circled,
                              size: 18.h,
                            )
                            //  SvgPicture.asset(
                            //   svgBackButton,
                            //   color: ThemeManagerPlus.of<AppTheme>(context)
                            //       .currentTheme
                            //       .white,
                            //   fit: BoxFit.scaleDown,
                            // ),
                            )) : SizedBox.shrink(),
          ),
          SizedBox(
            width: 15.w,
          ),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              showBottom
                  ? Text(
                      '',
                      textAlign: TextAlign.left,
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .white,
                            fontSize: 10.sp,
                          ),
                          outfitFont: OutfitFontStyle.semibold),
                    )
                  : SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.only(top: showBottom ? 0.h : 25.h),
                child: Text(
                  appBarTitle,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .white,
                        fontSize: 20.sp,
                      ),
                      outfitFont: OutfitFontStyle.semibold),
                ),
              ),
              showBottom
                  ? isBottomTitle!
                      ? Container(
                          height: 16.h,
                          // width: 170.w,
                          alignment: Alignment.center,
                          // color: ThemeManagerPlus.of<AppTheme>(context)
                          //     .currentTheme
                          //     .feeling_bg_light_pink,
                          child: Text(
                            bottomTitle1!,
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    color:
                                        ThemeManagerPlus.of<AppTheme>(context)
                                            .currentTheme
                                            .white,
                                    fontSize: 14.sp),
                                outfitFont: OutfitFontStyle.medium),
                          ),
                        )
                      : Container(
                          height: 16.h,
                          // width: 170.w,
                          alignment: Alignment.center,
                          // color: ThemeManagerPlus.of<AppTheme>(context)
                          //     .currentTheme
                          //     .feeling_bg_light_pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${LocaleKeys.you_will_earn.tr()} ',
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        color: ThemeManagerPlus.of<AppTheme>(
                                                context)
                                            .currentTheme
                                            .white,
                                        fontSize: 14.sp),
                                    outfitFont: OutfitFontStyle.medium),
                              ),
                              SizedBox(
                                width: 15.w,
                                height: 15.w,
                                child: Image.asset(pngKintreeCoins),
                              ),
                              Text(
                                ' $kinCoins ${LocaleKeys.kincoins.tr()} ',
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        color: ThemeManagerPlus.of<AppTheme>(
                                                context)
                                            .currentTheme
                                            .white,
                                        fontSize: 14.sp),
                                    outfitFont: OutfitFontStyle.medium),
                              ),
                            ],
                          ),
                        )
                  : SizedBox.shrink()
            ],
          ),
          ]
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showBottom ? 60.h : 60.h);
}

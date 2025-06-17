import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/app_routes.dart';
import '../../../RouteManager/navigator_service.dart';
import '../../app_string/app_image_path.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? leadingIcon;
  String appBarTitle;
  bool shouldCenterTitle;
  Color? backgroundColor;
  List<Widget>? actions;
  VoidCallback? onBackButtonPressed;
  bool hideBackButton;
  double? elevation;
  String? kinCoins;

  bool showBottom;

  CustomAppBar(
      {this.actions,
      this.leadingIcon,
      this.backgroundColor,
      this.appBarTitle = "",
      this.elevation,
      this.hideBackButton = false,
      this.showBottom = false,
      this.shouldCenterTitle = true,
      this.kinCoins = "0",
      this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      elevation: elevation ?? 0,
      shadowColor: Colors.black.withOpacity(0.2),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: showBottom
            ? Container(
                height: 30.h,
                alignment: Alignment.center,
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .feeling_bg_light_pink,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You will earn ',
                      style: AppTextStyle.jakartaStyle(
                          withTextStyle: TextStyle(color: Colors.black),
                          jakartaFont: JakartaStyle.regular),
                    ),
                    SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(pngKintreeCoins),
                    ),
                    Text(
                      ' ${kinCoins} Kincoins ',
                      style: AppTextStyle.jakartaStyle(
                          withTextStyle: TextStyle(color: Colors.black),
                          jakartaFont: JakartaStyle.regular),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
      backgroundColor: backgroundColor == null
          ? ThemeManagerPlus.of<AppTheme>(context)
              .currentTheme
              .individual_chat_bg
          : backgroundColor,
      automaticallyImplyLeading: false,
      leading: hideBackButton
          ? null
          : (leadingIcon == null
              ? InkWell(
                  onTap: onBackButtonPressed == null
                      ? () {
                          FocusScope.of(context).unfocus();
                          appNavigator.popUntil(routeDashboard);
                        }
                      : onBackButtonPressed,
                  child: SvgPicture.asset(
                    svgBackButton,
                    fit: BoxFit.scaleDown,
                  ),
                )
              : InkWell(
                  onTap: onBackButtonPressed == null
                      ? () {
                          FocusScope.of(context).unfocus();
                          appNavigator.popUntil(routeDashboard);
                        }
                      : onBackButtonPressed,
                  child: leadingIcon)),
      centerTitle: shouldCenterTitle,
      actions: actions,
      leadingWidth: hideBackButton ? 0 : null,
      title: Text(
        appBarTitle,
        style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color:
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                fontSize: 16.sp,
                letterSpacing: 0.5),
            jakartaFont: JakartaStyle.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showBottom ? 75.h : 45.h);
}

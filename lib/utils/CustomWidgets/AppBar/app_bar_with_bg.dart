import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_string/app_image_path.dart';




class CustomAppBarWithBg extends StatelessWidget implements PreferredSizeWidget {
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

  CustomAppBarWithBg(
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
    double screenWidth = ScreenUtil().screenWidth; // Full screen width
    return
    //   Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(image: AssetImage(pngAppBarBg), scale: 1, fit: BoxFit.fitWidth)
    //   ),
    //   child: Row(
    //     children: [
    //       leadingIcon ?? SizedBox.shrink(),
    //       Spacer(),
    //       ...?actions
    //     ],
    //   ),
    // );

      AppBar(
        toolbarHeight: 55.h,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(pngAppBarBg), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
        ),
        backgroundColor: Colors.transparent,
      systemOverlayStyle:
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      elevation: elevation ?? 0,
      shadowColor: Colors.black.withOpacity(0.2),
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(50.0),
      //   child: showBottom
      //       ? Container(
      //     height: 30.h,
      //     alignment: Alignment.center,
      //     color: ThemeManagerPlus.of<AppTheme>(context)
      //         .currentTheme
      //         .feeling_bg_light_pink,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           'You will earn ',
      //           style: AppTextStyle.figTreeStyle(
      //               withTextStyle: TextStyle(color: Colors.black),
      //               figTreeFont: FigTreeFontStyle.regular),
      //         ),
      //         SizedBox(
      //           width: 15.w,
      //           height: 15.w,
      //           child: Image.asset(pngKintreeCoins),
      //         ),
      //         Text(
      //           ' ${kinCoins} Kincoins ',
      //           style: AppTextStyle.figTreeStyle(
      //               withTextStyle: TextStyle(color: Colors.black),
      //               figTreeFont: FigTreeFontStyle.regular),
      //         ),
      //       ],
      //     ),
      //   )
      //       : Container(),
      // ),
      // backgroundColor: backgroundColor == null
      //     ? ThemeManagerPlus.of<AppTheme>(context)
      //     .currentTheme
      //     .individual_chat_bg
      //     : backgroundColor,
      automaticallyImplyLeading: false,

      leading: leadingIcon,
      // hideBackButton
      //     ? null
      //     : (leadingIcon == null
      //     ? InkWell(
      //   onTap: onBackButtonPressed == null
      //       ? () {
      //     FocusScope.of(context).unfocus();
      //     appNavigator.popUntil(routeDashboard);
      //   }
      //       : onBackButtonPressed,
      //   child: SvgPicture.asset(
      //     svgBackButton,
      //     fit: BoxFit.scaleDown,
      //   ),
      // )
      //     : InkWell(
      //     onTap: onBackButtonPressed == null
      //         ? () {
      //       FocusScope.of(context).unfocus();
      //       appNavigator.popUntil(routeDashboard);
      //     }
      //         : onBackButtonPressed,
      //     child: leadingIcon)),
      centerTitle: shouldCenterTitle,
      actions: actions,
      leadingWidth: hideBackButton ? 0 : 80.w,
      // title: Text(
      //   appBarTitle,
      //   style: AppTextStyle.figTreeStyle(
      //       withTextStyle: TextStyle(
      //           color:
      //           ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
      //           fontSize: 16.es.json,
      //           letterSpacing: 0.5),
      //       figTreeFont: FigTreeFontStyle.bold),
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showBottom ? 60.h : 60.h);
}

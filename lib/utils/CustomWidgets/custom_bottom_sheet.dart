import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../RouteManager/navigator_service.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';


showCustomBottomSheet(
    {required BuildContext context,
    }) {
  return showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 3.h,
                      width: 75.w,
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.h),
                          color: Color(0xff828282).withOpacity(0.5))),
                  SizedBox(
                    height: 5.h,
                  ),
                  // for (BottomSheetTileModel tile in options) ...[
                  //   InkWell(
                  //     onTap: tile.onPressed,
                  //     child: Container(
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             border: Border(
                  //                 bottom: BorderSide(
                  //                     width: 0.5,
                  //                     color:
                  //                         ThemeManagerPlus.of<AppTheme>(context)
                  //                             .currentTheme
                  //                             .textInput!))),
                  //         height: 40.h,
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 5.w,
                  //             ),
                  //             SvgPicture.asset(
                  //               tile.leadingIconPath,
                  //               height: 15.h,
                  //               fit: BoxFit.scaleDown,
                  //             ),
                  //             SizedBox(
                  //               width: 20.w,
                  //             ),
                  //             Text(
                  //               tile.title,
                  //               style: AppTextStyle.figTreeStyle(
                  //                   withTextStyle: TextStyle(
                  //                       color: ThemeManagerPlus.of<AppTheme>(
                  //                               context)
                  //                           .currentTheme
                  //                           .black,
                  //                       fontSize: 16.sp),
                  //                   figTreeFont: FigTreeFontStyle.medium),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  // ]
                ],
              ),
            ),
          ),
        );
      });
}

animateDialogue({required BuildContext context, required Widget child}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}

showListAlertDialogue<T>(
    {required BuildContext context,
    required List<T> options,
    required Function(T) optionSelected}) {
  List<String> displayOptions = [];
  switch (T) {
    case String:
      displayOptions = options as List<String>;
    // case ReligionList:
    //   displayOptions = (options as List<ReligionList>)
    //       .map((e) => e.religionName ?? "")
    //       .toList();
    // case Religions:
    //   displayOptions =
    //       (options as List<Religions>).map((e) => e.name ?? "").toList();
    // case Occupation:
    //   displayOptions =
    //       (options as List<Occupation>).map((e) => e.name ?? "").toList();
    // case RecipeCategory:
    //   displayOptions =
    //       (options as List<RecipeCategory>).map((e) => e.name ?? "").toList();
  }
  showDialog(
      context: context,
      builder: (context) {
        log("$displayOptions");
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Container(
                  constraints: BoxConstraints(maxHeight: 500.h),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              optionSelected(options[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                top: (index != 0)
                                    ? BorderSide(
                                        color: Theme.of(context).dividerColor)
                                    : BorderSide.none,
                                bottom: (index != 0)
                                    ? BorderSide(
                                        color: Theme.of(context).dividerColor)
                                    : BorderSide.none,
                              )),
                              alignment: Alignment.center,
                              height: 40.h,
                              child: Text(
                                displayOptions[index],
                                style: AppTextStyle.jakartaStyle(
                                    withTextStyle:
                                        TextStyle(color: Colors.black),
                                    jakartaFont: JakartaStyle.medium),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: displayOptions.length),
                ),
              ),
            ],
          ),
        );
      });
}

showAppDialog(
    {required BuildContext context,
    required String alertTitle,
    required alertDescription,
    required String buttonLeftText,
    required String buttonRightText,
    required VoidCallback leftButonClick,
    required VoidCallback rightButtonClick}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  alertTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  alertDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                height: 1.h,
                color: Theme.of(context).dividerColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          leftButonClick();
                        },
                        child: Text(buttonLeftText,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.jakartaStyle(
                              withTextStyle: TextStyle(
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .black,
                                  fontSize: 15.sp),
                              jakartaFont: JakartaStyle.medium,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      child: VerticalDivider(
                          thickness: 0.8.w,
                          width: 0.8.w,
                          color: Theme.of(context).dividerColor),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          rightButtonClick();
                        },
                        child: Text(buttonRightText,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.jakartaStyle(
                              withTextStyle: TextStyle(
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .button_color,
                                  fontSize: 15.sp),
                              jakartaFont: JakartaStyle.medium,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

showCommonBottomSheet(
    {required BuildContext context,
    required List<dynamic> tiles,
    String? header,
    String? subHeader,
    bool isAddMembers = false,
    bool isGrid = false,
    bool isHeaderCenter = false,
    double height = 348,
    Function(dynamic)? then}) {
  return showModalBottomSheet<dynamic>(
      // isScrollControlled: true,

      context: context,
      builder: (context) {
        return Container(
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0.r),
                topRight: Radius.circular(24.0.r)),
            color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
          ),
          padding: EdgeInsets.fromLTRB(12.w, 10.h, 0.w, 34.h),
          child: Column(
            crossAxisAlignment: isHeaderCenter
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 3.h,
                  width: 80.w,
                  color: Color(0xFFBFBFBF),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              if (header != null) ...[
                Text(
                  header,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .light_black,
                          fontSize: 16.sp),
                      jakartaFont: JakartaStyle.semibold),
                ),
              ] else ...[
                SizedBox()
              ],
              if (subHeader != null) ...[
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  subHeader,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .post_create,
                          fontSize: 12.sp),
                      jakartaFont: JakartaStyle.medium),
                ),
              ] else ...[
                SizedBox()
              ],
              SizedBox(
                height: 5.h,
              ),

                    Expanded(
                    child: isGrid
                        ? GridView.builder(
                            itemCount: tiles.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: tiles[index].ontap,
                                child: isAddMembers
                                    ? AddMembersBottomSheet(
                                        tile: tiles[index],
                                        index: index,
                                      )
                                    : CommonBottomSheetOptionsModel(
                                        tile: tiles[index],
                                      ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: tiles.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // print(
                                  //     "## ${controller.visiblityOptions[index]} ##");
                                  // setState(() {
                                  // controller.changePostVisiblity(
                                  //     selectedOptions:
                                  //         controller.visiblityOptions[index],
                                  //     icon: tiles[index].icon);
                                  // FocusScope.of(context).unfocus();
                                  appNavigator.goBack();
                                  // }
                                  // );
                                },
                                child: isAddMembers
                                    ? AddMembersBottomSheet(
                                        tile: tiles[index],
                                        index: index,
                                      )
                                    : CommonBottomSheetOptionsModel(
                                        tile: tiles[index],
                                        iconSize: 22,
                                      ),
                              );
                            },
                          ),
                  ),

            ],
          ),
        );
      }).then(then ?? (val) => null);
  ;
}

showNotificationBottomSheet(
    {required BuildContext context,
    required List<BottomSheetTile> tiles,
    String? header,
    Color? headerTextColor,
    String? subHeader,
    bool isHeaderCenter = false,
    double height = 250,
    Function(dynamic)? then}) {
  return showModalBottomSheet<dynamic>(
      // isScrollControlled: true,

      context: context,
      builder: (context) {
        return Container(
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0.r),
                topRight: Radius.circular(24.0.r)),
            color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
          ),
          padding: EdgeInsets.fromLTRB(12.w, 10.h, 0.w, 34.h),
          child: Column(
            crossAxisAlignment: isHeaderCenter
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 3.h,
                  width: 80.w,
                  color: Color(0xFFBFBFBF),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              if (header != null) ...[
                Text(
                  header,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: headerTextColor ??
                              ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .light_black,
                          fontSize: 16.sp),
                      jakartaFont: JakartaStyle.semibold),
                ),
              ] else ...[
                SizedBox()
              ],
              if (subHeader != null) ...[
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  subHeader,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .post_create,
                          fontSize: 12.sp),
                      jakartaFont: JakartaStyle.medium),
                ),
              ] else ...[
                SizedBox()
              ],
              SizedBox(
                height: 5.h,
              ),
              // Consumer<CreatePostPageViewModel>(
              //   builder: (context, controller, child) {
              //     return
                    Expanded(
                    child: ListView.builder(
                      itemCount: tiles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          // onTap: tiles[index].ontap,
                          child: BottomSheetOptionsModel(
                            tile: tiles[index],
                            iconSize: 22,
                          ),
                        );
                      },
                    ),
                //   );
                // },
              )
            ],
          ),
        );
      }).then(then ?? (val) => null);
  ;
}

class CommonBottomSheetTile {
  final String icon;
  final String title;
  final String subtitle;
  final bool isSvg;
  bool isAlreadyAdded;
  final String? subtitleIcon;
  final Color? titleColor;
  final Color? subtitleColor;
  final VoidCallback? ontap;

  CommonBottomSheetTile({
    this.subtitleIcon,
    this.isAlreadyAdded = false,
    this.isSvg = true,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.ontap,
  });
}

class BottomSheetTile {
  final String? icon;
  final String title;
  final String subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final VoidCallback? ontap;

  BottomSheetTile({
    this.icon,
    required this.title,
    required this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.ontap,
  });
}

class AddMembersBottomSheet extends StatelessWidget {
  const AddMembersBottomSheet({
    super.key,
    required this.tile,
    required this.index,
  });
  final CommonBottomSheetTile tile;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 2.h),
      padding: EdgeInsets.fromLTRB(0, 0.h, 0, 5.h),
      width: 60.w,
      height: 15.h,
      decoration: BoxDecoration(
          // color: Colors.red,
          border: Border(
              bottom: BorderSide(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .faq_border_color!
                      .withOpacity(0.5)))),
      child: Column(
        children: [
          tile.icon == '_'
              ? SizedBox()
              : Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 0.h),

                  height: 60.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: tile.isAlreadyAdded
                              ? tile.subtitleColor!.withOpacity(0.3)
                              : tile.subtitleColor ?? Colors.transparent,
                          width: 2.5.h),
                      image: DecorationImage(
                          scale: 3.15,
                          opacity: tile.isAlreadyAdded ? 0.3 : 1.0,
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                            tile.icon,
                          ))),
                ),
          Text(
            tile.title,
            style: AppTextStyle.jakartaStyle(
                withTextStyle: TextStyle(
                    color: tile.isAlreadyAdded
                        ? ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .light_grey
                        : ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .light_black_text_color,
                    fontSize: 14.sp),
                jakartaFont: JakartaStyle.medium),
          )
        ],
      ),
    );
  }
}

class CommonBottomSheetOptionsModel extends StatelessWidget {
  const CommonBottomSheetOptionsModel(
      {super.key, required this.tile, this.iconSize = 28});
  final CommonBottomSheetTile tile;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tile.ontap,
      child: Container(
        height: 56.h,
        child: Row(
          children: [
            Container(
              width: 50.w,
              margin: EdgeInsets.only(right: 10.w),
              child: tile.isSvg
                  ? SvgPicture.asset(
                      tile.icon,
                      height: iconSize.h,
                      width: iconSize.w,
                    )
                  : Image.asset(
                      tile.icon,
                      height: iconSize.h,
                      width: iconSize.w,
                    ),
            ),
            Expanded(
              child: Container(
                height: 46.h,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .faq_border_color!,
                ))),
                child: Column(
                  mainAxisAlignment: tile.subtitle == '_'
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tile.title,
                      style: AppTextStyle.jakartaStyle(
                          withTextStyle: TextStyle(
                              color: tile.titleColor != null
                                  ? tile.titleColor
                                  : ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .light_black,
                              fontSize: 16.sp),
                          jakartaFont: JakartaStyle.semibold),
                    ),
                    if (tile.subtitle != '_') ...[
                      Text(
                        tile.subtitle,
                        style: AppTextStyle.jakartaStyle(
                            withTextStyle: TextStyle(
                                color: tile.subtitleColor != null
                                    ? tile.subtitleColor
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .post_create,
                                fontSize: 12.sp),
                            jakartaFont: JakartaStyle.medium),
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ] else ...[
                      SizedBox()
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetOptionsModel extends StatelessWidget {
  const BottomSheetOptionsModel(
      {super.key, required this.tile, this.iconSize = 28});
  final BottomSheetTile tile;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tile.ontap,
      child: Container(
        height: 56.h,
        child: Row(
          children: [
            // Container(
            //   width: 50.w,
            //   margin: EdgeInsets.only(right: 10.w),
            //   child: tile.isSvg
            //       ? SvgPicture.asset(
            //           tile.icon,
            //           height: iconSize.h,
            //           width: iconSize.w,
            //         )
            //       : Image.asset(
            //           tile.icon,
            //           height: iconSize.h,
            //           width: iconSize.w,
            //         ),
            // ),
            Expanded(
              child: Container(
                height: 46.h,
                padding: EdgeInsets.only(
                    left: (context.locale != Locale("ar") &&
                            context.locale != Locale("ur"))
                        ? 15.w
                        : 5.w,
                    right: (context.locale != Locale("ar") &&
                            context.locale != Locale("ur"))
                        ? 5.w
                        : 15.w),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .faq_border_color!,
                ))),
                child: Column(
                  mainAxisAlignment: tile.subtitle == '_'
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tile.title,
                      style: AppTextStyle.jakartaStyle(
                          withTextStyle: TextStyle(
                              color: tile.titleColor != null
                                  ? tile.titleColor
                                  : ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .light_black,
                              fontSize: 16.sp),
                          jakartaFont: JakartaStyle.semibold),
                    ),
                    if (tile.subtitle != '_') ...[
                      Text(
                        tile.subtitle,
                        style: AppTextStyle.jakartaStyle(
                            withTextStyle: TextStyle(
                                color: tile.subtitleColor != null
                                    ? tile.subtitleColor
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .post_create,
                                fontSize: 12.sp),
                            jakartaFont: JakartaStyle.medium),
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ] else ...[
                      SizedBox()
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

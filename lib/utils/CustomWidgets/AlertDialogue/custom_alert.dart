import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/navigator_service.dart';
import '../../../translation/locale_keys.g.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';


void showActionCancelAlert(
    {required BuildContext context,
    String? alertTitle,
    Color? alertTitleColor = Colors.black,
    double buttonHeight = 40,
    double buttonWidth = 144,
    double buttonFontSize = 14,
    String? alertDescription,
    Color? alertDescriptionColor = Colors.black,
    String? cancelBtnText,
    String? actionBtnText,
    VoidCallback? onCancelPressed,
    required VoidCallback onActionPressed}) {
  Dialog errorDialog = Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r)), //this right here
    child: Container(
      // height: height.h,
      // width: width.w,
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 15.h,
          ),
          Text(
            alertTitle ?? "Alert",
            textAlign: TextAlign.center,
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                    TextStyle(color: alertTitleColor, fontSize: 16.sp),
                outfitFont: OutfitFontStyle.bold),
          ),
          // SizedBox(
          //   height: 8.h,
          // ),
          // Divider(
          //   height: 1.h,
          //   color: Theme.of(context).dividerColor,
          // ),
          // SizedBox(
          //   height: 8.h,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              alertDescription ?? "Are You Sure",
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(color: alertDescriptionColor),
                  outfitFont: OutfitFontStyle.medium),
            ),
          ),
          // SizedBox(
          //   height: 8.h,
          // ),
          SizedBox(
            height: 20.h,
          ),
          Divider(
            height: 1.h,
            color: Theme.of(context).dividerColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: onCancelPressed != null
                      ? onCancelPressed
                      : () {
                    appNavigator.maybePop();
                  },
                  child: Container(
                    height: 30.h,
                    width: 40.w,
                    alignment: Alignment.center,
                    child: Text(
                      "${cancelBtnText ?? LocaleKeys.education_delete_cancel_button}"
                          .toUpperCase(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .black,
                              fontSize: buttonFontSize.sp),
                          outfitFont: OutfitFontStyle.semibold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
                child: VerticalDivider(thickness: 0.8.w,width: 0.8.w,
                    color: Theme.of(context).dividerColor),
              ),
              Expanded(
                child: InkWell(
                  onTap: onActionPressed,
                  child: Text(
                    "${actionBtnText ?? LocaleKeys.popup_ok_button.tr()}"
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .button_color,
                            fontSize: buttonFontSize.sp),
                        outfitFont: OutfitFontStyle.semibold),
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    ),
  );
  showDialog(context: context, builder: (BuildContext context) => errorDialog);
}

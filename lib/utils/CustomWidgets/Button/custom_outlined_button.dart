import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:loading_btn/loading_btn.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../theme/theme_model.dart';

// final Function(
//   Function startLoading, Function stopLoading, ButtonState btnState)?
class CustomOutlinedButton extends StatelessWidget {
  double? width;
  String? btnIcon;
  bool isDisabled;
  bool isBtnIcon;
  String buttonText;
  TextStyle? buttonTextStyle;
  double? height;
  Color? buttonColor;
  Color? borderColor;
  bool disableElevation;
  Color? progressIndicatorColor;
  Function(Function startLoading, Function stopLoading, ButtonState btnState)?
      onPressed;

  CustomOutlinedButton(
      {required this.buttonText,
      this.btnIcon,
      this.isBtnIcon = false,
      this.width = 100,
      this.isDisabled = false,
      this.buttonTextStyle,
      this.disableElevation = false,
      this.height,
      this.buttonColor = const Color(0xFF943F7F),
      this.borderColor,
      this.progressIndicatorColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
        height: height ?? 35.h,
        borderRadius: 30.w,
        elevation: 0,
        // elevation: disableElevation ? 0 : null,
        animate: true,
        borderSide:
            BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        color: isDisabled
            ? ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .single_interest!
            : buttonColor,
        width: width ?? double.infinity,
        // loader: Container(
        //   padding: const EdgeInsets.all(10),
        //   width: 35.w,
        //   height: 35.w,
        //   child: CircularProgressIndicator(
        //     valueColor: AlwaysStoppedAnimation<Color>(
        //         progressIndicatorColor ?? Colors.white),
        //   ),
        // ),
        child: isDisabled
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isBtnIcon ? SvgPicture.asset(btnIcon ?? "") : 0.sBW,
                  5.sBW,
                  Text(
                    buttonText,
                    style: buttonTextStyle?.copyWith(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .grey!
                            .withOpacity(0.5)),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isBtnIcon ? SvgPicture.asset(btnIcon ?? "") : 0.sBW,
                  5.sBW,
                  Text(
                    buttonText,
                    style: buttonTextStyle,
                  ),
                ],
              ),
        onTap: isDisabled
            ? (Function startLoading, Function stopLoading,
                ButtonState btnState) {}
            : onPressed);
  }
}

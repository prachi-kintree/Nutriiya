import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:loading_btn/loading_btn.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../theme/theme_model.dart';

// final Function(
//   Function startLoading, Function stopLoading, ButtonState btnState)?
class CustomButton extends StatelessWidget {
  double? width;
  bool isDisabled;
  String buttonText;
  TextStyle? buttonTextStyle;
  double? height;
  Color? buttonColor;
  bool disableElevation;
  Color? progressIndicatorColor;
  EdgeInsets? padding;
  Function(Function startLoading, Function stopLoading, ButtonState btnState)?
      onPressed;
  CustomButton(
      {required this.buttonText,
      this.width = 100,
      this.isDisabled = false,
      this.buttonTextStyle,
      this.disableElevation = false,
      this.height,
      this.buttonColor = const Color(0xFF42A004),
      this.progressIndicatorColor,
      this.onPressed, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w),
      child: LoadingBtn(
          height: height ?? 40.h,
          borderRadius: 30.w,
          elevation: 0,
          // elevation: disableElevation ? 0 : null,
          animate: true,
          color: isDisabled
              ? ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .single_interest!
              : buttonColor,
          width: width ?? double.infinity,
          loader: Container(
            padding: const EdgeInsets.all(10),
            width: 35.w,
            height: 35.w,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  progressIndicatorColor ?? Colors.white),
            ),
          ),
          child: isDisabled
              ? Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: buttonTextStyle?.copyWith(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .grey!
                          .withOpacity(0.5)),
                )
              : Text(
                  buttonText,
            textAlign: TextAlign.center,
                  style: buttonTextStyle,
                ),
          onTap: isDisabled
              ? (Function startLoading, Function stopLoading,
                  ButtonState btnState) {}
              : onPressed),
    );
  }
}

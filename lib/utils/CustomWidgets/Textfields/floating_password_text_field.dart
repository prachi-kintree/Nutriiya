import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../extension/remove_emoji.dart';
import '../../app_string/app_image_path.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';


class FloatingLabelPasswordField extends StatefulWidget {
  final String floatingLabelText;
  final String? hintText;
  Function(String)? onValueChanged;
  TextInputType textInputType;
  bool isVisible;
  bool isEyeVisible;
  bool hasBorder;
  String? Function(String?)? textValidator;
  VoidCallback? onEyeButtonClick;
  double? enabledBorderWidth;

  FloatingLabelPasswordField(
      {required this.floatingLabelText,
      required this.textInputType,
      this.textValidator,
      this.onEyeButtonClick,
      this.hintText,
      this.hasBorder = false,
      this.isEyeVisible = true,
      this.isVisible = false,
      this.enabledBorderWidth,
      this.onValueChanged});

  @override
  State<FloatingLabelPasswordField> createState() =>
      _FloatingLabelPasswordFieldState();
}

class _FloatingLabelPasswordFieldState
    extends State<FloatingLabelPasswordField> {
  String? errorText;

  bool isPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextFormField(
            onChanged: widget.onValueChanged,
            validator: widget.textValidator,
            obscureText: !isPassword,
            style: AppTextStyle.jakartaStyle(
                withTextStyle: TextStyle(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .black,
                    fontSize: 15.sp),
                jakartaFont: JakartaStyle.bold),
            cursorColor:
                ThemeManagerPlus.of<AppTheme>(context).currentTheme.purple_500,
            inputFormatters: [RemoveEmojiInputFormatter()],
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.h)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.h),
                  borderSide: BorderSide(
                      width: widget.enabledBorderWidth ?? 1,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .purple_500!
                          .withOpacity(0.5))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.h),
                  borderSide: BorderSide(color: Colors.red)),
              fillColor:
                  ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
              filled: true,
              suffixIcon: widget.isEyeVisible
                  ? isPassword
                      ? InkWell(
                          onTap: () {
                            if (widget.onEyeButtonClick != null) {
                              widget.onEyeButtonClick!();
                            }
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          child: SvgPicture.asset(
                            svgUnhidden,
                            // height: 50.h,
                            // width: 50.w,
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (widget.onEyeButtonClick != null) {
                              widget.onEyeButtonClick!();
                            }
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          child: SvgPicture.asset(svgHidden,
                              // height: 50.h,
                              // width: 50.w,
                              fit: BoxFit.scaleDown))
                  : null,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
              hintText: widget.floatingLabelText + "*",
              hintStyle: AppTextStyle.jakartaStyle(
                  withTextStyle: TextStyle(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .grey,
                      fontSize: 14.sp),
                  jakartaFont: JakartaStyle.light),
              errorStyle: AppTextStyle.jakartaStyle(
                  withTextStyle:
                      TextStyle(fontSize: 14.sp, color: Color(0xFFff0000)),
                  jakartaFont: JakartaStyle.regular),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../extension/remove_emoji.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';


class FloatingClickableTextField extends StatelessWidget {
  final String floatingLabelText;
  final String? hintText;
  Function(String)? onValueChanged;
  Key? key;
  TextInputType textInputType;
  bool isRequired;
  bool hasBorder;
  String? Function(String?)? textValidator;
  List<TextInputFormatter>? fieldFormatter;
  bool isForMobile;
  Function(bool)? isvalid;
  String? initialValue;
  bool shouldAutoFocus;
  EdgeInsets? contentPadding;
  Widget? trailingIcon;
  bool isDisable;
  double? enabledBorderWidth;
  bool isPaddingThere;
  VoidCallback? onTextFieldClick;
  TextEditingController? textController;

  FloatingClickableTextField(
      {required this.floatingLabelText,
      required this.textInputType,
      this.hintText,
      this.isPaddingThere = true,
      this.key,
      this.textController,
      this.contentPadding,
      this.shouldAutoFocus = false,
      this.textValidator,
      this.initialValue,
      this.hasBorder = false,
      this.fieldFormatter,
      this.isForMobile = false,
      this.isRequired = false,
      this.trailingIcon,
      this.isDisable = false,
      this.enabledBorderWidth,
      this.onTextFieldClick,
      this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPaddingThere
          ? EdgeInsets.symmetric(horizontal: 10.w)
          : EdgeInsets.symmetric(horizontal: 0.w),
      child: InkWell(
        onTap: onTextFieldClick,
        child: TextFormField(
          key: key,
          initialValue: initialValue,
          autofocus: shouldAutoFocus,
          controller: textController,
          enabled: false,

          onChanged: onValueChanged,
          keyboardType: textInputType,
          validator: textValidator,
          inputFormatters: [RemoveEmojiInputFormatter()],
          style: AppTextStyle.jakartaStyle(
              withTextStyle: TextStyle(
                  color:
                      ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
                  fontSize: 15.sp),
              jakartaFont: JakartaStyle.bold),
          cursorColor:
              ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(21)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(21)),
            errorMaxLines: 2,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.h),
                borderSide: BorderSide(color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.secondaryOrange!)),
            counterText: "",

            // border: hasBorder
            //     ? OutlineInputBorder(
            //         //Outline border type for TextFeild
            //         borderRadius: BorderRadius.all(Radius.circular(5)),
            //         borderSide: BorderSide(
            //           color: Colors.grey,
            //           width: 3,
            //         ))
            //     : null,

            suffixIcon: trailingIcon,
            // suffixIconConstraints: BoxConstraints(maxHeight: 40.h),
            fillColor:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.textFieldGrey,
            filled: true,
            contentPadding: contentPadding != null
                ? contentPadding
                : EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
            hintText:
                isRequired ? (floatingLabelText + "*") : floatingLabelText,
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
    );
  }
}

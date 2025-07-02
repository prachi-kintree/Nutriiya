import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../extension/remove_emoji.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';

class FloatingLabelTextField extends StatelessWidget {
  final String floatingLabelText;
  final String? hintText;
  Function(String)? onValueChanged;
  Key? key;
  TextInputType textInputType;
  bool isRequired;
  bool hasBorder;
  TextStyle? textStyle;
  TextStyle? floatingLabelStyle;
  TextStyle? labelTextStyle;
  String? Function(String?)? textValidator;
  List<TextInputFormatter>? fieldFormatter;
  bool isForMobile;
  Function(bool)? isvalid;
  String? initialValue;
  bool shouldAutoFocus;
  EdgeInsets? contentPadding;
  bool isDisable;
  bool isPaddingThere;
  bool readOnly;
  int? maxLimit;
  int? maxLines;
  double? enabledBorderWidth;
  TextEditingController? textController;

  FloatingLabelTextField(
      {required this.floatingLabelText,
      this.textInputType = TextInputType.text,
      this.isPaddingThere = true,
      this.floatingLabelStyle,
      this.hintText,
      this.key,
      this.readOnly = false,
      this.maxLines,
      this.contentPadding,
      this.textStyle,
      this.labelTextStyle,
      this.shouldAutoFocus = false,
      this.textValidator,
      this.initialValue,
      this.isDisable = false,
      this.fieldFormatter,
      this.hasBorder = false,
      this.isForMobile = false,
      this.isRequired = false,
      this.maxLimit,
      this.textController,
      this.enabledBorderWidth,
      this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPaddingThere
          ? EdgeInsets.symmetric(horizontal: 10.w)
          : EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(floatingLabelText, style: AppTextStyle.outfitStyle(
          //     withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
          //     outfitFont: OutfitFontStyle.regular)),
          20.sBH,
          TextFormField(
            readOnly: readOnly,
            key: key,
            maxLines: maxLines,
            controller: textController,
            initialValue: initialValue,
            autofocus: shouldAutoFocus,
            onChanged: onValueChanged,
            keyboardType: textInputType,
            validator: textValidator,
            maxLength: maxLimit,
            inputFormatters: [RemoveEmojiInputFormatter()],
            style: textStyle ??
                AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .black,
                        fontSize: 15.sp),
                    outfitFont: OutfitFontStyle.bold),
            cursorColor:
                ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen,
            decoration: InputDecoration(
              // border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.h)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                      width: enabledBorderWidth ?? 1,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .primaryGreen!
                          )),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(21)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(21)),
              errorMaxLines: 2,
              // errorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(20.h),
              //     borderSide: BorderSide(color: Colors.red)),
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
              fillColor: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .textFieldGrey,
              filled: true,
              contentPadding: contentPadding != null
                  ? contentPadding
                  : EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
              // labelText: floatingLabelText,
              hintText: isRequired ? (floatingLabelText + "*") : floatingLabelText,
              hintStyle: floatingLabelStyle ?? AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      color:
                          ThemeManagerPlus.of<AppTheme>(context).currentTheme.grey,
                      fontSize: 14.sp),
                  outfitFont: OutfitFontStyle.light),
              errorStyle: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 14.sp, color: Color(0xFFff0000)),
                  outfitFont: OutfitFontStyle.regular),
            ),
          ),
        ],
      ),
    );
  }
}

RichText getRequiredLabel(String fieldName, {TextStyle? style}) {
  return RichText(
      text: TextSpan(
          style: style ?? TextStyle(color: Color(0xFF656564)),
          text: fieldName,
          children: [
        TextSpan(text: '*', style: TextStyle(color: Colors.red))
      ]));
}

RichText placeHolder(String fieldName) {
  return RichText(
      text: TextSpan(
          style: TextStyle(color: Color(0xFF656564)),
          text: fieldName,
          children: []));
}

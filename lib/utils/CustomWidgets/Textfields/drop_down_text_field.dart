import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../enum/age_group_enum.dart';
import '../../app_string/app_image_path.dart';


class DropDownTextField extends StatelessWidget {
  final String floatingLabelText;
  final String? hintText;
  Function(AgeRange?)? onValueChanged;
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
  bool isDisable;
  int? maxLimit;
  TextEditingController? textController;
  DropDownTextField(
      {required this.floatingLabelText,
        this.textInputType = TextInputType.text,
        this.hintText,
        this.key,
        this.contentPadding,
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
        this.onValueChanged
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child:
      DropdownButtonFormField(
        hint: getRequiredLabel(hintText ?? ""),
        dropdownColor: Color(0xffffffff),
        decoration: InputDecoration(fillColor: Color(0xffffffff),filled: true),
        icon: SvgPicture.asset(svgDropDownArrow),
        isExpanded: true, // to avoid overflow
        items: AgeRange.values
            .map((e) => DropdownMenuItem<AgeRange>(
            value: e, child: Text(textFromAgeRangeEnum(e))))
            .toList(),
        // value: AgeRange.lessThan10,
        onChanged: onValueChanged,
      ),

      // TextFormField(
      //   key: key,
      //   controller: textController,
      //   initialValue: initialValue,
      //   autofocus: shouldAutoFocus,
      //   onChanged: onValueChanged,
      //   keyboardType: textInputType,
      //   validator: textValidator,
      //   maxLength: maxLimit,
      //   inputFormatters: [RemoveEmojiInputFormatter()],
      //   style: AppTextStyle.figTreeStyle(
      //       withTextStyle: TextStyle(
      //           color:
      //           ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
      //           fontSize: 15.es.json),
      //       figTreeFont: FigTreeFontStyle.medium),
      //   cursorColor:
      //   ThemeManagerPlus.of<AppTheme>(context).currentTheme.purple_500,
      //   decoration: InputDecoration(
      //     counterText: "",
      //     border: hasBorder
      //         ? OutlineInputBorder(
      //       //Outline border type for TextFeild
      //         borderRadius: BorderRadius.all(Radius.circular(5)),
      //         borderSide: BorderSide(
      //           color: Colors.grey,
      //           width: 3,
      //         ))
      //         : null,
      //     fillColor: isDisable
      //         ? ThemeManagerPlus.of<AppTheme>(context)
      //         .currentTheme
      //         .feeling_bg_light_pink
      //         : Colors.white,
      //     filled: true,
      //     contentPadding: contentPadding != null
      //         ? contentPadding
      //         : EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      //     label: isRequired
      //         ? getRequiredLabel(floatingLabelText)
      //         : placeHolder(floatingLabelText),
      //     errorStyle: AppTextStyle.figTreeStyle(
      //         withTextStyle:
      //         TextStyle(fontSize: 14.es.json, color: Color(0xFFff0000)),
      //         figTreeFont: FigTreeFontStyle.light),
      //     labelStyle: AppTextStyle.figTreeStyle(
      //         withTextStyle: TextStyle(
      //             color:
      //             ThemeManagerPlus.of<AppTheme>(context).currentTheme.black,
      //             fontSize: 18.es.json),
      //         figTreeFont: FigTreeFontStyle.light),
      //   ),
      // ),
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


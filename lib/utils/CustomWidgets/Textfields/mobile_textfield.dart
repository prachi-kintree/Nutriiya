import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';

class MobileTextField extends StatelessWidget {
  final bool canAccessContact;
  Function(String?) onCountryCodePressed;
  final String countryPrefix;
  String countryFlag;
  Function(String) onValueChanged;
  VoidCallback? onContactPressed;
  String? Function(String?)? textValidator;
  String? initialValue;
  ValueKey? key;
  TextInputType? keyboardType;
  bool shouldAutoFocus;
  bool isRequired;
  bool isPaddingThere;
  TextEditingController? textController;
  String floatingLabelText;
  double? enabledBorderWidth;

  MobileTextField(
      {this.canAccessContact = false,
      this.isPaddingThere = true,
      required this.onValueChanged,
      this.textValidator,
      this.initialValue,
      this.isRequired = false,
      this.shouldAutoFocus = false,
      this.onContactPressed,
      this.textController,
      this.key,
      this.keyboardType,
      this.floatingLabelText = "Mobile Number",
      required this.onCountryCodePressed,
      required this.countryPrefix,
      this.enabledBorderWidth,
      required this.countryFlag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPaddingThere
          ? EdgeInsets.symmetric(horizontal: 10.w)
          : EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(floatingLabelText, style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
              outfitFont: OutfitFontStyle.regular)),
          10.sBH,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: key,
                  initialValue: initialValue,
                  controller: textController,
                  validator: textValidator,
                  onChanged: onValueChanged,
                  autofocus: shouldAutoFocus,
                  maxLength: countryPrefix == "+91" ? 10 : 16,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .black,
                          fontSize: 15.sp),
                      outfitFont: OutfitFontStyle.bold),
                  cursorColor: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .purple_500,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.h),
                        borderSide: BorderSide(
                            width: enabledBorderWidth ?? 1,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .primaryGreen!)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(21)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(21)),
                    // errorBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(20.h),
                    //     borderSide: BorderSide(color: Colors.red)),

                    counterText: "",
                    fillColor:
                        ThemeManagerPlus.of<AppTheme>(context).currentTheme.textFieldGrey,
                    filled: true,
                    prefixIcon: InkWell(
                      onTap: () async {
                        // Object? selectedCounty =
                        //     await appNavigator.pushNamed(routeCountryList);
                        // if (selectedCounty != null) {
                        //   onCountryCodePressed(
                        //       (selectedCounty as Country).phoneCode);
                        // }
                      },
                      child: Container(
                        width: 80.w,
                        margin: EdgeInsets.only(left: 10.w),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Image.asset(countryFlag, scale: 4,),
                            // CachedNetworkImage(
                            //   imageUrl: countryFlag ?? "",
                            //   imageBuilder: (context, imageProvider) => Container(
                            //     width: 20.w,
                            //     height: 13.h,
                            //     margin: EdgeInsets.only(left: 2.w),
                            //     decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image: imageProvider, fit: BoxFit.fill),
                            //     ),
                            //   ),
                            //   errorWidget: (context, url, error) =>
                            //       Icon(Icons.error),
                            // ),
                            5.sBW,
                            Text(
                              countryPrefix,
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      color: ThemeManagerPlus.of<AppTheme>(context)
                                          .currentTheme
                                          .black,
                                      fontSize: 14.sp),
                                  outfitFont: OutfitFontStyle.bold),
                            ),
                            5.sBW,

                            SizedBox(
                              width: 0.8.w,
                              height: 20.h,
                              child: Container(
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .disabledGrey),
                            ),
                            2.sBW
                          ],
                        ),
                      ),
                    ),
                    // suffixIcon: canAccessContact
                    //     ? InkWell(
                    //         onTap: onContactPressed,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(12.0),
                    //           child: SvgPicture.asset(
                    //             svgPhoneBook,
                    //             width: 20.w,
                    //             height: 20.w,
                    //             fit: BoxFit.scaleDown,
                    //           ),
                    //         ))
                    //     : null,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    hintText:
                        "9876543210",
                    hintStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .grey,
                            fontSize: 14.sp),
                        outfitFont: OutfitFontStyle.light),
                    errorStyle: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 14.sp, color: const Color(0xFFff0000)
                            ),
                        outfitFont: OutfitFontStyle.regular),
                    errorMaxLines: 2
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

}

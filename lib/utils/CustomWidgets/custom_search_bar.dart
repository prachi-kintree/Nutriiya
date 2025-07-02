import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../extension/remove_emoji.dart';
import '../app_string/app_image_path.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController? textController;
  final Function(String)? onValueChanged;
  final bool isRequired;
  final String floatingLabelText;

  const CustomSearchBar(
      {super.key,
      this.isRequired = false,
      this.textController,
      this.onValueChanged,
      required this.floatingLabelText});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return
          Container(
          height: 40.h,
          width: 300.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              color: Colors.white,
              border: Border.all(color: Color(0xffBABABA))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: 55.w,
                height: 20.h,
                child: SvgPicture.asset(svgGlobalSearch,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .purple_500),
              ),
              Expanded(
                child: TextFormField(
                  maxLines: 1,
                  controller: widget.textController,
                  onChanged: widget.onValueChanged,
                  inputFormatters: [RemoveEmojiInputFormatter()],
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
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                    ),
                    hintText: widget.isRequired
                        ? (widget.floatingLabelText + "*")
                        : widget.floatingLabelText,
                    hintStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .grey,
                            fontSize: 14.sp),
                        outfitFont: OutfitFontStyle.light),
                    errorStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: Color(0xFFff0000)),
                        outfitFont: OutfitFontStyle.regular),
                  ),
                ),
              ),
              // value.globalSearchController.text.isEmpty
              //     ? SizedBox()
              //     : InkWell(
              //         onTap: () {
              //           value.globalSearchController.clear();
              //           value.globalSearch('');
              //         },
              //         child: Container(
              //           padding: EdgeInsets.zero,
              //           width: 55.w,
              //           height: 20.h,
              //           child: Icon(Icons.clear,
              //               color: ThemeManagerPlus.of<AppTheme>(context)
              //                   .currentTheme
              //                   .purple_500),
              //         ),
              //       )
            ],
          ),
        );

  }
}

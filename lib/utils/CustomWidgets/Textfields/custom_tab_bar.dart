// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nutriya/extension/extension_sized_box.dart';
//
// class GenderField extends StatelessWidget {
//   final String floatingLabelText;
//   final String? hintText;
//   Function(String)? onValueChanged;
//   Key? key;
//   TextInputType textInputType;
//   bool isRequired;
//   bool hasBorder;
//   TextStyle? textStyle;
//   String? Function(String?)? textValidator;
//   List<TextInputFormatter>? fieldFormatter;
//   bool isForMobile;
//   Function(bool)? isvalid;
//   String? initialValue;
//   bool shouldAutoFocus;
//   EdgeInsets? contentPadding;
//   bool isDisable;
//   bool isPaddingThere;
//   bool readOnly;
//   int? maxLimit;
//   int? maxLines;
//   double? enabledBorderWidth;
//   TextEditingController? textController;
//
//   const GenderField({required this.floatingLabelText,
//     this.textInputType = TextInputType.text,
//     this.isPaddingThere = true,
//     this.hintText,
//     this.key,
//     this.readOnly = false,
//     this.maxLines,
//     this.contentPadding,
//     this.textStyle,
//     this.shouldAutoFocus = false,
//     this.textValidator,
//     this.initialValue,
//     this.isDisable = false,
//     this.fieldFormatter,
//     this.hasBorder = false,
//     this.isForMobile = false,
//     this.isRequired = false,
//     this.maxLimit,
//     this.textController,
//     this.enabledBorderWidth,
//     this.onValueChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: isPaddingThere
//           ? EdgeInsets.symmetric(horizontal: 10.w)
//           : EdgeInsets.symmetric(horizontal: 0.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Text(floatingLabelText, style: AppTextStyle.outfitStyle(
//           //     withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
//           //     outfitFont: OutfitFontStyle.regular)),
//           20.sBH,
//           TapBar
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';

class CustomIconTabBar extends StatefulWidget {
  final List<CustomTabItem> items;
  final int initialIndex;
  final Function(int)? onChanged;

  const CustomIconTabBar({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomIconTabBar> createState() => _CustomIconTabBarState();
}

class _CustomIconTabBarState extends State<CustomIconTabBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeManagerPlus.of<AppTheme>(context).currentTheme;

    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.textFieldGrey,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final isSelected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                widget.onChanged?.call(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.fastOutSlowIn,
                padding: EdgeInsets.symmetric(vertical: 13.h),
                decoration: BoxDecoration(
                  color: isSelected ? theme.primaryGreen : Colors.transparent,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item.iconPath?.isNotEmpty ?? false ? SvgPicture.asset(
                      item.iconPath!,
                      color: isSelected ? theme.white : theme.black,
                    ) : const SizedBox(),
                    if (item.label != null) ...[
                      SizedBox(width: 6.w),
                      Text(
                        item.label!,
                        style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                            fontSize: 15.sp,
                            color: isSelected ? theme.white : theme.black,
                          ),
                          outfitFont: OutfitFontStyle.medium,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Data class to hold each tab's content
class CustomTabItem {
  final String? iconPath;
  final String? label;

  const CustomTabItem({this.iconPath, this.label});
}

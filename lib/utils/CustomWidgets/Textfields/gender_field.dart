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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';

class GenderTabBar extends StatefulWidget {
  const GenderTabBar({super.key});

  @override
  _GenderTabBarState createState() => _GenderTabBarState();
}

class _GenderTabBarState extends State<GenderTabBar> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeManagerPlus.of<AppTheme>(context)
            .currentTheme
            .textFieldGrey,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        children: [
          _buildTab(
            index: 0,
            icon: svgMaleIcon,
            label: 'Male',
            isSelected: selectedIndex == 0,
          ),
          _buildTab(
            index: 1,
            icon: svgFemaleIcon,
            label: 'Female',
            isSelected: selectedIndex == 1,
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required int index,
    required String icon,
    required String label,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: isSelected ? ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(21),
          ),
          padding: EdgeInsets.symmetric(vertical: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                color: isSelected ? ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .white : ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .black,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        fontSize: 15.sp, color: isSelected ? ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme.white : ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme.black
                    ),
                    outfitFont: OutfitFontStyle.medium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

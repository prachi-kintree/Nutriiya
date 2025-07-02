import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/dietary_prefernces.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../utils/styles/app_text_styles.dart';
import '../../utils/theme/theme_model.dart';

class SelectableFieldWidget extends StatelessWidget {
  double? height;
  double? width;
  SelectableFieldItem selectableFieldItem;
  bool isSelected;

  SelectableFieldWidget({
    super.key,
    this.height,
    required this.isSelected,
    this.width,
    required this.selectableFieldItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: ThemeManagerPlus.of<AppTheme>(context)
            .currentTheme
            .selectable_field_color,
        border: Border.all(
          width: 2,
            color: isSelected
                ? ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .primaryGreen!
                : Colors.transparent),
      ),
      child: ListTile(title: Text(
        selectableFieldItem.type,
        style: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
            outfitFont: OutfitFontStyle.regular),
      ),leading:
      SvgPicture.asset(selectableFieldItem.icon, height: 20.h),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    this.isBackbutton = true,
    this.isCancelbutton = false,
    this.appBarTitle = "App Title ",
  });
  final bool isBackbutton;
  final bool isCancelbutton;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        children: [
          20.sBW,
          isBackbutton ? SvgPicture.asset(svgBackArrow) : 20.sBW,
          const Spacer(),
          Text(appBarTitle,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 20.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.bold)),
          const Spacer(),
          isCancelbutton ? SvgPicture.asset(svgCancel) : 20.sBW,
          20.sBW,
        ],
      ),
    );
  }
}

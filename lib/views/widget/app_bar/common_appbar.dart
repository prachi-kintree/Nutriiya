import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.isBackbutton = true,
    this.isCancelbutton = false,
    this.appBarTitle = "App Title ",
    this.isCustomCallback = false,
    this.onTap,
  });

  final bool isBackbutton;
  final bool isCancelbutton;
  final String appBarTitle;
  final VoidCallback? onTap;
  final bool isCustomCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      height: 60.h,
      child: Row(
        children: [
          20.sBW,
          isBackbutton
              ? InkWell(
                  onTap: isCustomCallback
                      ? onTap
                      : () {
                          appNavigator.goBack();
                        },
                  child: SvgPicture.asset(svgBackArrow))
              : 20.sBW,
          const Spacer(),
          Text(appBarTitle,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 20.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.semibold)),
          const Spacer(),
          isCancelbutton
              ? InkWell(
                  onTap: isCustomCallback
                      ? onTap
                      : () {
                          appNavigator.goBack();
                        },
                  child: SvgPicture.asset(svgCancel))
              : 20.sBW,
          20.sBW,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.copy(Size(1.sw, 70.h));
}

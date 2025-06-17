import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_string.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../app_string/app_image_path.dart';
import '../theme/theme_model.dart';
import 'image_stack_helper.dart';


class CustomImageStack extends StatelessWidget {
  final List<String> images;
  CustomImageStack({required this.images});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List<Widget> profileImage = images.map((e) {
        if (e.isEmpty ) {
          return Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              svgProfileImage,
              width: 18.w,
              height: 18.h,
              fit: BoxFit.scaleDown,
            ),
          );
        } else {
          return Container(
            width: 18.w,
            height: 18.h,
            child: CachedNetworkImage(
              imageUrl: e.shouldAddBaseUrl(),
              width: 18.w,
              height: 18.h,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .feeling_bg_light_pink!,
                      width: 0.01),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => SvgPicture.asset(
                svgProfileImage,
                width: 18.w,
                height: 18.h,
                fit: BoxFit.scaleDown,
              ),
              errorWidget: (context, url, error) => SvgPicture.asset(
                svgProfileImage,
                width: 18.w,
                height: 18.h,
                fit: BoxFit.scaleDown,
              ),
            ),
            decoration: BoxDecoration(
              color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
              shape: BoxShape.circle,
            ),
          );
        }
      }).toList();

      return FlutterImageStack.widgets(
        children: profileImage,
        itemBorderColor: ThemeManagerPlus.of<AppTheme>(context)
            .currentTheme
            .feeling_bg_light_pink!,

        totalCount: profileImage.length,
        itemRadius: 20.h, // Radius of each images
        itemCount: 3, // Maximum number of images to be shown in stack
        itemBorderWidth: 1, // Border width around the images
      );
    });
  }
}

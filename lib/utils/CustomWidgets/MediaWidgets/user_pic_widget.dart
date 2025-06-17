import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_string.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../app_string/app_image_path.dart';
import '../../theme/theme_model.dart';


class UserProfilePic extends StatelessWidget {
  double? imageSize;
  String imageUrl;
  UserProfilePic({this.imageUrl = "", this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize ?? 40.w,
      height: imageSize ?? 40.w,
      decoration: BoxDecoration(
          color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
          borderRadius: BorderRadius.circular(imageSize ?? 60.w)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if ((imageUrl).isEmpty) ...[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5.w, color: Color(0xFFe0bfe0))),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  svgProfileImage,
                  width: imageSize ?? 40.w,
                  height: imageSize ?? 40.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ] else ...[
            CachedNetworkImage(
              imageUrl: imageUrl.shouldAddBaseUrl(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5.w, color: Color(0xFFe0bfe0)),
                  borderRadius: BorderRadius.circular(imageSize ?? 60.w),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => SvgPicture.asset(
                svgProfileImage,
                width: imageSize ?? 40.w,
                height: imageSize ?? 40.w,
                fit: BoxFit.scaleDown,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ],
      ),
    );
  }
}

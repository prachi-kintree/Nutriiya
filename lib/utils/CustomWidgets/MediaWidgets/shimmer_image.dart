import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'kintree_text_shimmer.dart';

class ShimmerImageWidget extends StatelessWidget {
  final String mediaUrl;

  bool shouldHaveExactHeight;
  bool isExpanded;
  int imgType;
  BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  ShimmerImageWidget(
      {Key? key,
      this.imgType = 1, // 1 - for normal image, 2 - for how it workds icons
      required this.mediaUrl,
      this.borderRadius,
      this.isExpanded = false,
      this.fit,
      this.shouldHaveExactHeight = false});

  @override
  Widget build(BuildContext context) {
    return mediaUrl == ""?  KintreeTextShimmer()
        : Builder(builder: (context) {
            if (shouldHaveExactHeight) {
              return Container(
                  child: CachedNetworkImage(
                imageUrl: mediaUrl,
                fit: fit ?? BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: double.infinity,
                  height: 200.h,
                  child: KintreeTextShimmer(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ));
            } else {
              return CachedNetworkImage(
                imageUrl: mediaUrl,
                placeholder: (context, url) {
                  return Container(
                    child: Container(
                        width: double.infinity,
                        height: 200.h,
                        child: KintreeTextShimmer()),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 400.h,
                    margin: isExpanded ? EdgeInsets.only(bottom: 5.h) : null,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      // borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: (imgType == 2) ? BoxFit.contain : BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }
          });
  }
}

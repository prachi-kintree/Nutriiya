import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/app_text_styles.dart';

class ForeRoomShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: CircleAvatar(
                  radius: 25.0,
                ),
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w, end: 30.w),
                  child: Column(
                    children: [
                      Container(
                        height: 10.0.h,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 6.0.h,
                        color: Colors.grey[300],
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
          // Shimmer.fromColors(
          //   baseColor: Colors.grey[300]!,
          //   highlightColor: Colors.grey[100]!,
          //   child: ListTile(
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey[100],
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Text(
                    //"KINTREE",
                    "",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(fontSize: 30.sp),
                        outfitFont: OutfitFontStyle.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../styles/app_text_styles.dart';

class KintreeTextShimmer extends StatelessWidget {
  const KintreeTextShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[100],
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Text(
          "",
          style: AppTextStyle.jakartaStyle(
              withTextStyle: TextStyle(fontSize: 18.sp),
              jakartaFont: JakartaStyle.bold),
        ),
      ),
    );
  }
}

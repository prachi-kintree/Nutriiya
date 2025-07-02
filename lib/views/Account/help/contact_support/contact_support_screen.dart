import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Contact Support',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(gradient: AppDecoration().scaffoldGradient),
        child: Column(
          children: [
            30.sBH,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0.r),
                  boxShadow: AppDecoration.addShadow(),
                  color: Colors.white),
              child: Column(
                spacing: 10.h,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgWhatsappIcon,
                        height: 20.h,
                      ),
                      15.sBW,
                      Text('+91 9876543210',
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                              outfitFont: OutfitFontStyle.regular)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        svgEmailIcon,
                        height: 20.h,
                      ),
                      15.sBW,
                      Text('Nutria@gmail.com',
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                              outfitFont: OutfitFontStyle.regular)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

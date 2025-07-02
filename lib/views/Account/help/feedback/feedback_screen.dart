import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Textfields/floating_text_field.dart';
import 'package:nutriya/utils/CustomWidgets/custom_widget_barrel.dart';
import 'package:nutriya/utils/app_string/app_string_barrel.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Feedback',
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 15.w, right: 15.w),
        child: CustomButton(buttonText: 'Submit'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(gradient: AppDecoration().scaffoldGradient),
        child: Column(
          children: [
            30.sBH,
            Column(
              spacing: 10.h,
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What do you think of Nutria?',
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 26.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.semibold)),
                Text('We’d love your feedback!',
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 16.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular)),
                10.sBH,
                Row(
                  spacing: 20.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(svgWorstEmojiIcon),
                    SvgPicture.asset(svgBadEmojiIcon),
                    SvgPicture.asset(svgOkayEmojiIcon),
                    SvgPicture.asset(svgGoodEmojiIcon),
                    SvgPicture.asset(svgBestEmojiIcon),
                  ],
                ),
                FloatingLabelTextField(
                  isPaddingThere: false,
                  labelTextStyle: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 16.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular),
                  floatingLabelText:
                      'Do you have any thoughts you’d \nlike to share?',
                  textStyle: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 16.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular),
                  maxLines: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

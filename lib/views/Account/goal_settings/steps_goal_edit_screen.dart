import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/Account/help/help_support_main_screen.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

class StepsGoalEditScreen extends StatelessWidget {
  const StepsGoalEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: 'Edit Steps Goal',
      ),
      body: Container(
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(gradient: AppDecoration().scaffoldGradient),
        child: Column(
          children: [
            15.sBH,
            CustomListTile(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Row(
                  children: [
                    Text('Set Steps Goals',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular)),
                    const Spacer(),
                    Container(
                      height: 35.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {}, child: const Icon(Icons.remove)),
                          Text(
                            // '${context.read<MealSearchScreenViewmodel>().currentFood?.quantity.round()}',
                            '8000',
                            // food.quantity.round()
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.regular),
                          ),
                          InkWell(onTap: () {}, child: const Icon(Icons.add))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

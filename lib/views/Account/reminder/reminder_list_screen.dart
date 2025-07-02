import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../RouteManager/app_routes.dart';
import '../../../utils/styles/app_decoration.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/app_bar/common_appbar.dart';
import 'food/food_reminder.dart';

class ReminderListScreen extends StatelessWidget {
  const ReminderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          appBarTitle: "Reminder",
        ),
      body: Stack(
        children: [
          const CommonGradient(),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: AppDecoration.commonBoxShadow(),
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Track Food Reminder",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      appNavigator.pushNamed(routeFoodReminder);
                    }),
                  Divider(
                    height: 10.h,
                    thickness: 0.2,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .subtitleGrey,
                  ),
                  ListTile(
                      title: Text("Water Reminder",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .light_black_text_color),
                              outfitFont: OutfitFontStyle.regular)),
                      contentPadding: EdgeInsets.zero,
                      onTap: () => {
                        appNavigator.pushNamed(routeWaterReminder)
                      })
                ],
              ),
              )

              // ListView.separated(
              //   shrinkWrap: true,
              //   itemCount: languages.length,
              //   separatorBuilder: (_, __) => Divider(height: 0.2, color: ThemeManagerPlus.of<AppTheme>(context)
              //       .currentTheme
              //       .subtitleGrey),
              //   itemBuilder: (context, index) {
              //     final lang = languages[index];
              //     final isSelected = selectedLanguage == lang;
              //
              //     return ListTile(
              //       title: Text(lang,
              //           style: AppTextStyle.outfitStyle(
              //               withTextStyle: TextStyle(
              //                   fontSize: 14.sp,
              //                   color: isSelected
              //                       ? ThemeManagerPlus.of<AppTheme>(context)
              //                       .currentTheme
              //                       .primaryGreen
              //                       : ThemeManagerPlus.of<AppTheme>(context)
              //                       .currentTheme
              //                       .light_black_text_color),
              //               outfitFont: OutfitFontStyle.regular)),
              //       contentPadding: EdgeInsets.zero,
              //       trailing: isSelected
              //           ? Icon(Icons.check, color: ThemeManagerPlus.of<AppTheme>(context)
              //           .currentTheme
              //           .primaryGreen, size: 14.h)
              //           : null,
              //       onTap: () => setState(() => selectedLanguage = lang),
              //     );
              //   },
              // ),
            ),]
          ));
  }
}

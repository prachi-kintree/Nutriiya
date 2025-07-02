import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/styles/app_decoration.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../widget/app_bar/common_appbar.dart';
import '../../../widget/common_gradient_scaffold.dart';
import '../../notification/selected_mode_settings.dart';

class FoodReminder extends StatefulWidget {
  const FoodReminder({super.key});

  @override
  State<FoodReminder> createState() => _FoodReminderState();
}

class _FoodReminderState extends State<FoodReminder> {
  bool reminderEnabled = true;
  final Map<String, bool> meals = {
    'Breakfast': false,
    'Lunch': false,
    'Evening Snacks': false,
    'Dinner': false,
  };

  final Map<String, TimeOfDay> mealTimes = {
    'Breakfast': TimeOfDay(hour: 8, minute: 0),
    'Lunch': TimeOfDay(hour: 13, minute: 0),
    'Evening Snacks': TimeOfDay(hour: 16, minute: 0),
    'Dinner': TimeOfDay(hour: 21, minute: 0),
  };

  bool showTip = true;

  Future<void> pickTime(String meal) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: mealTimes[meal]!,
    );
    if (picked != null) {
      setState(() => mealTimes[meal] = picked);
    }
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          appBarTitle: "Track Food Reminder",
        ),
        body: Stack(children: [
          const CommonGradient(),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                CustomSwitchTile(
                  // contentPadding: const EdgeInsets.all(0),
                  title: "Track Food Reminder",
                  // subtitle: subtitle,
                  value: reminderEnabled,
                  onToggle: (val) => setState(() => reminderEnabled = val),
                  // activeColor: Colors.green,
                ),
                SizedBox(height: 16.h),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: AppDecoration.commonBoxShadow(),
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .white),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem Ipsum is simply dummy text",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        ThemeManagerPlus.of<AppTheme>(context)
                                            .currentTheme
                                            .subtitleGrey),
                                outfitFont: OutfitFontStyle.regular),
                          ),
                          10.sBH,
                          ...meals.keys.map((meal) {
                            return Padding(
                                padding:
                                     EdgeInsets.symmetric(vertical: 5.h),
                                child: Row(
                                  children: [
                                    SizedBox(height: 20.h, width: 20.w,
                                    child: Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                            value: meals[meal],

                                            splashRadius: 0,
                                            onChanged: (val) => setState(
                                                    () => meals[meal] = val!),
                                            activeColor:
                                            ThemeManagerPlus.of<AppTheme>(
                                                context)
                                                .currentTheme
                                                .primaryGreen,
                                            // shape:
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(2.0),
                                            ),
                                            side: WidgetStateBorderSide
                                                .resolveWith(
                                                  (states) => BorderSide(
                                                  width: 1.3,
                                                  color: ThemeManagerPlus.of<
                                                      AppTheme>(context)
                                                      .currentTheme
                                                      .primaryGreen!),
                                            )))),
                                    12.sBW,
                                    Expanded(
                                        child: Text(meal,
                                            style: AppTextStyle.outfitStyle(
                                                withTextStyle: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: ThemeManagerPlus.of<
                                                            AppTheme>(context)
                                                        .currentTheme
                                                        .subtitleGrey),
                                                outfitFont:
                                                    OutfitFontStyle.regular))),
                                    ElevatedButton(
                                      onPressed: () => pickTime(meal),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        fixedSize: Size(70.w, 18.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 6.h),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color:
                                                  ThemeManagerPlus.of<AppTheme>(
                                                          context)
                                                      .currentTheme
                                                      .black!),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Text(formatTime(mealTimes[meal]!),
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 11.sp,
                                                  color: ThemeManagerPlus.of<
                                                          AppTheme>(context)
                                                      .currentTheme
                                                      .subtitleGrey),
                                              outfitFont:
                                                  OutfitFontStyle.regular)),
                                    )
                                  ],
                                ));
                          })
                        ])),

                Spacer(),
                if (showTip)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .white,
                        boxShadow: AppDecoration.commonBoxShadow()),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 4.h),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .primaryGreen,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text("Tip",
                                    style: AppTextStyle.outfitStyle(
                                        withTextStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: ThemeManagerPlus.of<
                                                AppTheme>(context)
                                                .currentTheme
                                                .white),
                                        outfitFont:
                                        OutfitFontStyle.regular)),
                              ),
                              Text("Stay on Track!",
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 18.sp,
                                          color: ThemeManagerPlus.of<
                                              AppTheme>(context)
                                              .currentTheme
                                              .black),
                                      outfitFont:
                                      OutfitFontStyle.regular)),
                              SizedBox(height: 4),
                              Text(
                                "Set your meal times to build a consistent routine and never miss a bite.",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: ThemeManagerPlus.of<
                                            AppTheme>(context)
                                            .currentTheme
                                            .subtitleGrey),
                                    outfitFont:
                                    OutfitFontStyle.regular),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => setState(() => showTip = false),
                            child: SvgPicture.asset(svgCancel, height: 10.h))
                      ],
                    ),
                  ),
                // Card(
                //   color: Colors.white,
                //   elevation: 3,
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(16),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //           padding:
                //           const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                //           decoration: BoxDecoration(
                //             color: Colors.green,
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           child: const Text("Tip",
                //               style: TextStyle(color: Colors.white, fontSize: 12)),
                //         ),
                //         const SizedBox(width: 12),
                //         Expanded(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: const [
                //               Text("Stay on Track!",
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold, fontSize: 16)),
                //               SizedBox(height: 4),
                //               Text(
                //                 "Set your meal times to build a consistent routine and never miss a bite.",
                //                 style: TextStyle(fontSize: 13, color: Colors.grey),
                //               ),
                //             ],
                //           ),
                //         ),
                //         IconButton(
                //           icon: const Icon(Icons.close, size: 18),
                //           onPressed: () => setState(() => showTip = false),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                20.sBH
              ],
            ),
          ),
        ]));
  }
}

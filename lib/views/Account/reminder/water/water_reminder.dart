import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../RouteManager/navigator_service.dart';
import '../../../../utils/styles/app_decoration.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../widget/app_bar/common_appbar.dart';
import '../../notification/selected_mode_settings.dart';

class WaterReminder extends StatefulWidget {
  const WaterReminder({super.key});

  @override
  State<WaterReminder> createState() => _WaterReminderState();
}

class _WaterReminderState extends State<WaterReminder> {
  bool reminderEnabled = true;
  bool isEnabled = true;
  int mlPerGlass = 250;
  int glassGoal = 6;

  TimeOfDay fromTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay toTime = const TimeOfDay(hour: 20, minute: 0);

  String? selectedInterval;
  final List<String> intervals = [
    '30 Minutes',
    '1 Hour',
    '2 Hours',
    '3 Hours',
  ];

  Future<void> pickTime(bool isFrom) async {
    final picked = await showCupertinoModalPopup<TimeOfDay>(
      context: context,
      // initialTime: isFrom ? fromTime : toTime,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(15.h),
          decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          height: 250.h,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  appNavigator.goBack();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Done",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14.sp,
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .primaryGreen),
                          outfitFont: OutfitFontStyle.medium)),
                ),
              ),
              Text(isFrom ? "Start Time" : "End Time",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                        decoration: TextDecoration.none,
                          fontSize: 22.sp,
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .black),
                      outfitFont: OutfitFontStyle.medium)),
              20.sBH,
              SizedBox(
                height: 150.h,
                child: CupertinoDatePicker(

                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      isFrom ? fromTime.hour : toTime.hour,
                      isFrom ? fromTime.minute : toTime.minute),
                  minimumDate: isFrom
                      ? null
                      : DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    fromTime.hour,
                    fromTime.minute,
                  ),
                  use24hFormat: false,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        if (isFrom) {
                          fromTime = TimeOfDay(hour: newTime.hour, minute: newTime.minute);

                          // Optional: adjust toTime if it's before new fromTime
                          final toDateTime = DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              toTime.hour,
                              toTime.minute);
                          final newFromDateTime = DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              newTime.hour,
                              newTime.minute);

                          if (toDateTime.isBefore(newFromDateTime)) {
                            toTime = TimeOfDay(hour: newTime.hour + 1, minute: newTime.minute);
                          }
                        } else {
                          toTime = TimeOfDay(hour: newTime.hour, minute: newTime.minute);
                        }
                      });
                    }
                ),
              ),
              // CupertinoButton(
              //   child: const Text('OK'),
              //   onPressed: () {
              //     Navigator.of(context).pop(_selectedTime);
              //   },
              // ),
            ],
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromTime = picked;
        } else {
          toTime = picked;
        }
      });
    }
  }

  String formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')} $period';
  }

  Widget buildCounter(String label, int value, VoidCallback onIncrement,
      VoidCallback onDecrement) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color(0xFFF5F5F5),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(label,
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .light_black_text_color),
                      outfitFont: OutfitFontStyle.regular))),
          Container(
              height: 30.h,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .black!)),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    onPressed: onDecrement,
                    icon: const Icon(Icons.remove),
                    // splashRadius: 20,
                  ),
                  Text(value.toString(),
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              fontSize: 14.sp,
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .light_black_text_color),
                          outfitFont: OutfitFontStyle.regular)),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    onPressed: onIncrement,
                    icon: const Icon(Icons.add),
                    // splashRadius: 20,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildDropdown() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color(0xFFF5F5F5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedInterval,
          hint: Text("Remind me in every",
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      fontSize: 14.sp,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .light_black),
                  outfitFont: OutfitFontStyle.regular)),
          icon: SvgPicture.asset(svgDropDown),
          isExpanded: true,
          onChanged: (value) => setState(() => selectedInterval = value),
          items: intervals
              .map((interval) => DropdownMenuItem(
                  value: interval,
                  child: Text(
                    interval,
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .light_black_text_color),
                        outfitFont: OutfitFontStyle.regular),
                  )))
              .toList(),
        ),
      ),
    );
  }

  Widget buildTimeRangePicker() {
    return Row(
      children: [
        Text("Between",
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    fontSize: 14.sp,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color),
                outfitFont: OutfitFontStyle.regular)),
        const Spacer(),
        OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .subtitleGrey,
            fixedSize: Size(70.w, 18.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .black!),
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          onPressed: () => pickTime(true),
          child: Text(formatTime(fromTime),
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      fontSize: 11.sp,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .light_black_text_color),
                  outfitFont: OutfitFontStyle.regular)),
        ),
        8.sBW,
        Text("To",
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    fontSize: 14.sp,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color),
                outfitFont: OutfitFontStyle.regular)),
        8.sBW,
        OutlinedButton(
          onPressed: () => pickTime(false),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .subtitleGrey,
            fixedSize: Size(70.w, 18.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .black!),
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(formatTime(toTime),
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      fontSize: 11.sp,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .light_black_text_color),
                  outfitFont: OutfitFontStyle.regular)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: "Water Reminder",
      ),
      body: Stack(
        children: [
          const CommonGradient(),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                // Toggle

                CustomSwitchTile(
                  // contentPadding: const EdgeInsets.all(0),
                  title: "Water Reminder",
                  // subtitle: subtitle,
                  value: reminderEnabled,
                  onToggle: (val) => setState(() => reminderEnabled = val),
                  // activeColor: Colors.green,
                ),
                SizedBox(height: 20.h),

                // Settings card
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: AppDecoration.commonBoxShadow(),
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .white),
                  child: Column(
                    children: [
                      buildCounter(
                        "Select ml (per glass)",
                        mlPerGlass,
                        () => setState(() => mlPerGlass += 50),
                        () => setState(() {
                          if (mlPerGlass > 50) mlPerGlass -= 50;
                        }),
                      ),
                      buildCounter(
                        "Set Goal (Glasses)",
                        glassGoal,
                        () => setState(() => glassGoal++),
                        () => setState(() {
                          if (glassGoal > 1) glassGoal--;
                        }),
                      ),
                      buildDropdown(),
                      const SizedBox(height: 8),
                      buildTimeRangePicker(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

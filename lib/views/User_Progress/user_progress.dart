import 'package:date_util_plus/date_util_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/CustomWidgets/Textfields/custom_tab_bar.dart';
import 'package:nutriya/views/User_Progress/widgets/calorie_chart.dart';
import 'package:nutriya/views/User_Progress/widgets/nutrition_chart.dart';
import 'package:nutriya/views/User_Progress/widgets/steps_chart.dart';
import 'package:nutriya/views/User_Progress/widgets/water_chart.dart';
import 'package:nutriya/views/User_Progress/widgets/weight_chart.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../utils/styles/app_text_styles.dart';
import '../../utils/theme/theme_model.dart';

class UserProgressScreen extends StatefulWidget {
  const UserProgressScreen({Key? key}) : super(key: key);

  @override
  State<UserProgressScreen> createState() => _UserProgressScreenState();
}

class _UserProgressScreenState extends State<UserProgressScreen> {
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now().subtractDays(days: 7);
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Calorie (kcal)')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                spacing: 15.h,
                children: [
                  10.sBH,
                  _title(),
                  CustomIconTabBar(
                    items: const [
                      // CustomTabItem(label: 'Daily'),
                      CustomTabItem(label: 'Weekly'),
                      CustomTabItem(label: 'Monthly'),
                      CustomTabItem(label: 'Yearly'),
                    ],
                    onChanged: (e) {
                      setState(() {
                        currentTab = e;
                      });
                    },
                  ),
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: const Color(0xff5E5F60),
                        size: 14.h,
                      ),
                    )),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () async {
                          showCustomDateRangePicker(context);
                        },
                        child: Text(
                            "${DateFormat.MMMM().format(startDate ?? DateTime.now())} ${startDate?.day}-${DateFormat.MMMM().format(endDate ?? DateTime.now())} ${endDate?.day}, ${startDate?.year}",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                outfitFont: OutfitFontStyle.medium)),
                      ),
                    ),
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: const Color(0xff5E5F60),
                        size: 14.h,
                      ),
                    )),
                  ])),
                  CalorieChart(currentTab: currentTab),
                  NutritionChart(currentTab: currentTab),
                   WaterChart(currentTab: currentTab),
                   StepsChart(currentTab: currentTab),
                   WeightChart(currentTab: currentTab)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text("Progress",
        style: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
            outfitFont: OutfitFontStyle.semibold));
  }

  void showCustomDateRangePicker(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        DateRangePickerController controller = DateRangePickerController();

        Color? primaryColor =
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen;
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            height: 400.h,
            child: Column(
              children: [
                // Header with title, close and save buttons
                Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: const Border(
                          bottom: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          final PickerDateRange? selectedRange =
                              controller.selectedRange;
                          if (selectedRange != null) {
                            print('Start: ${selectedRange.startDate}');
                            print('End: ${selectedRange.endDate}');
                            setState(() {
                              startDate = selectedRange.startDate;
                              endDate = selectedRange.endDate;
                            });

                          }
                          Navigator.pop(context);
                        },
                        child: Text('SAVE',
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                                outfitFont: OutfitFontStyle.semibold)),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Center(
                      child: Text("SELECTED RANGE",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  letterSpacing: 1.2),
                              outfitFont: OutfitFontStyle.semibold)),
                    )),

                // Date picker
                Expanded(
                  child: SfDateRangePicker(
                    controller: controller,
                    selectionMode: DateRangePickerSelectionMode.range,
                    onViewChanged: (DateRangePickerViewChangedArgs args) {
                      // setState(() {
                      //   _visibleDate = args.visibleDateRange.startDate;
                      // });
                    },
                    rangeTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular),
                    selectionTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(fontSize: 14.sp),
                        outfitFont: OutfitFontStyle.regular),
                    rangeSelectionColor: const Color(0xffD9ECCD),
                    startRangeSelectionColor: primaryColor,
                    endRangeSelectionColor: primaryColor,
                    todayHighlightColor: primaryColor,

                    navigationMode: DateRangePickerNavigationMode.scroll,
                    navigationDirection:
                        DateRangePickerNavigationDirection.vertical,
                    allowViewNavigation: true,
                    showNavigationArrow: true,
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      todayTextStyle: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: primaryColor),
                          outfitFont: OutfitFontStyle.semibold),
                      textStyle: AppTextStyle.outfitStyle(
                          withTextStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.black),
                          outfitFont: OutfitFontStyle.regular),
                    ),
                    // View settings
                    view: DateRangePickerView.month,
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                      enableSwipeSelection: true,
                      // showTrailingAndLeadingDates: true,
                    ),
                    // Set min and max date limits
                    minDate: DateTime(2000),
                    maxDate: DateTime(2100),

                    // Clean look
                    showActionButtons: false,
                    headerHeight: 30.h,
                    headerStyle: DateRangePickerHeaderStyle(
                        textStyle: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.black.withOpacity(0.7)),
                            outfitFont: OutfitFontStyle.semibold),
                        textAlign: TextAlign.center),
                  ),
                ),
                10.sBH
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';

class CustomCalender extends StatefulWidget {
  @override
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: 250.h,
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          // controller: controller.monthScrollController,
                          itemExtent: 70,
                          diameterRatio: 2,
                          perspective: 0.001,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            // controller.setSelectedMonthIndex(index);
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                  child: _tileWidget(
                                      text: "controller.months[index].toString()",
                                      condition: true));
                            },
                            // childCount: controller.months.length,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          // controller: controller.dayScrollController,
                          itemExtent: 70,
                          diameterRatio: 2,
                          perspective: 0.001,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            // controller.setSelectedDayIndex(index);
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Container();
                                // Center(
                                //   child: _tileWidget(
                                //       text: controller.days[index].toString(),
                                //       condition: index == controller.selectedDayIndex));
                            },
                            // childCount: controller.days.length,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          // controller: controller.yearScrollController,
                          itemExtent: 70,
                          diameterRatio: 2,
                          perspective: 0.001,
                          physics: FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            // controller.setSelectedYearIndex(index);

                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                  child: _tileWidget(
                                      text: "controller.years[index].toString()",
                                      condition: true));
                            },
                            childCount: 5,
                          ),
                        ),
                      ),
                    ],

              ),
            ),
          ),
        ],
      ),
    );
  }

  _tileWidget({required String text, required bool condition}) {
    return Container(
      height: 30.h,
      width: 70.w,
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.h),
          color: condition
              ? ThemeManagerPlus.of<AppTheme>(context).currentTheme.purple_500
              : Colors.transparent,
          boxShadow: condition
              ? [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .black!
                          .withOpacity(0.25))
                ]
              : []),
      child: Text(
        text,
        style: AppTextStyle.jakartaStyle(
            withTextStyle: TextStyle(
                color: condition
                    ? ThemeManagerPlus.of<AppTheme>(context).currentTheme.white
                    : Colors.grey,
                fontSize: 18.sp),
            jakartaFont: JakartaStyle.bold),
      ),
    );
  }
}

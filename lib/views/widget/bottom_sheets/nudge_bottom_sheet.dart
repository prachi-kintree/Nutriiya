import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/dietary_prefernces.dart';
import 'package:nutriya/views/widget/selectable_field_widget.dart';

enum BottomSheetType { valueList, thumps, statustracker }

class NudgeBottomSheet extends StatelessWidget {
  const NudgeBottomSheet({
    super.key,
    required this.primaryGoals,
    required this.title,
    this.isThumps = false,
    this.bottomSheetType = BottomSheetType.valueList,
  });
  final List<SelectableFieldItem> primaryGoals;
  final String title;
  final bool? isThumps;
  final BottomSheetType bottomSheetType;

  @override
  Widget build(BuildContext context) {
    final List<TimelineStep> _steps = [
      TimelineStep(
        title: 'Install the app',
        message:
            'Welcome to Nutria! Download the app to start tracking your meals and reaching your goals easily.',
        icon: svgInstallApp,
        status: TimelineStatus.completed,
      ),
      TimelineStep(
        title: 'Today',
        message:
            'Today\'s a great day to begin! Set your goals and start building healthy habits.',
        icon: svgToday,
        status: TimelineStatus.inProgress,
      ),
      TimelineStep(
        title: '30 days before subscription renewal',
        message:
            'Your renewal is in 30 days. Take a moment to check your progress and get ready to continue.',
        icon: svgUnselectedStar,
        status: TimelineStatus.upcoming,
      ),
      TimelineStep(
        title: 'Renewal day',
        message:
            'It\'s renewal day! Thanks for staying with Nutria — let\'s keep going strong together.',
        icon: svgUnselectedRenewal,
        status: TimelineStatus.upcoming,
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(svgCancel), 15.sBW],
          ),
          20.sBH,
          Text(title,
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 26.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.semibold)),
          20.sBH,
          Column(
            children: [
              10.sBH,
              if (BottomSheetType.thumps == bottomSheetType) ...[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ThumpsContainer(
                      isThumpsUp: true,
                    ),
                    ThumpsContainer(isThumpsUp: false)
                  ],
                )
              ] else if (BottomSheetType.valueList == bottomSheetType) ...[
                SizedBox(
                  height: 300.h,
                  child: ListView.builder(
                      itemCount: primaryGoals.length,
                      itemBuilder: (context, index) {
                        SelectableFieldItem currentPref = primaryGoals[index];
                        return SelectableFieldWidget(
                          isSelected: false,
                            selectableFieldItem: currentPref);
                      }),
                )
              ] else if (BottomSheetType.statustracker == bottomSheetType) ...[
                SizedBox(
                  height: 350.h,
                  child: ListView.builder(
                    itemCount: _steps.length,
                    itemBuilder: (context, index) {
                      final step = _steps[index];
                      return _TimelineStepWidget(
                        step: step,
                        isFirst: index == 0,
                        isLast: index == _steps.length - 1,
                      );
                    },
                  ),
                )
              ],
              10.sBH,
            ],
          )
        ],
      ),
    );
  }
}

class ThumpsContainer extends StatelessWidget {
  const ThumpsContainer({
    super.key,
    required this.isThumpsUp,
  });
  final bool isThumpsUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 166.w,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff828282B2)),
          borderRadius: BorderRadius.circular(12.0.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(isThumpsUp ? pngThumpsUp : pngThumpsDown),
          20.sBH,
          Text(isThumpsUp ? "Yes" : "No",
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 19.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.regular)),
        ],
      ),
    );
  }
}

enum TimelineStatus { completed, inProgress, upcoming }

class TimelineStep {
  final String title;
  final String message;
  final String icon;
  final TimelineStatus status;

  TimelineStep({
    required this.title,
    required this.message,
    required this.icon,
    required this.status,
  });
}

class _TimelineStepWidget extends StatelessWidget {
  final TimelineStep step;
  final bool isFirst;
  final bool isLast;

  const _TimelineStepWidget({
    required this.step,
    required this.isFirst,
    required this.isLast,
  });

  Color _getLineColor() {
    if (step.status == TimelineStatus.completed ||
        step.status == TimelineStatus.inProgress) {
      return const Color(0xFF65A30D);
    }
    return Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTimelineBar(),
          SizedBox(width: 24.w),
          _buildContent(), // <-- This method now contains the height logic
        ],
      ),
    );
  }

  Widget _buildTimelineBar() {
    BorderRadius borderRadius;
    if (isFirst && isLast) {
      borderRadius = BorderRadius.circular(25.0.r);
    } else if (isFirst) {
      borderRadius = BorderRadius.vertical(top: Radius.circular(25.0.r));
    } else if (isLast) {
      borderRadius = BorderRadius.vertical(bottom: Radius.circular(25.0.r));
    } else {
      borderRadius = BorderRadius.zero;
    }

    // if (isFirst && isLast) {
    //   borderRadius = BorderRadius.vertical(
    //       bottom: Radius.circular(25.0.r), top: Radius.circular(25.0.r));
    // } else if (step.status == TimelineStatus.completed && isFirst) {
    //   borderRadius = BorderRadius.vertical(top: Radius.circular(25.0.r));
    // } else if (step.status == TimelineStatus.completed) {
    //   borderRadius = BorderRadius.vertical(bottom: Radius.circular(25.0.r));
    // } else if (isLast) {
    //   borderRadius = BorderRadius.vertical(bottom: Radius.circular(25.0.r));
    // } else {
    //   borderRadius = BorderRadius.zero;
    // }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 50,
          decoration: BoxDecoration(
            color: _getLineColor(),
            borderRadius: borderRadius,
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: step.status == TimelineStatus.completed
                ? SvgPicture.asset(
                    step.icon == svgUnselectedStar
                        ? svgSelectedStar
                        : step.icon == svgUnselectedRenewal
                            ? svgSelectedRenewal
                            : step.icon,
                    height: 20.h,
                  )
                : SvgPicture.asset(
                    step.icon,
                    height: 20.h,
                  ),
          ),
        ),
      ],
    );
  }

  // --- UPDATED WIDGET WITH HEIGHT CONTROL ---
  Widget _buildContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          // This container now controls the height of the entire row
          // constraints: BoxConstraints(
          //   minHeight: 120, // <-- SET YOUR DESIRED MINIMUM HEIGHT HERE
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(step.title,
                  style: AppTextStyle.outfitStyle(
                      textDecoration: step.status == TimelineStatus.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      withTextStyle:
                          TextStyle(fontSize: 20.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
              const SizedBox(height: 8),
              Text(step.message,
                  style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff5E5F60)),
                      outfitFont: OutfitFontStyle.regular)),
            ],
          ),
        ),
      ),
    );
  }
}

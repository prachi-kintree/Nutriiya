import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../styles/app_decoration.dart';
import '../styles/app_text_styles.dart';
import '../theme/theme_model.dart';
import 'Textfields/drop_down_text_field.dart';


class InfoChip extends StatelessWidget {
  final String title;
  final String description;
  Widget? titleIcon;
  String? chipValue;
  bool isChipVisible;
  bool isRequired;
  VoidCallback? onChipPressed;

  InfoChip(
      {required this.title,
      required this.description,
      this.titleIcon,
      this.isRequired = false,
      this.chipValue,
      this.onChipPressed,
      this.isChipVisible = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            isRequired
                ? getRequiredLabel(
                    title,
                    style: AppTextStyle.jakartaStyle(
                        withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .grey),
                        jakartaFont: JakartaStyle.regular),
                  )
                : Text(title,
                    style: AppTextStyle.jakartaStyle(
                        withTextStyle: TextStyle(
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .grey),
                        jakartaFont: JakartaStyle.regular)),
            if (titleIcon != null) ...[
              SizedBox(
                width: 5.w,
              ),
              titleIcon!
            ]
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: Stack(
            children: [
              Tooltip(
                textStyle: AppTextStyle.jakartaStyle(
                    withTextStyle: TextStyle(
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .purple_500,
                        // overflow: TextOverflow.ellipsis,
                        fontSize: 13.sp),
                    jakartaFont: JakartaStyle.regular),
                decoration: BoxDecoration(
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .white),
                preferBelow: true,

                triggerMode: TooltipTriggerMode.tap,
                message: description,
                child: Text(
                  truncateTextWithEllipsis(description),
                  maxLines: 1,
                  style: AppTextStyle.jakartaStyle(
                      withTextStyle: TextStyle(
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .black,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15.sp),
                      jakartaFont: JakartaStyle.bold),
                ),
              ),
              Visibility(
                visible: isChipVisible,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: onChipPressed,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        chipValue ?? "",
                        style: TextStyle(fontSize: 9.sp),
                      ),
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                          boxShadow: AppDecoration.addShadow(),
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .white,
                          borderRadius: BorderRadius.circular(10.w)),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

String truncateTextWithEllipsis(String text, {int maxLength = 50}) {
  String cleanedText = text.replaceAll('\n', '  ');

  if (cleanedText.length > maxLength) {
    return cleanedText.substring(0, maxLength) + '...';
  } else {
    return cleanedText;
  }
}

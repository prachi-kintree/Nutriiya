import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/styles/app_decoration.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import 'package:flutter_switch/flutter_switch.dart'; // Add this in pubspec.yaml

class SelectedModeSettings extends StatefulWidget {
  final String title;
  const SelectedModeSettings({super.key, required this.title});

  @override
  State<SelectedModeSettings> createState() => _SelectedModeSettingsState();
}

class _SelectedModeSettingsState extends State<SelectedModeSettings> {
  bool messageEnabled = true;
  bool reportsEnabled = true;
  bool marketingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBarTitle: widget.title,
      ),
      body: Stack(
        children: [
          CommonGradient(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  boxShadow: AppDecoration.commonBoxShadow(),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchTile(
                    title: "Receiving message on +91 9876543210",
                    value: messageEnabled,
                    onChanged: (val) => setState(() => messageEnabled = val),
                  ),
                  Divider(
                    height: 10.h,
                    thickness: 0.2,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .subtitleGrey,
                  ),
                  SwitchTile(
                    title: "Reports & Insights",
                    subtitle:
                        "Stay informed with regular health updates and actionable insights.",
                    value: reportsEnabled,
                    onChanged: (val) => setState(() => reportsEnabled = val),
                  ),
                  Divider(
                    height: 10.h,
                    thickness: 0.2,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .subtitleGrey,
                  ),
                  SwitchTile(
                    title: "Marketing & Offers",
                    subtitle:
                        "Be the first to know about exclusive deals, new features, and special discounts.",
                    value: marketingEnabled,
                    onChanged: (val) => setState(() => marketingEnabled = val),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSwitchTile(
      // contentPadding: const EdgeInsets.all(0),
      title: title,
      subtitle: subtitle,

      value: value,
      onToggle: onChanged,
      // activeColor: Colors.green,
    );
  }
}

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onToggle;

  const CustomSwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Container(
        margin: EdgeInsets.only(bottom: 5.h),
        child: Text(title,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    fontSize: 14.sp,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color),
                outfitFont: OutfitFontStyle.regular)),
      ),

      subtitle: subtitle != null
          ? Text(subtitle!,
              style: AppTextStyle.outfitStyle(
                  withTextStyle: TextStyle(
                      fontSize: 12.sp,
                      color: ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .light_black_text_color),
                  outfitFont: OutfitFontStyle.regular))
          : null,
      trailing: SizedBox(
        height: 30.h,
        width: 40.h,
        child: FlutterSwitch(
          width: 40.w,
          height: 16.h,
          toggleSize: 10.h,
          toggleColor: const Color(0xffECF0F1),
          value: value,
          borderRadius: 30.0,
          padding: 2.h,
          activeColor:
              ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen!,
          onToggle: onToggle,
        ),
      ),
    );
  }
}

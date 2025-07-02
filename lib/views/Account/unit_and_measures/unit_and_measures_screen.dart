import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';

class UnitsAndMeasuresScreen extends StatefulWidget {
  const UnitsAndMeasuresScreen({super.key});

  @override
  State<UnitsAndMeasuresScreen> createState() => _UnitsAndMeasuresScreenState();
}

class _UnitsAndMeasuresScreenState extends State<UnitsAndMeasuresScreen> {
  String selectedWeight = 'kg';
  String selectedHeight = 'cm';
  String selectedLiquid = 'ml';

  Widget buildUnitCard({
    required String title,
    required List<Map<String, String>> options,
    required String groupValue,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Text(title,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(
                    fontSize: 16.sp,
                    color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .light_black_text_color),
                outfitFont: OutfitFontStyle.regular)),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppDecoration.commonBoxShadow(),
              color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.white),
          child: Column(
            children: options.map((option) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 7.h),
                    title: Text(option['label']!,
                        // textAlign: TextAlign.start,

                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 16.sp,
                                color:
                                option['value'] == groupValue
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .light_black_text_color
                                    :
                                ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .subtitleGrey),
                            outfitFont: OutfitFontStyle.regular)),
                    trailing: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .primaryGreen,
                      ),
                      child: Radio<String>(
                        value: option['value']!,
                        groupValue: groupValue,
                        onChanged: onChanged,
                        activeColor: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .primaryGreen,
                        splashRadius: 0,
                      ),
                    ),
                    onTap: () => onChanged(option['value']),
                  ),
                  if (option != options.last)
                    Divider(
                        height: 0.2,
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .subtitleGrey),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: "Units & Measures",
      ),
      body: Stack(
        children: [
          const CommonGradient(),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                buildUnitCard(
                  title: 'Weight',
                  options: [
                    {'label': 'Kilograms (kg)', 'value': 'kg'},
                    {'label': 'Pounds (lb)', 'value': 'lb'},
                  ],
                  groupValue: selectedWeight,
                  onChanged: (val) => setState(() => selectedWeight = val!),
                ),
                buildUnitCard(
                  title: 'Height',
                  options: [
                    {'label': 'Centimeters (cms)', 'value': 'cm'},
                    {'label': 'Feet & Inches (ft/in)', 'value': 'ftin'},
                  ],
                  groupValue: selectedHeight,
                  onChanged: (val) => setState(() => selectedHeight = val!),
                ),
                buildUnitCard(
                  title: 'Liquid Unit',
                  options: [
                    {'label': 'Milliliters (mL)', 'value': 'ml'},
                    {'label': 'Liters (L)', 'value': 'liters'},
                  ],
                  groupValue: selectedLiquid,
                  onChanged: (val) => setState(() => selectedLiquid = val!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
import 'package:nutriya/views/widget/selectable_field_widget.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/CustomWidgets/Textfields/sliding_tab_selector.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import 'dietary_prefernces.dart';

class RegionalFoodPreferences extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  RegionalFoodPreferences({super.key, required this.controller});

  @override
  State<RegionalFoodPreferences> createState() => _RegionalFoodPreferencesState();
}

class _RegionalFoodPreferencesState extends State<RegionalFoodPreferences> {
  List<SelectableFieldItem> primaryGoals = [
    SelectableFieldItem(
        icon: svgNorthIndian, dietType: "North Indian", isSelected: false),
    SelectableFieldItem(
        icon: svgSouthIndian, dietType: "South Indian", isSelected: false),
    SelectableFieldItem(
        icon: svgEastIndian, dietType: "East Indian", isSelected: false),
    SelectableFieldItem(
        icon: svgCentralIndian,
        dietType: "Central Indian",
        isSelected: false),
    SelectableFieldItem(
        icon: svgWestIndian,
        dietType: "West Indian",
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Regional Food Preferences",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                  TextStyle(fontSize: 26.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.medium)),
          20.sBH,
          Text("Choose the region that matches your\neveryday plate.",
              textAlign: TextAlign.center,
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                  TextStyle(fontSize: 16.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.regular)),
          _userDetailsForm()
        ],
      ),
    );
  }

  _userDetailsForm() {
    return Column(
      children: [
        10.sBH,
        SizedBox(
          height: 300.h,
          child: ListView.builder(
              itemCount: primaryGoals.length,
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = primaryGoals[index];
                return SelectableFieldWidget(selectableFieldItem: currentPref);
              }),
        ),
        10.sBH,

        const CustomDropdown(
          options: [
            "High blood pressure",
            "Low blood pressure",
            "High cholesterol",
            "PCOS/PCOD",
            "Thyroid (Hypo/Hyper)",
            "Anxiety / Stress",
            "Joint pain / Arthritis",
            "Sleep issues",
            "Other (Add manually)"
          ],
          selectedValue: 'Any existing conditions?',
        ),
        // 10.sBH,

        CustomButton(
            buttonText: "Continue",
            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
            buttonTextStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp),
                outfitFont: OutfitFontStyle.medium),
            width: 500.w,
            onPressed: (startLoading, stopLoading, btnState) {
              widget.controller.changeCurrentPage();
            },
            isDisabled: false,
            disableElevation: false),
      ],
    );
  }
}

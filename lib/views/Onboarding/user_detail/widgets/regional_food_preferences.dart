
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/selectable_field_widget.dart';
import 'dietary_prefernces.dart';

class RegionalFoodPreferences extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  RegionalFoodPreferences({super.key, required this.controller});

  @override
  State<RegionalFoodPreferences> createState() => _RegionalFoodPreferencesState();
}

class _RegionalFoodPreferencesState extends State<RegionalFoodPreferences> {
  List<SelectableFieldItem> regionalFoodPrefs = [
    SelectableFieldItem(
        icon: svgNorthIndian, type: "North Indian", isSelected: false),
    SelectableFieldItem(
        icon: svgSouthIndian, type: "South Indian", isSelected: false),
    SelectableFieldItem(
        icon: svgEastIndian, type: "East Indian", isSelected: false),
    SelectableFieldItem(
        icon: svgCentralIndian,
        type: "Central Indian",
        isSelected: false),
    SelectableFieldItem(
        icon: svgWestIndian,
        type: "West Indian",
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
          height: regionalFoodPrefs.length * 60.h,
          child: ListView.builder(
              itemCount: regionalFoodPrefs.length,
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = regionalFoodPrefs[index];
                return InkWell(
                    onTap: () {
                      widget.controller.addRegionalPreference(selectedItem: currentPref);
                    },
                    child: SelectableFieldWidget(selectableFieldItem: currentPref,
                      isSelected: widget.controller.selectedRegionalItem?.type ==
                          currentPref.type));
              }),
        ),
        // 10.sBH,

        // CustomButton(
        //     buttonText: "Continue",
        //     padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
        //     buttonTextStyle: AppTextStyle.outfitStyle(
        //         withTextStyle: TextStyle(fontSize: 16.sp),
        //         outfitFont: OutfitFontStyle.medium),
        //     width: 500.w,
        //     onPressed: (startLoading, stopLoading, btnState) {
        //       widget.controller.changeCurrentPage();
        //     },
        //     isDisabled: false,
        //     disableElevation: false),
      ],
    );
  }
}

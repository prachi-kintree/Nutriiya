import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';

import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import '../../../widget/selectable_field_widget.dart';
import 'dietary_prefernces.dart';

class UserActivityLevel extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  const UserActivityLevel({super.key, required this.controller});

  @override
  State<UserActivityLevel> createState() => _UserActivityLevelState();
}

class _UserActivityLevelState extends State<UserActivityLevel> {
  List<SelectableFieldItem> activityLevels = [
    SelectableFieldItem(
        icon: svgSitting, type: "Mostly Sitting", isSelected: false),
    SelectableFieldItem(
        icon: svgLightActive, type: "Lightly Active", isSelected: false),
    SelectableFieldItem(icon: svgActive, type: "Active", isSelected: false),
    SelectableFieldItem(icon: svgVeryActive, type: "Very Active", isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("What’s your activity level?",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 26.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.medium)),
          20.sBH,
          Text("Select the level that matches your lifestyle.",
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
    return SingleChildScrollView(
      child: Column(
        children: [
          10.sBH,
          ListView.builder(
              itemCount: activityLevels.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = activityLevels[index];
                return InkWell(
                  onTap: () {
                    widget.controller.addUserActivityLevel(selectedItem: currentPref);
                  },
                  child: SelectableFieldWidget(
                    selectableFieldItem: currentPref,
                    isSelected: widget.controller.selectedActivityLevel?.type ==
                        currentPref.type,
                  ),
                );
              }),
          10.sBH,

          const CustomDropdown(
            options: [
              "Dairy / Lactose",
              "Gluten / Wheat",
              "Eggs",
              "Shellfish",
              "Seafood",
              "Spices (e.g., red chili, mustard seeds)",
              "Soy",
              "Citrus fruits",
              "Other (Add manually)"
            ],
            selectedValue: 'Allergy',
          ),
          70.sBH,

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
      ),
    );
  }
}

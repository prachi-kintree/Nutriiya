import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import '../../../widget/selectable_field_widget.dart';

class DietaryPreferences extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  const DietaryPreferences({super.key, required this.controller});

  @override
  State<DietaryPreferences> createState() => _DietaryPreferencesState();
}

class _DietaryPreferencesState extends State<DietaryPreferences> {
  List<SelectableFieldItem> dietaryPrefs = [
    SelectableFieldItem(
        icon: svgVeganDiet, dietType: "Vegan", isSelected: false),
    SelectableFieldItem(icon: svgJainDiet, dietType: "Jain", isSelected: false),
    SelectableFieldItem(icon: svgKetoDiet, dietType: "Keto", isSelected: false),
    SelectableFieldItem(icon: svgVegDiet, dietType: "Veg", isSelected: false),
    SelectableFieldItem(
        icon: svgNonVegDiet, dietType: "Non-veg", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Dietary Preferences",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 26.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.medium)),
          20.sBH,
          Text("What do you usually eat?",
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
              itemCount: dietaryPrefs.length,
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = dietaryPrefs[index];
                return SelectableFieldWidget(selectableFieldItem: currentPref);
              }),
        ),
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

class SelectableFieldItem {
  final String icon;
  final String dietType;
  final bool isSelected;

  const SelectableFieldItem(
      {required this.icon, required this.dietType, required this.isSelected});
}

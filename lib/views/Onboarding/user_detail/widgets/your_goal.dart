import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import '../../../widget/selectable_field_widget.dart';
import 'dietary_prefernces.dart';

class YourGoal extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  const YourGoal({super.key, required this.controller});

  @override
  State<YourGoal> createState() => _YourGoalState();
}

class _YourGoalState extends State<YourGoal> {
  List<SelectableFieldItem> primaryGoals = [
    SelectableFieldItem(
        icon: svgLoseWeight, dietType: "Lose Weight", isSelected: false),
    SelectableFieldItem(
        icon: svgGainMuscle, dietType: "Gain Muscle", isSelected: false),
    SelectableFieldItem(
        icon: svgManageDiabetes, dietType: "Manage Diabetes", isSelected: false),
    SelectableFieldItem(
        icon: svgTrophy,
        dietType: "Maintain a healthy lifestyle",
        isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("What’s your goal?",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 26.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.medium)),
          20.sBH,
          Text("What’s your primary goal?",
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
          height: primaryGoals.length * 60.h,
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

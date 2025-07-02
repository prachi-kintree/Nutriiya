import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/viewmodel/login/user_basic_details_view_model.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/dietary_prefernces.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import '../../../widget/selectable_field_widget.dart';

class WhatsYourGoalScreen extends StatefulWidget {
  const WhatsYourGoalScreen({
    super.key,
  });

  @override
  State<WhatsYourGoalScreen> createState() => _DietaryPreferencesState();
}

class _DietaryPreferencesState extends State<WhatsYourGoalScreen> {
  List<SelectableFieldItem> primaryGoals = [
    SelectableFieldItem(
        icon: svgLoseWeight, dietType: "Lose Weight", isSelected: false),
    SelectableFieldItem(
        icon: svgGainMuscle, dietType: "Gain Muscle", isSelected: false),
    SelectableFieldItem(
        icon: svgManageDiabetes,
        dietType: "Manage Diabetes",
        isSelected: false),
    SelectableFieldItem(
        icon: svgTrophy,
        dietType: "Maintain a healthy lifestyle",
        isSelected: false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
          buttonText: "Continue",
          padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
          buttonTextStyle: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp),
              outfitFont: OutfitFontStyle.medium),
          width: 500.w,
          onPressed: (startLoading, stopLoading, btnState) {
            appNavigator.goBack();
          },
          isDisabled: true,
          disableElevation: false),
      appBar: const CommonAppBar(
        appBarTitle: "What’s your goal?",
      ),
      body: Container(
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text("Dietary Preferences",
              //     style: AppTextStyle.outfitStyle(
              //         withTextStyle:
              //             TextStyle(fontSize: 26.sp, color: Colors.black),
              //         outfitFont: OutfitFontStyle.medium)),
              // 20.sBH,
              Text("What’s your primary goal?",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 16.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular)),
              20.sBH,
              _userDetailsForm()
            ],
          ),
        ),
      ),
    );
  }

  _userDetailsForm() {
    return Column(
      children: [
        10.sBH,
        SizedBox(
          // height: 300.h,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
        // 80.sBH,
      ],
    );
  }
}

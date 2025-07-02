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

class DietaryScreen extends StatefulWidget {
  const DietaryScreen({
    super.key,
  });

  @override
  State<DietaryScreen> createState() => _DietaryPreferencesState();
}

class _DietaryPreferencesState extends State<DietaryScreen> {
  List<SelectableFieldItem> dietaryPrefs = [
    SelectableFieldItem(
        icon: svgVeganDiet, type: "Vegan", isSelected: false),
    SelectableFieldItem(icon: svgJainDiet, type: "Jain", isSelected: false),
    SelectableFieldItem(icon: svgKetoDiet, type: "Keto", isSelected: false),
    SelectableFieldItem(icon: svgVegDiet, type: "Veg", isSelected: false),
    SelectableFieldItem(
        icon: svgNonVegDiet, type: "Non-veg", isSelected: false),
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
        appBarTitle: 'Dietary Preferences',
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
              Text("What do you usually eat?",
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
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dietaryPrefs.length,
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = dietaryPrefs[index];
                return SelectableFieldWidget(selectableFieldItem: currentPref, isSelected: false,);
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
        // 80.sBH,
        // CustomButton(
        //     buttonText: "Continue",
        //     padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
        //     buttonTextStyle: AppTextStyle.outfitStyle(
        //         withTextStyle: TextStyle(fontSize: 16.sp),
        //         outfitFont: OutfitFontStyle.medium),
        //     width: 500.w,
        //     onPressed: (startLoading, stopLoading, btnState) {
        //       appNavigator.goBack();
        //     },
        //     isDisabled: true,
        //     disableElevation: false),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/dietary_prefernces.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import '../../../widget/selectable_field_widget.dart';

class JourneyProgressScreen extends StatefulWidget {
  const JourneyProgressScreen({
    super.key,
  });

  @override
  State<JourneyProgressScreen> createState() => _DietaryPreferencesState();
}

class _DietaryPreferencesState extends State<JourneyProgressScreen> {
  List<SelectableFieldItem> regionalFoodPrefs = [
    SelectableFieldItem(
        icon: svgNorthIndian,
        type: "Just getting started",
        isSelected: false),
    SelectableFieldItem(
        icon: svgSouthIndian,
        type: "Tried a few times before",
        isSelected: false),
    SelectableFieldItem(
        icon: svgEastIndian,
        type: "Lost weight in the past",
        isSelected: false),
    SelectableFieldItem(
        icon: svgCentralIndian,
        type: "Already on the journey",
        isSelected: false),
    SelectableFieldItem(
        icon: svgWestIndian, type: "Never tried before", isSelected: false),
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
        appBarTitle: "Where are you in your journey?",
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
              // Text("Choose the region that matches your\neveryday plate.",
              //     textAlign: TextAlign.center,
              //     style: AppTextStyle.outfitStyle(
              //         withTextStyle:
              //             TextStyle(fontSize: 16.sp, color: Colors.black),
              //         outfitFont: OutfitFontStyle.regular)),
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
              itemCount: regionalFoodPrefs.length,
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = regionalFoodPrefs[index];
                return SelectableFieldWidget(selectableFieldItem: currentPref, isSelected: false,);
              }),
        ),
        10.sBH,

        // 80.sBH,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../viewmodel/login/user_basic_details_view_model.dart';
import '../../../widget/drop_downs/custom_dropdown.dart';
import '../../../widget/selectable_field_widget.dart';
import 'dietary_prefernces.dart';

class GroceryBehaviour extends StatefulWidget {
  final UserBasicDetailsViewModel controller;

  const GroceryBehaviour({super.key, required this.controller});

  @override
  State<GroceryBehaviour> createState() => _GroceryBehaviourState();
}

class _GroceryBehaviourState extends State<GroceryBehaviour> {
  List<SelectableFieldItem> groceryBehaviors = [
    SelectableFieldItem(
        icon: svgOnlineShopping, type: "Online", isSelected: false),
    SelectableFieldItem(
        icon: svgOfflineShopping, type: "Offline", isSelected: false),
    SelectableFieldItem(
        icon: svgShoppingBucket, type: "A bit of both", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Tell us how you shop",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                  TextStyle(fontSize: 26.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.medium)),
          20.sBH,
          Text("Where do you usually buy your groceries?",
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
          height: groceryBehaviors.length * 60.h,
          child: ListView.builder(
              itemCount: groceryBehaviors.length,
              itemBuilder: (context, index) {
                SelectableFieldItem currentPref = groceryBehaviors[index];
                return InkWell(
                    onTap: () {
                      widget.controller.addGroceryPreference(selectedItem: currentPref);
                    },
                    child: SelectableFieldWidget(selectableFieldItem: currentPref,
                        isSelected: widget.controller.selectedGroceryItem?.type ==
                            currentPref.type));
              }),
        ),
        10.sBH,
        const CustomDropdown(
          options: [
            "Daily",
            "A few times a week",
            "Rarely",
            "I don’t cook",
            "It depends",
            "N/A"
          ],
          selectedValue: 'How often do you cook at home?',
        ),
        // 100.sBH,
        //
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

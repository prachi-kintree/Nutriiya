import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/CustomWidgets/Textfields/floating_clickable_field.dart';
import '../../../../utils/CustomWidgets/Textfields/floating_text_field.dart';
import '../../../../utils/CustomWidgets/Textfields/custom_tab_bar.dart';
import '../../../../utils/CustomWidgets/Textfields/sliding_tab_selector.dart';
import '../../../../utils/app_string/app_image_path.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../../viewmodel/login/user_basic_details_view_model.dart';

class UserBasicDetailForm extends StatefulWidget {
  final UserBasicDetailsViewModel controller;
  const UserBasicDetailForm({super.key, required this.controller});

  @override
  State<UserBasicDetailForm> createState() => _UserBasicDetailsFormState();
}

class _UserBasicDetailsFormState extends State<UserBasicDetailForm> {
  File? _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("User Profile Setup", style: AppTextStyle.outfitStyle(
              withTextStyle:
              TextStyle(fontSize: 26.sp, color: Colors.black),
              outfitFont: OutfitFontStyle.medium)),
          20.sBH,
          _userImage(),
          _userDetailsForm()
        ],
      ),
    );
  }

  _userImage() {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Main circular container
          Container(
            width: 60.h,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffEFECE8),
              border: Border.all(color: Colors.orange, width: 1),
            ),
            child: Padding(
              padding: _imageFile != null ? EdgeInsets.zero : EdgeInsets.only(top: 10.h),
              child: ClipOval(
                child: _imageFile != null
                    ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                )
                    : SvgPicture.asset(
                  svgUserImagePlaceholder,
                  // height: 100.h,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Camera icon at bottom right
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange),
                color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .new_bg_pink_color,
              ),
              child: SvgPicture.asset(
                svgCameraOrange,
                height: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userDetailsForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FloatingLabelTextField(
            floatingLabelText: "Enter Your Name",
            isPaddingThere: false,
          ),
          20.sBH,
          CustomIconTabBar(
            items: [
              CustomTabItem(iconPath: svgMaleIcon, label: 'Male'),
              CustomTabItem(iconPath: svgFemaleIcon, label: 'Female'),
            ],
            onChanged: (index) {
              // handle index change
            },
          ),
          20.sBH,
          FloatingClickableTextField(
              floatingLabelText: "floatingLabelText",
              isPaddingThere: false,
              textInputType: TextInputType.text,
              trailingIcon: Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 10.w),
                child: SvgPicture.asset(svgCalenderIcon),
              )),
          20.sBH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 230.w,
                child: FloatingLabelTextField(
                  floatingLabelText: "floatingLabelText",

                  isPaddingThere: false,
                  textInputType: TextInputType.text,
                ),
              ),
              10.sBW,
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: SlidingTabSelector(
                  width: 100.w,
                  height: 20.h,
                  padding: EdgeInsets.all(2.h),
                  options: const ['KG', 'LB'],
                  initialIndex: 0,
                  onChanged: (index) {
                    print("Selected index: $index");
                  },
                ),
              ),
            ],
          ),
          20.sBH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 230.w,
                child: FloatingLabelTextField(
                  floatingLabelText: "floatingLabelText",

                  isPaddingThere: false,
                  textInputType: TextInputType.text,
                ),
              ),
              10.sBW,
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: SlidingTabSelector(
                  width: 100.w,
                  height: 20.h,
                  padding: EdgeInsets.all(2.h),
                  options: const ['CM', 'FT'],
                  initialIndex: 0,
                  onChanged: (index) {
                    print("Selected index: $index");
                  },
                ),
              ),
            ],
          ),
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
      ),
    );
  }
}

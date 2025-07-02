import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../Injector/app_injector.dart';
import '../../../../translation/locale_keys.g.dart';
import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/CustomWidgets/Textfields/floating_clickable_field.dart';
import '../../../../utils/CustomWidgets/Textfields/floating_text_field.dart';
import '../../../../utils/CustomWidgets/Textfields/custom_tab_bar.dart';
import '../../../../utils/CustomWidgets/Textfields/sliding_tab_selector.dart';
import '../../../../utils/TextFieldValidator/fleld_validator.dart';
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
  DateTime? dateOfBirth;
  TextEditingController dateOfBirthController = TextEditingController();
  File? _imageFile;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              color: const Color(0xffEFECE8),
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
    return Column(
      children: [
        FloatingLabelTextField(
          floatingLabelText: "First Name",
          isPaddingThere: false,
          floatingLabelStyle: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 15.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .light_black_text_color),
              outfitFont: OutfitFontStyle.regular),
            textValidator: (val) {
              return getIt<FieldValidator>().isNotEmpty(
                  text: val,
                  message:
                  LocaleKeys.signup_first_name_error_empty.tr());
            }
        ),
        // 20.sBH,
        FloatingLabelTextField(
          floatingLabelText: "Last Name",
          isPaddingThere: false,
          floatingLabelStyle: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 15.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .light_black_text_color),
              outfitFont: OutfitFontStyle.regular),
          textValidator: (val) {
            return getIt<FieldValidator>().isNotEmpty(
                text: val,
                message:
                LocaleKeys.signup_last_name_error_empty.tr());
          },
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
            floatingLabelText: "Date of Birth",
            textController: dateOfBirthController,
            isPaddingThere: false,
            textInputType: TextInputType.text,
            onTextFieldClick: _pickDOB,
            trailingIcon: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 10.w),
              child: SvgPicture.asset(svgCalenderIcon),
            ),floatingLabelStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 15.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .light_black_text_color),
            outfitFont: OutfitFontStyle.regular),
            textValidator: (value) {
              return getIt<FieldValidator>().isNotEmpty(
                  text: value,
                  message: "Hey! You forgot to enter your date of birth");
            }),
        // 20.sBH,
        // FloatingLabelTextField(
        //         floatingLabelText: "floatingLabelText",
        //
        //         isPaddingThere: false,
        //         textInputType: TextInputType.text,
        //       ),
        //
        //     // 10.sBW,
        //     // Padding(
        //     //   padding: EdgeInsets.only(top: 18.h),
        //     //   child: SlidingTabSelector(
        //     //     width: 100.w,
        //     //     height: 20.h,
        //     //     padding: EdgeInsets.all(2.h),
        //     //     options: const ['KG', 'LB'],
        //     //     initialIndex: 0,
        //     //     onChanged: (index) {
        //     //       print("Selected index: $index");
        //     //     },
        //     //   ),
        //     // ),
        //
        //
        // // 20.sBH,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     SizedBox(width: 230.w,
        //       child: FloatingLabelTextField(
        //         floatingLabelText: "floatingLabelText",
        //
        //         isPaddingThere: false,
        //         textInputType: TextInputType.text,
        //       ),
        //     ),
        //     10.sBW,
        //     Padding(
        //       padding: EdgeInsets.only(top: 18.h),
        //       child: SlidingTabSelector(
        //         width: 100.w,
        //         height: 20.h,
        //         padding: EdgeInsets.all(2.h),
        //         options: const ['CM', 'FT'],
        //         initialIndex: 0,
        //         onChanged: (index) {
        //           print("Selected index: $index");
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  _pickDOB() async {
    DateTime? date = await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300.h,
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          // color: CupertinoColors.systemBackground.resolveFrom(context),
            color: Color(0xfff4f4f5),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                appNavigator.goBack();
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("Done",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14.sp,
                            color: ThemeManagerPlus.of<AppTheme>(context)
                                .currentTheme
                                .primaryGreen),
                        outfitFont: OutfitFontStyle.medium)),
              ),
            ),
            Text("Date of Birth",
                style: AppTextStyle.outfitStyle(
                    withTextStyle: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 22.sp,
                        color: ThemeManagerPlus.of<AppTheme>(context)
                            .currentTheme
                            .black),
                    outfitFont: OutfitFontStyle.medium)),
            20.sBH,
            Container(
              decoration: BoxDecoration(
                // color: CupertinoColors.systemBackground.resolveFrom(context),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15), topLeft: Radius.circular(15))),
              height: 180.h,
              child: CupertinoDatePicker(
                itemExtent: 30.h,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: dateOfBirth ?? DateTime(2000, 1, 1),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    print(newDate);
                    dateOfBirth = newDate;
                    print(dateOfBirth);

                    String formattedDate =
                    DateFormat('MMMM dd, yyyy').format(newDate);
                    dateOfBirthController.text = formattedDate;

                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
    print("Date picked $date");
    if (date != null) {
      String formattedDate =
      DateFormat('MMMM dd, yyyy').format(date);
      dateOfBirthController.text = formattedDate;
      // controller.captureDob(value: formattedDate);
      // setState(() {});
    }
  }
}

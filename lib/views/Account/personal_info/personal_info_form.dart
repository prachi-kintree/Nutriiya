import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import '../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../utils/CustomWidgets/Textfields/floating_clickable_field.dart';
import '../../../utils/CustomWidgets/Textfields/floating_text_field.dart';
import '../../../utils/app_string/app_image_path.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/app_bar/common_appbar.dart';
import '../../widget/drop_downs/custom_dropdown.dart';

class PersonalInformationForm extends StatelessWidget {
  const PersonalInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: "Personal Info"),
      backgroundColor: Colors.white,
      bottomSheet: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: CustomButton(
            buttonText: "Save",
            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
            buttonTextStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp),
                outfitFont: OutfitFontStyle.medium),
            width: 500.w,
            onPressed: (startLoading, stopLoading, btnState) {},
            isDisabled: false,
            disableElevation: false),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.sBH,
              // Profile Image
              const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3'), // Replace with real image
              ),
              12.sBH,
          
              _input(context),

            ],
          ),
        ),
      ),
    );
  }

  _input(context) {
    return Column(
      children: [
        FloatingLabelTextField(
          initialValue: "Raj",
          floatingLabelText: "First Name",
          isPaddingThere: false,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp),
              outfitFont: OutfitFontStyle.regular),
        ),
        FloatingLabelTextField(
          initialValue: "Shah",
          floatingLabelText: "Last Name",
          isPaddingThere: false,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp),
              outfitFont: OutfitFontStyle.regular),
        ),
        FloatingLabelTextField(
          initialValue: "9876543210",
          floatingLabelText: "Mobile Number",
          isPaddingThere: false,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp),
              outfitFont: OutfitFontStyle.regular),
        ),
        FloatingLabelTextField(
            initialValue: "rajshah@gmail.com",
            floatingLabelText: "Email",
            isPaddingThere: false,
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
            textStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp),
                outfitFont: OutfitFontStyle.regular)),
        20.sBH,
        // FloatingClickableTextField(
        //   initialValue: "Male",
        //   floatingLabelText: "Gender",
        //   isPaddingThere: false,
        //   contentPadding:
        //       EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        //   textStyle: AppTextStyle.outfitStyle(
        //       withTextStyle: TextStyle(fontSize: 16.sp, color: const Color(0xff131313)),
        //       outfitFont: OutfitFontStyle.regular),
        //     trailingIcon: Padding(
        //       padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 20.w),
        //       child: SvgPicture.asset(isOpen ? svgDropUp : svgDropDown, color: Color(0xff5E5F60)),
        //     ), textInputType: TextInputType.text,
        // ),
        CustomDropdown(options: const ["Male", "Female"],selectedValue: "Male",height: 40.h,trailingIconSize: 5.h),
        10.sBH,
        FloatingClickableTextField(
            initialValue: "05/07/1999",
            floatingLabelText: "Date of birth",
            isPaddingThere: false,
            textInputType: TextInputType.text,
            textStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .light_black_text_color),
                outfitFont: OutfitFontStyle.regular),
            trailingIcon: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 10.w),
              child: SvgPicture.asset(svgCalenderIcon),
            ))
      ],
    );
  }
}

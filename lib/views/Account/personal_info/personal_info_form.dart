import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import '../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../utils/CustomWidgets/Textfields/floating_clickable_field.dart';
import '../../../utils/CustomWidgets/Textfields/floating_text_field.dart';
import '../../../utils/app_string/app_image_path.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/app_bar/common_appbar.dart';
import '../../widget/drop_downs/custom_dropdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../../extension/extension_sized_box.dart';

class PersonalInformationForm extends StatefulWidget {
  const PersonalInformationForm({super.key});

  @override
  State<PersonalInformationForm> createState() => _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  DateTime selectedDate = DateTime.now();
  late TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    dobController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(selectedDate),
    );
  }

  void showCustomDateRangePicker(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        DateRangePickerController controller = DateRangePickerController();
        Color? primaryColor =
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.primaryGreen;

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            height: 400.h,
            child: Column(
              children: [
                // Header with close and save buttons
                Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black12, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          final DateTime? picked = controller.selectedDate;
                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                              dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
                            });
                          }
                          Navigator.pop(context);
                        },
                        child: Text('SAVE',
                          style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.white),
                            outfitFont: OutfitFontStyle.semibold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70.h,
                  color: primaryColor,
                  alignment: Alignment.center,
                  child: Text("SELECTED DATE",
                    style: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(fontSize: 18.sp, color: Colors.white, letterSpacing: 1.2),
                      outfitFont: OutfitFontStyle.semibold,
                    ),
                  ),
                ),
                Expanded(
                  child: SfDateRangePicker(
                    controller: controller,
                    selectionMode: DateRangePickerSelectionMode.single,
                    selectionColor: primaryColor,
                    todayHighlightColor: primaryColor,
                    allowViewNavigation: true,
                    showNavigationArrow: true,
                    view: DateRangePickerView.month,
                    minDate: DateTime(2000),
                    maxDate: DateTime(2100),
                    headerHeight: 30.h,
                    headerStyle: DateRangePickerHeaderStyle(
                      textStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(fontSize: 17.sp, color: Colors.black.withOpacity(0.7)),
                        outfitFont: OutfitFontStyle.semibold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      todayTextStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(fontSize: 14.sp, color: primaryColor),
                        outfitFont: OutfitFontStyle.semibold,
                      ),
                      textStyle: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular,
                      ),
                    ),
                  ),
                ),
                10.sBH,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: "Personal Info"),
      backgroundColor: Colors.white,
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomButton(
          buttonText: "Save",
          padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
          buttonTextStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 16.sp),
            outfitFont: OutfitFontStyle.medium,
          ),
          width: 500.w,
          onPressed: (startLoading, stopLoading, btnState) {
            Navigator.of(context).pop();
          },
          isDisabled: false,
          disableElevation: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.sBH,
              const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
              12.sBH,
              _input(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(BuildContext context) {
    return Column(
      children: [
        FloatingLabelTextField(
          initialValue: "Raj",
          floatingLabelText: "First Name",
          isPaddingThere: false,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 16.sp),
            outfitFont: OutfitFontStyle.regular,
          ),
        ),
        FloatingLabelTextField(
          initialValue: "Shah",
          floatingLabelText: "Last Name",
          isPaddingThere: false,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 16.sp),
            outfitFont: OutfitFontStyle.regular,
          ),
        ),
        FloatingLabelTextField(
          initialValue: "9876543210",
          floatingLabelText: "Mobile Number",
          isPaddingThere: false,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 16.sp),
            outfitFont: OutfitFontStyle.regular,
          ),
        ),
        FloatingLabelTextField(
          initialValue: "rajshah@gmail.com",
          floatingLabelText: "Email",
          isPaddingThere: false,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(fontSize: 16.sp),
            outfitFont: OutfitFontStyle.regular,
          ),
        ),
        20.sBH,
        CustomDropdown(
          options: const ["Male", "Female"],
          selectedValue: "Male",
          height: 40.h,
          trailingIconSize: 5.h,
        ),
        10.sBH,
        FloatingClickableTextField(
          textController: dobController,
          floatingLabelText: "Date of birth",
          isPaddingThere: false,
          textInputType: TextInputType.text,
          onTextFieldClick: () {
            showCustomDateRangePicker(context);
          },
          textStyle: AppTextStyle.outfitStyle(
            withTextStyle: TextStyle(
              fontSize: 16.sp,
              color: ThemeManagerPlus.of<AppTheme>(context).currentTheme.light_black_text_color,
            ),
            outfitFont: OutfitFontStyle.regular,
          ),
          trailingIcon: Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 2.h, right: 10.w),
            child: SvgPicture.asset(svgCalenderIcon,width: 22.w,height: 22.h,),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }
}

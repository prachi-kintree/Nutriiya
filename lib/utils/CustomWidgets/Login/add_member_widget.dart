import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';


import '../../../Injector/app_injector.dart';
import '../../../translation/locale_keys.g.dart';
import '../../TextFieldValidator/fleld_validator.dart';
import '../../app_string/app_placeholder_text.dart';
import '../../app_string/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../../theme/theme_model.dart';
import '../Button/custom_button.dart';
import '../Textfields/floating_text_field.dart';

class AddMemberWidget extends StatefulWidget {
  // final FamilyMember memberAddedFor;

  AddMemberWidget({super.key,
    // required this.memberAddedFor
  });

  @override
  State<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   widget.memberAddedFor == FamilyMember.father
                      //       ? fatherInfoHead
                      //       : motherInfoHead,
                      //   textAlign: TextAlign.center,
                      //   style: AppTextStyle.figTreeStyle(
                      //       withTextStyle: TextStyle(
                      //           color: ThemeManagerPlus.of<AppTheme>(context)
                      //               .currentTheme
                      //               .black,
                      //           fontSize: 24.sp),
                      //       figTreeFont: FigTreeFontStyle.semibold),
                      // ),
                    ],
                  ),
                ),
                12.sBH,
                // Text(
                //   widget.memberAddedFor == FamilyMember.father
                //       ? fatherInfoSubHead
                //       : motherInfoSubHead,
                //   textAlign: TextAlign.center,
                //   style: AppTextStyle.figTreeStyle(
                //       withTextStyle: TextStyle(
                //           color: ThemeManagerPlus.of<AppTheme>(context)
                //               .currentTheme
                //               .black,
                //           fontSize: 12.sp),
                //       figTreeFont: FigTreeFontStyle.regular),
                // ),
                40.sBH,
                // Consumer<AddMemberViewModel>(
                //     builder: (context, controller, child) {
                //   return FloatingLabelTextField(
                //       // initialValue: controller.firstName,
                //       textController: fNameController,
                //       textStyle: AppTextStyle.figTreeStyle(
                //           withTextStyle: TextStyle(
                //               color: ThemeManagerPlus.of<AppTheme>(context)
                //                   .currentTheme
                //                   .black,
                //               fontSize: 15.sp),
                //           figTreeFont: FigTreeFontStyle.bold),
                //       enabledBorderWidth: 3,
                //       contentPadding: EdgeInsets.symmetric(
                //           vertical: 12.h, horizontal: 15.w),
                //       floatingLabelText: plcFirstName,
                //       textInputType: TextInputType.name,
                //       isRequired: true,
                //       textValidator: (userInput) {
                //         return getIt<FieldValidator>().validateName(
                //             message: "Enter Valid First Name", text: userInput);
                //       },
                //       onValueChanged: (value) {
                //         controller.captureFirstName(userFirstName: value);
                //       });
                // }),
                SizedBox(
                  height: 20.h,
                ),
                // Consumer<AddMemberViewModel>(
                //     builder: (context, controller, child) {
                //   return FloatingLabelTextField(
                //     // initialValue: controller.lastName,
                //     textController: lNameController,
                //     textStyle: AppTextStyle.figTreeStyle(
                //         withTextStyle: TextStyle(
                //             color: ThemeManagerPlus.of<AppTheme>(context)
                //                 .currentTheme
                //                 .black,
                //             fontSize: 15.sp),
                //         figTreeFont: FigTreeFontStyle.bold),
                //     enabledBorderWidth: 3,
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                //     floatingLabelText: plcLastName,
                //     textInputType: TextInputType.name,
                //     isRequired: true,
                //     onValueChanged: (value) {
                //       controller.captureLastName(userLastName: value);
                //     },
                //     textValidator: (userInput) {
                //       return getIt<FieldValidator>().validateName(
                //           message: "Enter Valid Last Name", text: userInput);
                //     },
                //   );
                // }),
                SizedBox(
                  height: 20.h,
                ),
                // Consumer<AddMemberViewModel>(
                //     builder: (context, controller, child) {
                //   return FloatingLabelTextField(
                //     // initialValue: controller.fatherName,
                //     textController: fatherNameController,
                //     textStyle: AppTextStyle.figTreeStyle(
                //         withTextStyle: TextStyle(
                //             color: ThemeManagerPlus.of<AppTheme>(context)
                //                 .currentTheme
                //                 .black,
                //             fontSize: 15.sp),
                //         figTreeFont: FigTreeFontStyle.bold),
                //     enabledBorderWidth: 3,
                //     textValidator: (userInput) {
                //       if(userInput?.isNotEmpty ?? false) {
                //         return getIt<FieldValidator>().validateName(
                //             message: "Enter valid ${widget.memberAddedFor == FamilyMember.father ? "Father" : "Mother"}'s Father Name", text: userInput);
                //       }
                //       return null;
                //     },
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                //     floatingLabelText:
                //         "${widget.memberAddedFor == FamilyMember.father ? "Father" : "Mother"}'s Father Name",
                //     textInputType: TextInputType.name,
                //     isRequired: false,
                //     onValueChanged: (value) {
                //       controller.captureFatherName(userFathertName: value);
                //     },
                //   );
                // }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.w),
            // child: Consumer<AddMemberViewModel>(
            //     builder: (context, controller, child) {
            //   return CustomButton(
            //     isDisabled: false,
            //     width: 500.w,
            //     height: 45.h,
            //     buttonText: LocaleKeys.button_continue.tr(),
            //     onPressed: (startLoading, stopLoading, btnState) async {
            //       startLoading();
            //       if (_formKey.currentState?.validate() ?? false) {
            //         await controller.validateDetailsAndAddData(
            //             startLoading: startLoading,
            //             stopLoading: stopLoading,
            //             context: context);
            //         // await context
            //         //     .read<UserBasicDetailViewModel>()
            //         //     .validateDetailsAndAddData(
            //         //         startLoading: startLoading,
            //         //         stopLoading: stopLoading,
            //         //         context: context);
            //         fNameController.clear();
            //         lNameController.clear();
            //         fatherNameController.clear();
            //         controller.changeCurrentPageAndClearData();
            //         stopLoading();
            //       } else {
            //         stopLoading();
            //       }
            //     },
            //     buttonTextStyle: AppTextStyle.figTreeStyle(
            //       withTextStyle: TextStyle(
            //           color: ThemeManagerPlus.of<AppTheme>(context)
            //               .currentTheme
            //               .white,
            //           fontSize: 18.sp),
            //       figTreeFont: FigTreeFontStyle.semibold,
            //     ),
            //   );
            // }),
          ),
        ],
      ),
    );
  }
}

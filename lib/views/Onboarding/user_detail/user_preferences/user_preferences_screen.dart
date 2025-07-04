import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/activity_level.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/dietary_prefernces.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/grocery_behavior.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/personalization_calories_calculation_screen.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/regional_food_preferences.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/user_basic_details_form.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/your_goal.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/your_height.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/your_target_weight.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/your_weight.dart';
import 'package:nutriya/views/widget/bottom_sheets/nudge_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../RouteManager/app_routes.dart';
import '../../../../RouteManager/navigator_service.dart';
import '../../../../translation/locale_keys.g.dart';
import '../../../../utils/CustomWidgets/Button/custom_button.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../../../viewmodel/login/user_basic_details_view_model.dart';

import '../../../widget/gradient_scaffold.dart';

class UserPreferencesScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UserPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [CustomGradientBackground(), CommonBase(formKey: formKey)],
        ),
      ),
      bottomSheet: Consumer<UserBasicDetailsViewModel>(
          builder: (context, controller, child) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
              child: CustomButton(
                  buttonText: "Continue",
                  padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                  buttonTextStyle: AppTextStyle.outfitStyle(
                      withTextStyle: TextStyle(fontSize: 16.sp),
                      outfitFont: OutfitFontStyle.medium),
                  width: 500.w,
                  onPressed: (startLoading, stopLoading, btnState) {
                    if (formKey.currentState?.validate() ?? false) {
                      // if (controller.prefsCurrentPage == 3) {
                      //   appNavigator.pushNamed(routeBmiReport);
                      // } else {
                        controller.changePrefsCurrentPage();
                      // }
                    }

                    // widget.controller.changeCurrentPage();
                  },
                  isDisabled: false,
                  disableElevation: false),
            );
          }),
    );
  }
}

class CommonBase extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const CommonBase({super.key, required this.formKey});

  @override
  State<CommonBase> createState() => _CommonBaseState();
}

class _CommonBaseState extends State<CommonBase> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserBasicDetailsViewModel>(
        builder: (context, controller, child) {
          return Column(
            children: [
              // SvgPicture.asset(svgBackArrow, height:20.h),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 80.w),
                child: LinearProgressBar(
                  maxSteps: 6,
                  progressType: LinearProgressBar.progressTypeLinear,
                  minHeight: 3.h,
                  currentStep: controller.prefsCurrentPage,
                  progressColor: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .secondaryOrange,
                  backgroundColor: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .lightSecondary,
                  borderRadius: BorderRadius.circular(20.h),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                    color:
                    ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child:
                  Form(key: widget.formKey, child: _getCurrentBody(controller)),
                ),
              )
            ],
          );
        });
  }

  Widget _getCurrentBody(controller) {
    switch (controller.prefsCurrentPage) {
      case 1:
        return YourGoal(controller: controller);

      case 2:
        return YourTargetWeight(controller: controller);
      case 3:
        return UserActivityLevel(controller: controller);
      case 4:
        return DietaryPreferences(controller: controller);
      case 5:
        return RegionalFoodPreferences(controller: controller);
      case 6:
        return GroceryBehaviour(controller: controller);

    // return NudgeBottomSheet(
    //   bottomSheetType: BottomSheetType.statustracker,
    //   isThumps: false,
    //   primaryGoals: [
    //     SelectableFieldItem(
    //         icon: svgNorthIndian,
    //         dietType: "I want to feel healthier",
    //         isSelected: false),
    //     SelectableFieldItem(
    //         icon: svgSouthIndian,
    //         dietType: "I want to feel more confident",
    //         isSelected: false),
    //     SelectableFieldItem(
    //         icon: svgEastIndian,
    //         dietType: "I want more energy",
    //         isSelected: false),
    //     SelectableFieldItem(
    //         icon: svgCentralIndian,
    //         dietType: "I want to reach a personal goal",
    //         isSelected: false),
    //     SelectableFieldItem(
    //         icon: svgWestIndian,
    //         dietType: "Something else",
    //         isSelected: false),
    //   ],
    //   title: "What’s your real reason for this journey?",
    // );
      default:
        return _buildBodyContent(
            LocaleKeys.final_step.tr(), const Key("finalStep"));
    }
  }

  Widget _buildBodyContent(String text, Key key) {
    return Center(
      key: key,
      child: Text(text),
    );
  }
}
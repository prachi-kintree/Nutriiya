import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/dietary_prefernces.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/grocery_behavior.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/regional_food_preferences.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/user_basic_details_form.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/your_goal.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/your_target_weight.dart';
import 'package:nutriya/views/widget/bottom_sheets/nudge_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../translation/locale_keys.g.dart';
import '../../../utils/theme/theme_model.dart';
import '../../../viewmodel/login/user_basic_details_view_model.dart';
import '../../widget/gradient_scaffold.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [CustomGradientBackground(), CommonBase()],
        ),
      ),
    );
  }
}

class CommonBase extends StatefulWidget {
  const CommonBase({super.key});

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
              currentStep: controller.currentPage,
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
              child: _getCurrentBody(controller),
            ),
          )
        ],
      );
    });
  }

  Widget _getCurrentBody(controller) {
    switch (controller.currentPage) {
      case 1:
        return UserBasicDetailForm(controller: controller);
      case 2:
        return DietaryPreferences(controller: controller);
      case 3:
        return YourGoal(controller: controller);
      case 4:
        return YourTargetWeight(controller: controller);
      case 5:
        return RegionalFoodPreferences(controller: controller);
      case 6:
        return const GroceryBehaviour();
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

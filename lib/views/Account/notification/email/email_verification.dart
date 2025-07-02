import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/utils/CustomWidgets/custom_widget_barrel.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/views/Account/notification/selected_mode_settings.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../../utils/CustomWidgets/Textfields/floating_text_field.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';
import '../../widgets/custom_list_tile.dart';
import 'otp_verify.dart';


class EmailRegistration extends StatefulWidget {
  const EmailRegistration({super.key});

  @override
  State<EmailRegistration> createState() => _EmailRegistrationState();
}

class _EmailRegistrationState extends State<EmailRegistration> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyBoardAwareWidget(
      child: Scaffold(
        appBar: const CommonAppBar(appBarTitle: "Email"),
        body: Stack(
          children: [
            const CommonGradient(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      boxShadow: AppDecoration.commonBoxShadow()
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Text(
                          "Enter your email to get the latest from Nutriya — updates, tips, exclusive offers & more.",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(fontSize: 14.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .light_black_text_color),
                              outfitFont: OutfitFontStyle.regular),
                        ),
                        // const SizedBox(height: 20),
                        FloatingLabelTextField(
                          isPaddingThere: false,
                          // initialValue: "",
                          floatingLabelStyle: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(fontSize: 15.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .light_black_text_color),
                              outfitFont: OutfitFontStyle.regular),
                          textStyle: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(fontSize: 16.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .light_black_text_color),
                              outfitFont: OutfitFontStyle.regular),

                            textInputType: TextInputType.emailAddress, floatingLabelText: 'Email Address',

                        )
                      ],
                    ),
                  ),

                  Spacer(),
                  CustomButton(
                      buttonText: "Continue",
                      padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                      buttonTextStyle: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(fontSize: 16.sp),
                          outfitFont: OutfitFontStyle.medium),
                      width: 500.w,
                      onPressed: (startLoading, stopLoading, btnState) {
                        appNavigator.push(MaterialPageRoute(builder: (context) => OtpEmailVerification()));
                      },
                      isDisabled: false,
                      disableElevation: false)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

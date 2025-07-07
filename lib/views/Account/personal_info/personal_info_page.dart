import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/styles/app_decoration.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';
import '../../widget/app_bar/common_appbar.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CommonAppBar(appBarTitle: "Personal Info"),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.sBH,
            // Profile Image
            CircleAvatar(
              radius: 45,
              backgroundColor: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .primaryGreen,
              backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=3'), // Replace with real image
            ),

            12.sBH,
            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                appNavigator.pushNamed(routePersonalInfoForm);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                     EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
              ),
              iconAlignment: IconAlignment.end,
              icon: SvgPicture.asset(
                svgForwardArrow,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              label: Text("Edit Profile",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 14.sp, color: Colors.white),
                      outfitFont: OutfitFontStyle.medium)),
            ),

            24.sBH,

            // Info Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: AppDecoration.commonBoxShadow()
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InfoText(label: "Full name", value: "Raj Shah"),
                    16.sBH,
                    const InfoText(label: "Phone Number", value: "9876543210"),
                    16.sBH,
                    const InfoText(label: "Email", value: "rajshah@gmail.com"),
                    16.sBH,
                    const Row(
                      children: [
                        Expanded(
                            child: InfoText(label: "Gender", value: "Male")),
                        Spacer(),
                        Expanded(
                            child: InfoText(
                                label: "Date of Birth", value: "05/07/1999")),
                      ],
                    ),
                    16.sBH,
                    const Row(
                      children: [
                        Expanded(child: InfoText(label: "Weight", value: "90")),
                        Spacer(),
                        Expanded(
                            child: InfoText(label: "Height", value: "167")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String label;
  final String value;

  const InfoText({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = AppTextStyle.outfitStyle(
        withTextStyle: TextStyle(
            fontSize: 14.sp,
            color: ThemeManagerPlus.of<AppTheme>(context)
                .currentTheme
                .subtitleGrey),
        outfitFont: OutfitFontStyle.regular);
    final TextStyle valueStyle = AppTextStyle.outfitStyle(
        withTextStyle:
        TextStyle(fontSize: 18.sp, color: ThemeManagerPlus.of<AppTheme>(context)
            .currentTheme
            .light_black_text_color),
        outfitFont: OutfitFontStyle.regular);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: labelStyle),
        const SizedBox(height: 4),
        Text(value,
            style: valueStyle),
      ],
    );
  }
}

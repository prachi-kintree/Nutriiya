import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/common_gradient_scaffold.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';

class AppLanguageScreen extends StatefulWidget {
  const AppLanguageScreen({super.key});

  @override
  State<AppLanguageScreen> createState() => _AppLanguageScreenState();
}

class _AppLanguageScreenState extends State<AppLanguageScreen> {
  String selectedLanguage = "English";

  final List<String> languages = [
    "English",
    "Hindi",
    "Marathi",
    "Gujrati",
    "Telugu",
    "Tamil",
    "Urdu",
    "Punjabi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: "App Languages",
      ),
      body: Stack(
        children: [
          const CommonGradient(),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: AppDecoration.commonBoxShadow(),
                  color: ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .white),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: languages.length,
                separatorBuilder: (_, __) => Divider(height: 0.2, color: ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .subtitleGrey),
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  final isSelected = selectedLanguage == lang;

                  return ListTile(
                    title: Text(lang,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 14.sp,
                                color: isSelected
                                    ? ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .primaryGreen
                                    : ThemeManagerPlus.of<AppTheme>(context)
                                        .currentTheme
                                        .light_black_text_color),
                            outfitFont: OutfitFontStyle.regular)),
                    contentPadding: EdgeInsets.zero,
                    trailing: isSelected
                        ? Icon(Icons.check, color: ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .primaryGreen, size: 14.h)
                        : null,
                    onTap: () => setState(() => selectedLanguage = lang),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

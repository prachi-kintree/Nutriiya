import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import '../../../../Injector/app_injector.dart';

import '../../../../utils/LocalData/local_data_manager.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../../utils/theme/theme_model.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  String currentLanguage = "en";
  LanguageModel? currentSelected;
  List<LanguageModel> languages = [
    LanguageModel(
      languageName: "English",
      circleBgColor: "#ff7043",
      languageCode: "en",
      description: "English",
      symbol: "E",
    ),
    LanguageModel(
      languageName: "हिन्दी",
      circleBgColor: "#ff5722",
      languageCode: "hi",
      description: "Hindi",
      symbol: "ह",
    ),
    LanguageModel(
      languageName: "मराठी",
      circleBgColor: "#60849e",
      languageCode: "mr",
      description: "Marathi",
      symbol: "म",
    ),
    LanguageModel(
      languageName: "ગુજરાતી",
      circleBgColor: "#d32f2f",
      languageCode: "gu",
      description: "Gujarati",
      symbol: "ગુ",
    ),

    LanguageModel(
      languageName: "తెలుగు",
      circleBgColor: "#7cc7c0",
      languageCode: "te",
      description: "Telugu",
      symbol: "తె",
    ),

    LanguageModel(
      languageName: "தமிழ்",
      circleBgColor: "#b3cc3c",
      languageCode: "ta",
      description: "Tamil",
      symbol: "த",
    ),
    LanguageModel(
      languageName: "اردو",
      circleBgColor: "#839946",
      languageCode: "ur",
      description: "Urdu",
      symbol: "او",
    ),
    LanguageModel(
      languageName: "ਪੰਜਾਬੀ",
      circleBgColor: "#839946",
      languageCode: "pa",
      description: "Punjabi",
      symbol: "ਪੰ",
    ),

  ];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      currentLanguage = getIt<LocalDataManager>().userLang;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("CURRENT LOCALE ${context.locale}");
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SizedBox(
            height: 350.h,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: languages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 5,
                childAspectRatio: 0.9, // Adjust as needed
              ),
              itemBuilder: (context, index) {
                final language = languages[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSelected = language;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentSelected == language ? ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .primaryGreen: Colors.transparent,
                          border: Border.all(width: 4,color: currentSelected == language ? ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .primaryGreen!:  Colors.grey)
                        ),

                        // backgroundColor: hexToColor(language.circleBgColor),
                        child: Text(
                          language.symbol,
                          style: AppTextStyle.outfitStyle(
                              withTextStyle:
                              TextStyle(fontSize: 20.sp, color: currentSelected == language ? Colors.white:Colors.black),
                              outfitFont: OutfitFontStyle.bold),
                        ),
                      ),
                      10.sBH,
                      Text(
                        language.languageName,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                            TextStyle(fontSize: 15.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.medium),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class LanguageModel {
  final String languageName;
  final String circleBgColor;
  final String languageCode;
  final String description;
  final String symbol;

  LanguageModel(
      {required this.languageName,
        required this.circleBgColor,
        required this.languageCode,
        required this.description,
        required this.symbol});
}

// context.setLocale(Locale(currentLanguage));
// getIt<LocalDataManager>()
// .setUserSelectedLanguage(currentLanguage);
// // context.read<ProfileViewModel>().setUserLanguage(currentLanguage);
// // RestartApp.restartApp(appNavigator.navigationContext!);
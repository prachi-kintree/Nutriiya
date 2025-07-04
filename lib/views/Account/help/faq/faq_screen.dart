import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';

class FaqHelpScreen extends StatelessWidget {
  const FaqHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          appBarTitle: 'FAQ',
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            gradient: AppDecoration().scaffoldGradient,
          ),
          child: Column(
            spacing: 10.h,
            children: [
              15.sBH,
              const CustomExpandTile(
                title: "What is Nutria?",
                subtitle:
                    "Nutria is your AI-powered nutrition guide designed for Indian lifestyles or all lifestyles",
              ),
              const CustomExpandTile(
                title: "How does Nutria work?",
                subtitle:
                    "Nutria is your AI-powered nutrition guide designed for Indian lifestyles or all lifestyles",
              ),
              const CustomExpandTile(
                title: "Who can use Nutria?",
                subtitle:
                    "Nutria is your AI-powered nutrition guide designed for Indian lifestyles or all lifestyles",
              ),
              const CustomExpandTile(
                title: "Is Nutria free to use?",
                subtitle:
                    "Nutria is your AI-powered nutrition guide designed for Indian lifestyles or all lifestyles",
              ),
              const CustomExpandTile(
                title: "Lorem Ipsum Is simply dummy text?",
                subtitle:
                    "Nutria is your AI-powered nutrition guide designed for Indian lifestyles or all lifestyles",
              ),
            ],
          ),
        ));
  }
}

class CustomExpandTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomExpandTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppDecoration.addShadow(),
          borderRadius: BorderRadius.circular(12.0.r)),
      child: ExpansionTile(
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
        minTileHeight: 45.h,
        collapsedBackgroundColor: Colors.white,
        collapsedIconColor: Colors.black,
        iconColor: Colors.black,
        textColor: Colors.black,
        title: Text(title,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular)),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.0.w),
        children: [
          const Divider(),
          5.sBH,
          Text(
            subtitle,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular),
          ),
          5.sBH,
        ],
      ),
    );
  }
}

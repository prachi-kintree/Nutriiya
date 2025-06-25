import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/viewmodel/dashboard/history/history_viewmodeld.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          20.sBH,
          const CommonAppBar(
            isBackbutton: false,
            appBarTitle: 'History',
          ),
          20.sBH,
          SizedBox(
            height: 30.h,
            child: Consumer<HistoryViewmodeld>(
              builder: (context, historyController, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CurrentCategoryBody(
                      ontap: () {
                        historyController.setCurrentCategory(
                            historyController.category?[index] ?? '',
                            // historyController.category?[index].id ?? 0,
                            index.toString());
                      },
                      categoryname: historyController.category[index] ?? '',
                      isSelected: index ==
                              int.parse(historyController.currentCategoryIndex)
                          ? true
                          : false,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CurrentCategoryBody extends StatelessWidget {
  final String categoryname;
  final bool isSelected;
  final VoidCallback ontap;
  const CurrentCategoryBody({
    super.key,
    required this.categoryname,
    required this.isSelected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        padding: EdgeInsets.only(bottom: 3.h, left: 20.w, right: 20.w),
        height: 31.h,
        decoration: BoxDecoration(
            color: isSelected
                ? ThemeManagerPlus.of<AppTheme>(context)
                    .currentTheme
                    .primaryGreen
                : ThemeManagerPlus.of<AppTheme>(context).currentTheme.white,
            border: Border.all(
                width: 1.h,
                color: isSelected
                    ? ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .transparent_color!
                    : ThemeManagerPlus.of<AppTheme>(context)
                        .currentTheme
                        .primaryGreen!),
            borderRadius: BorderRadius.circular(30.0.r)),
        child: Text(
          categoryname,
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(
                  fontSize: 15.h,
                  color: isSelected
                      ? ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .white
                      : ThemeManagerPlus.of<AppTheme>(context)
                          .currentTheme
                          .primaryGreen),
              outfitFont: OutfitFontStyle.regular),
        ),
      ),
    );
  }
}

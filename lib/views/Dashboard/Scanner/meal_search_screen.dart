import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/food_logger_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:nutriya/views/widget/search_bar/common_search_bar.dart';
import 'package:provider/provider.dart';

class MealSearchScreen extends StatefulWidget {
  const MealSearchScreen({super.key});

  @override
  State<MealSearchScreen> createState() => _MealSearchScreenState();
}

class _MealSearchScreenState extends State<MealSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size(1.sw, 45.h),
          child: CommonAppBar(
            appBarTitle:
                " Add ${context.read<FoodLoggerViewmodel>().currentMeal}",
            isCancelbutton: false,
            isCustomCallback: false,
            // onTap: () {
            //   // appNavigator.goBack();
            //   appNavigator.goBack();
            //   appNavigator.goBack();
            // },
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Consumer<MealSearchScreenViewmodel>(
          builder: (context, mealSearchCont, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sBH,
                CommonSearchBar(
                    searchController: mealSearchCont.searchMealController,
                    onChanged: (value) {
                      mealSearchCont.searchMealOnChange(value);
                    },
                    onTap: () {},
                    padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20.w)),
                    leading: Icon(
                      CupertinoIcons.search,
                      size: 25.h,
                      // color: const Color(0xff42A004),
                      color: Colors.grey,
                    ),
                    hintText: "Search for food",
                    hintStyle: WidgetStateProperty.all(AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 18.sp, color: Colors.black54),
                        outfitFont: OutfitFontStyle.regular)),
                    keyboardType: TextInputType.text,
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),

                    // textStyle: WidgetStateProperty.all(TextStyle()),
                    trailing: <Widget>[
                      InkWell(
                          onTap: () {
                            mealSearchCont.clearSearch();
                          },
                          child: SvgPicture.asset(svgCancel))
                    ],
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0xFFD9D9D9))),
                20.sBH,
                Text(
                  mealSearchCont.isMealSearching ? "Best Match" : "Suggestions",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 18.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular),
                ),
                20.sBH,
                mealSearchCont.isMealSearching
                    ? SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              mealSearchCont.filteredMealSuggestions.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                appNavigator.pushNamed(routeFoodCart);
                                mealSearchCont.selectFood(mealSearchCont
                                    .filteredMealSuggestions[index]);
                              },
                              child: Container(
                                height: 60.h,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x1A7D7D7D),
                                        offset: Offset(1, 0),
                                        blurRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Color(0x177D7D7D),
                                        offset: Offset(4, 0),
                                        blurRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0D7D7D7D),
                                        offset: Offset(8, 0),
                                        blurRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Color(0x037D7D7D),
                                        offset: Offset(15, 0),
                                        blurRadius: 2,
                                      ),
                                      BoxShadow(
                                        color: Color(0x037D7D7D),
                                        offset: Offset(4, 0),
                                        blurRadius: 2,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12.0.r),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          mealSearchCont
                                              .filteredMealSuggestions[index]
                                              .foodname,
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.regular),
                                        ),
                                        Text(
                                          "${mealSearchCont.filteredMealSuggestions[index].calories.round()} cal, ${mealSearchCont.filteredMealSuggestions[index].serving.round()} qty",
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.light),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(svgAddButtonCircle)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(
                        // height: 310.h,
                        decoration: BoxDecoration(
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Color(0x0F000000), // black at ~12% opacity
                            //     offset: Offset(0, 4), // subtle drop
                            //     blurRadius: 12,
                            //   ),
                            // ],
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1A7D7D7D),
                                offset: Offset(1, 0),
                                blurRadius: 2,
                              ),
                              BoxShadow(
                                color: Color(0x177D7D7D),
                                offset: Offset(4, 0),
                                blurRadius: 2,
                              ),
                              BoxShadow(
                                color: Color(0x0D7D7D7D),
                                offset: Offset(8, 0),
                                blurRadius: 2,
                              ),
                              BoxShadow(
                                color: Color(0x037D7D7D),
                                offset: Offset(15, 0),
                                blurRadius: 2,
                              ),
                              BoxShadow(
                                color: Color(0x037D7D7D),
                                offset: Offset(4, 0),
                                blurRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12.0.r),
                            color: Colors.white),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mealSearchCont.mealSuggestions.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                appNavigator.pushNamed(routeFoodCart);
                                mealSearchCont.selectFood(
                                    mealSearchCont.mealSuggestions[index]);
                              },
                              child: Container(
                                height: 60.h,
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                    border: !(index ==
                                            mealSearchCont
                                                    .mealSuggestions.length -
                                                1)
                                        ? const Border(
                                            bottom: BorderSide(
                                                color: Colors.black12))
                                        : null),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          mealSearchCont
                                              .mealSuggestions[index].foodname,
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.regular),
                                        ),
                                        Text(
                                          "${mealSearchCont.mealSuggestions[index].calories.round()} cal, ${mealSearchCont.mealSuggestions[index].serving.round()} qty",
                                          style: AppTextStyle.outfitStyle(
                                              withTextStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black),
                                              outfitFont:
                                                  OutfitFontStyle.light),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(svgAddButtonCircle)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}

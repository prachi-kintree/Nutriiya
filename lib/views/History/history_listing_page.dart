import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';

import '../../utils/styles/app_text_styles.dart';
import 'history_food_details_page.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text('History',
              style: AppTextStyle.outfitStyle(
              withTextStyle:
              TextStyle(fontSize: 20.sp, color: Colors.black),
              outfitFont: OutfitFontStyle.semibold),
          )),
        ),
        body: HistoryContent(),
    );
  }
}

class HistoryContent extends StatefulWidget {
  const HistoryContent({super.key});

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Breakfast',
      'Lunch',
      'Snack',
      'Dinner'
    ];
    final Map<String, List<MealItem>> mealsByDate = {
      'Jun. 03 2025': [
        MealItem(name: 'Pav Bhaji', image: pngPavBhaji),
        MealItem(name: 'Dal Chawal', image: pngDalChawal),
      ],
      'Jun. 02 2025': [
        MealItem(name: 'Misal Pav', image: misalPav),
        MealItem(name: 'Dal Chawal', image: pngDalChawal),
        MealItem(name: 'Tea biscuit', image: teaBiscuits),
        MealItem(name: 'Chicken Biryani', image: chickenPicture),
      ],
      'Jun. 01 2025': [
        MealItem(name: 'Misal Pav', image: misalPav),
        MealItem(name: 'Dal Chawal', image: pngDalChawal),
        MealItem(name: 'Tea biscuit', image: teaBiscuits),
        MealItem(name: 'Chicken Biryani', image: chickenPicture),
      ],
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          // 10.sBH,
          // Align(
          //   alignment: Alignment.center,
          //   child: Text('History',
          //       style: AppTextStyle.outfitStyle(
          //           withTextStyle:
          //               TextStyle(fontSize: 20.sp, color: Colors.black),
          //           outfitFont: OutfitFontStyle.semibold)),
          // ),
          // SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10.w,
              children: categories
                  .map((e) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = e;
                          print("Selected Category $selectedCategory");
                          print("Selected Category ${e == selectedCategory}");
                        });
                      },
                      child: FilterChipWidget(
                          label: e, selected: e == selectedCategory)))
                  .toList(),
            ),
          ),

          SizedBox(height: 0.h),
          Expanded(
            child: ListView(
              children: mealsByDate.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle: TextStyle(
                                fontSize: 16.sp, color: Colors.black87),
                            outfitFont: OutfitFontStyle.medium)),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: entry.value
                          .map((meal) => MealCardWidget(meal: meal))
                          .toList(),
                    ),
                    SizedBox(height: 24.h),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChipWidget(
      {required this.label, this.selected = false, super.key});

  @override
  Widget build(BuildContext context) {
    print("Selected $selected");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: selected ? const Color(0xff4CAF00) : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xff4CAF00)),
      ),
      child: Text(label,
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(
                  fontSize: 13.sp,
                  color: selected ? Colors.white : const Color(0xff4CAF00)),
              outfitFont: OutfitFontStyle.medium)),
    );
  }
}

class MealItem {
  final String name;
  final String image;

  const MealItem({required this.name, required this.image});
}

class MealCardWidget extends StatelessWidget {
  final MealItem meal;

  const MealCardWidget({required this.meal, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HistoryFoodDetailsPage(image: meal.image)));
      },
      child: Stack(
        children: [
          // Background image
          Container(
            width: 160.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(meal.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Blurred footer
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  width: 160.w,
                  padding: EdgeInsets.all(10.w),
                  color: Colors.black.withOpacity(0.3),
                  // semi-transparent overlay
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          meal.name,
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                              outfitFont: OutfitFontStyle.semibold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

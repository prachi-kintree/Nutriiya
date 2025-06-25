import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../../utils/CustomWidgets/keyboard_aware_widget.dart';
import '../../../utils/styles/app_text_styles.dart';
import '../../../utils/theme/theme_model.dart';

class FoodCartScreen extends StatefulWidget {
  const FoodCartScreen({super.key});

  @override
  State<FoodCartScreen> createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyBoardAwareWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NutrientsWidget(
                food: SuggestedFood(
                    foodname: "foodname",
                    calories: 12,
                    quantity: 2,
                    protein: 12,
                    carbs: 12,
                    fat: 12,
                    serving: 2,
                    fibre: 12),
                // date: "May. 08 2025",
                // time: "08:00 AM",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutrientsWidget extends StatelessWidget {
  final SuggestedFood? food;
  final String? date;
  final String? time;

  const NutrientsWidget({
    super.key,
    required this.food,
    this.date,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          food?.foodname ?? "",
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 36.sp, color: Colors.black),
              outfitFont: OutfitFontStyle.medium),
        ),
        AmountCounter(
          food: food!,
        ),
        PortionCounter(
          food: food!,
        ),
        date == null
            ? const SizedBox()
            : Column(
                children: [
                  20.sBH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      Text(
                        date!,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time",
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      Text(
                        time!,
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                    ],
                  )
                ],
              ),
        CaloriesWidget(
          calories: food?.calories.round() ?? 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MacronutrientsUnitWidget(
              color: Color(0xffFF7300),
              value: food?.protein.round() ?? 10,
              name: "Protien",
            ),
            MacronutrientsUnitWidget(
              color: Color(0xffEE5A5A),
              value: food?.carbs.round() ?? 10,
              name: "Carbs",
            ),
            MacronutrientsUnitWidget(
              color: Color(0xff1A96F0),
              value: food?.fat.round() ?? 10,
              name: "Fat",
            ),
            MacronutrientsUnitWidget(
              color: Color(0xff42A004),
              value: food?.fibre.round() ?? 10,
              name: "Fibre",
            ),
          ],
        ),
        const Divider(thickness: 2),
        DetailedIngredient(listItems: [
          DetailedIngredientModel(calories: 4, name: "Onion", isAdded: false),
          DetailedIngredientModel(calories: 51, name: "Farsan", isAdded: false),
          DetailedIngredientModel(
              calories: 4, name: "Lemon Wedge", isAdded: false),
        ])
      ],
    );
  }
}

class MacronutrientsUnitWidget extends StatelessWidget {
  final Color color;
  final int value;
  final String name;

  const MacronutrientsUnitWidget(
      {super.key,
      required this.color,
      required this.value,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 63.h,
          width: 63.h,
          decoration: BoxDecoration(
              border: Border.all(color: color), shape: BoxShape.circle),
          child: Text(
            "${value}g",
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 24.sp, color: color),
                outfitFont: OutfitFontStyle.regular),
          ),
        ),
        10.sBH,
        Text(
          name,
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
              outfitFont: OutfitFontStyle.regular),
        ),
      ],
    );
  }
}

class CaloriesWidget extends StatelessWidget {
  final int calories;

  const CaloriesWidget({
    super.key,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
          border: Border.all(
              color: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .primaryGreen!),
          borderRadius: BorderRadius.circular(8.0.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // SizedBox(
          //     height: 14.h,
          //     width: 14.h,
          //     child: SvgPicture.asset(svgCaloriesBurn)),
          5.sBW,
          Text(
            "Calories",
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular),
          ),
          Spacer(),
          SizedBox(
            height: 30.h,
            child: RichText(
                text: TextSpan(
                    text: '$calories',
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 24.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.semibold),
                    children: [
                  TextSpan(
                    text: " Kcal",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular),
                  )
                ])),
          )
        ],
      ),
    );
  }
}

class AmountCounter extends StatelessWidget {
  // final String name;
  // final int amount;
  // final String unit;
  final SuggestedFood food;

  const AmountCounter({
    super.key,
    required this.food,
    // required this.name,
    // required this.amount,
    // required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Amount",
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 18.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                .light_black_text_color),
              outfitFont: OutfitFontStyle.regular),
        ),
        const Spacer(),
        Container(
          height: 35.h,
          width: 90.w,
          padding: EdgeInsetsGeometry.symmetric(vertical: 7.h, horizontal: 8.w),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    // context
                    //     .read<MealSearchScreenViewmodel>()
                    //     .decrementQuantity(food);
                  },
                  child: const Icon(Icons.remove)),
              Container(
                width: 30.w,
                alignment: Alignment.center,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: '${food.quantity.round()}',
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 12.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // contentPadding: EdgeInsetsGeometry.only(bottom: 4.h)
                      ),
                ),
              ),
              // Text(
              //   '${food.quantity.round()}',
              //   style: AppTextStyle.outfitStyle(
              //       withTextStyle:
              //           TextStyle(fontSize: 12.sp, color: Colors.black),
              //       outfitFont: OutfitFontStyle.regular),
              // ),
              InkWell(
                  onTap: () {
                    // context
                    //     .read<MealSearchScreenViewmodel>()
                    //     .incrementQuantity(food);
                  },
                  child: const Icon(Icons.add))
            ],
          ),
        ),
        20.sBW,
        SizedBox(
          width: 50.w,
          child: Text(
            "Gram",
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular),
          ),
        ),
      ],
    );
  }
}

class PortionCounter extends StatelessWidget {
  // final String name;
  // final int amount;
  // final String unit;
  final SuggestedFood food;

  const PortionCounter(
      {super.key,
      // required this.name,
      // required this.amount,
      // required this.unit,
      required this.food});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Portion",
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 18.sp, color: ThemeManagerPlus.of<AppTheme>(context)
                  .currentTheme
                  .light_black_text_color),
              outfitFont: OutfitFontStyle.regular),
        ),
        const Spacer(),
        Container(
          height: 35.h,
          width: 90.w,
          padding: EdgeInsetsGeometry.symmetric(vertical: 7.h, horizontal: 8.w),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    // context
                    //     .read<MealSearchScreenViewmodel>()
                    //     .decrementQuantity(food);
                  },
                  child: const Icon(Icons.remove)),

              Container(
                alignment: Alignment.center,
                width: 30.w,
                child: TextFormField(
                  initialValue: '${food.serving.round()}',
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                      TextStyle(fontSize: 12.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // contentPadding: EdgeInsetsGeometry.only(bottom: 4.h)
                  ),
                ),
              ),
              // Text(
              //   '${food.serving.round()}',
              //   style: AppTextStyle.outfitStyle(
              //       withTextStyle:
              //           TextStyle(fontSize: 12.sp, color: Colors.black),
              //       outfitFont: OutfitFontStyle.regular),
              // ),
              InkWell(
                  onTap: () {
                    // context
                    //     .read<MealSearchScreenViewmodel>()
                    //     .incrementServing(food);
                  },
                  child: const Icon(Icons.add))
            ],
          ),
        ),
        20.sBW,
        SizedBox(
          width: 50.w,
          child: Text(
            "Serving",
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.regular),
          ),
        ),
      ],
    );
  }
}

class SuggestedFood {
  final String foodname;
  final double calories;
  double quantity;
  final double protein;
  final double carbs;
  final double fat;
  final double fibre;
  double serving;

  SuggestedFood(
      {required this.foodname,
      required this.calories,
      required this.quantity,
      required this.protein,
      required this.carbs,
      required this.fat,
      required this.serving,
      required this.fibre});
}

class DetailedIngredient extends StatefulWidget {
  final List<DetailedIngredientModel> listItems;

  const DetailedIngredient({super.key, required this.listItems});

  @override
  State<DetailedIngredient> createState() => _DetailedIngredientState();
}

class _DetailedIngredientState extends State<DetailedIngredient> {
  List<DetailedIngredientModel> addedList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Detailed Ingredient Information",
            textAlign: TextAlign.left,
            style: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
                outfitFont: OutfitFontStyle.medium)),
        15.sBH,
        ...widget.listItems.map((e) => Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.name,
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 18.sp,
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .light_black_text_color),
                              outfitFont: OutfitFontStyle.regular)),
                      5.sBH,
                      Text("${e.calories} Cal",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: ThemeManagerPlus.of<AppTheme>(context)
                                      .currentTheme
                                      .light_black_text_color),
                              outfitFont: OutfitFontStyle.regular)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (addedList.contains(e)) {
                        setState(() {
                          addedList.remove(e);
                        });
                      } else {
                        setState(() {
                          addedList.add(e);
                        });
                      }
                    },
                    child: addedList.contains(e)
                        ? Text("Added",
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        ThemeManagerPlus.of<AppTheme>(context)
                                            .currentTheme
                                            .primaryGreen),
                                outfitFont: OutfitFontStyle.regular))
                        : Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 12.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ThemeManagerPlus.of<AppTheme>(context)
                                    .currentTheme
                                    .primaryGreen),
                            child: Text("Add",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 16.sp,
                                        color: ThemeManagerPlus.of<AppTheme>(
                                                context)
                                            .currentTheme
                                            .white),
                                    outfitFont: OutfitFontStyle.regular)),
                          ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class DetailedIngredientModel {
  final String name;
  final bool isAdded;
  final int calories;

  DetailedIngredientModel(
      {required this.calories, required this.isAdded, required this.name});
}

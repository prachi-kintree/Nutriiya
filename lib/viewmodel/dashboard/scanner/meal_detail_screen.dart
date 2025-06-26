import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/food_logger_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:nutriya/views/widget/app_bar/common_appbar.dart';
import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({super.key});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size(1.sw, 45.h),
          child: CommonAppBar(
            appBarTitle:
                " ${context.read<FoodLoggerViewmodel>().currentMeal} Details",
            isBackbutton: true,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NutrientsWidget(
                food: context.read<MealSearchScreenViewmodel>().breakfastList,
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
  final List<SuggestedFood>? food;
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: food?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food?[index].foodname ?? "",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 38.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.semibold),
                ),
                20.sBH,
                AmountCounter(
                  food: food![index],
                ),
                20.sBH,
                PortionCounter(
                  food: food![index],
                ),
                20.sBH,
                Divider(
                  color: Color(0xff5E5F60),
                  height: 1.h,
                ),
                15.sBH,
              ],
            );
          },
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
                  20.sBH,
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
        20.sBH,
        Consumer<MealSearchScreenViewmodel>(
          builder: (context, value, child) => CaloriesWidget(
            calories: value.currentFood?.calories.round() ?? 0,
          ),
        ),
        20.sBH,
        Consumer<MealSearchScreenViewmodel>(
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MacronutrientsUnitWidget(
                color: Color(0xffFF7300),
                // value: food?.protein.round() ?? 10,
                value: value.currentFood?.protein.round() ?? 0,
                name: "Protien",
              ),
              MacronutrientsUnitWidget(
                color: Color(0xffEE5A5A),
                value: value.currentFood?.carbs.round() ?? 0,
                name: "Carbs",
              ),
              MacronutrientsUnitWidget(
                color: Color(0xff1A96F0),
                value: value.currentFood?.fat.round() ?? 0,
                name: "Fat",
              ),
              MacronutrientsUnitWidget(
                color: Color(0xff42A004),
                value: value.currentFood?.fibre.round() ?? 0,
                name: "Fibre",
              ),
            ],
          ),
        ),
        15.sBH,
        SizedBox(
          child: Consumer<MealSearchScreenViewmodel>(
            builder: (context, value, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.breakFastIngredientsList.length,
                itemBuilder: (context, index) {
                  return ExtraIngredients(
                    ingredient:
                        value.breakFastIngredientsList[index].ingredient!,
                    calories: value.breakFastIngredientsList[index].calories!,
                    onTap: () {
                      value.markIngredientAsAdded(index);
                      // value.breakfastAddOnList.add(
                      //     value.breakFastIngredientsList[index].ingredient!);
                    },
                    isAdded: value.breakFastIngredientsList[index].isAdded!,
                  );
                },
              );
            },
          ),
        ),
        15.sBH,
        CustomButton(
            buttonText: "Save Changes",
            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
            buttonTextStyle: AppTextStyle.outfitStyle(
                withTextStyle: TextStyle(fontSize: 16.sp),
                outfitFont: OutfitFontStyle.medium),
            width: 500.w,
            onPressed: (startLoading, stopLoading, btnState) {
              appNavigator.pushNamedAndRemoveUntil(routeUserDetails);
            },
            isDisabled: false,
            disableElevation: false),
      ],
    );
  }
}

class ExtraIngredients extends StatelessWidget {
  final String ingredient;
  final int calories;
  final VoidCallback? onTap;
  final bool isAdded;
  final bool isButton;
  const ExtraIngredients(
      {super.key,
      required this.ingredient,
      required this.calories,
      this.onTap,
      this.isButton = false,
      required this.isAdded});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ingredient,
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                        TextStyle(fontSize: 18.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.regular),
              ),
              10.sBW,
              Text(
                '${calories} cal',
                style: AppTextStyle.outfitStyle(
                    withTextStyle:
                        TextStyle(fontSize: 14.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.regular),
              ),
            ],
          ),
          Spacer(),
          isButton
              ? InkWell(
                  // onTap: onTap!,
                  child: isAdded
                      ? Container(
                          height: 35.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8.0.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.remove)),
                              Text(
                                '1',
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                    outfitFont: OutfitFontStyle.regular),
                              ),
                              InkWell(
                                  onTap: () {}, child: const Icon(Icons.add))
                            ],
                          ),
                        )
                      : CustomButton(
                          buttonText: "Add",
                          // padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                          buttonTextStyle: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(fontSize: 16.sp),
                              outfitFont: OutfitFontStyle.medium),
                          width: 63.w,
                          height: 32.h,
                          onPressed: (startLoading, stopLoading, btnState) {
                            onTap!();
                          },
                          isDisabled: false,
                          disableElevation: false),
                )
              : const SizedBox(),
        ],
      ),
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
                withTextStyle: TextStyle(fontSize: 26.sp, color: color),
                outfitFont: OutfitFontStyle.regular),
          ),
        ),
        10.sBH,
        Text(
          name,
          style: AppTextStyle.outfitStyle(
              withTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
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
          SizedBox(
              height: 14.h,
              width: 14.h,
              child: SvgPicture.asset(svgCaloriesBurn)),
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
    return Consumer<MealSearchScreenViewmodel>(
      builder: (context, value, child) {
        return Row(
          children: [
            Text(
              "Amount",
              style: AppTextStyle.outfitStyle(
                  withTextStyle:
                      TextStyle(fontSize: 18.sp, color: Colors.black),
                  outfitFont: OutfitFontStyle.regular),
            ),
            const Spacer(),
            Container(
              height: 35.h,
              width: 90.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        // context
                        //     .read<MealSearchScreenViewmodel>()
                        //     .decrementQuantity(food);
                        value.decrementQuantity();
                      },
                      child: const Icon(Icons.remove)),
                  Text(
                    // '${context.read<MealSearchScreenViewmodel>().currentFood?.quantity.round()}',
                    '${value.currentFood?.quantity.round()}',
                    // food.quantity.round()
                    style: AppTextStyle.outfitStyle(
                        withTextStyle:
                            TextStyle(fontSize: 12.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular),
                  ),
                  InkWell(
                      onTap: () {
                        // context
                        //     .read<MealSearchScreenViewmodel>()
                        //     .incrementQuantity(food);
                        value.incrementQuantity();
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
                    withTextStyle:
                        TextStyle(fontSize: 14.sp, color: Colors.black),
                    outfitFont: OutfitFontStyle.regular),
              ),
            ),
          ],
        );
      },
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
    return Consumer<MealSearchScreenViewmodel>(
        builder: (context, value, child) => Row(
              children: [
                Text(
                  "Portion",
                  style: AppTextStyle.outfitStyle(
                      withTextStyle:
                          TextStyle(fontSize: 18.sp, color: Colors.black),
                      outfitFont: OutfitFontStyle.regular),
                ),
                const Spacer(),
                Container(
                  height: 35.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            // context
                            //     .read<MealSearchScreenViewmodel>()
                            //     .decrementQuantity(food);
                            value.decrementServing();
                          },
                          child: const Icon(Icons.remove)),
                      Text(
                        // '${food.serving.round()}',
                        '${value.currentFood?.serving.round()}',
                        style: AppTextStyle.outfitStyle(
                            withTextStyle:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                            outfitFont: OutfitFontStyle.regular),
                      ),
                      InkWell(
                          onTap: () {
                            // context
                            //     .read<MealSearchScreenViewmodel>()
                            //     .incrementServing(food);
                            value.incrementServing();
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
                        withTextStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.black),
                        outfitFont: OutfitFontStyle.regular),
                  ),
                ),
              ],
            ));
  }
}

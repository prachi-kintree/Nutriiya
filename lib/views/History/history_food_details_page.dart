import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:nutriya/views/dashboard/Scanner/food_cart_screen.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../../viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import '../widget/common_gradient_scaffold.dart';

class HistoryFoodDetailsPage extends StatelessWidget {
  final String image;

  const HistoryFoodDetailsPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(children: [CommonGradient(), SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 20.w,
                  child: InkWell(
                    onTap: () {
                      appNavigator.goBack();
                    },
                    child: SvgPicture.asset(
                      svgBackArrow,
                      colorFilter: ColorFilter.mode(
                          ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .white!,
                          BlendMode.srcIn),
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
                child: NutrientsWidget(
                    food: SuggestedFood(
                        calories: 20,
                        carbs: 20,
                        fat: 20,
                        fibre: 20,
                        foodname: "Pav Bhaji",
                        protein: 20,
                        quantity: 1,
                        serving: 1)))
          ],
        ),
      )])



    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/theme/theme_model.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

import '../widgets/food_details/common_food_details.dart';

class HistoryFoodDetailsPage extends StatelessWidget {
  final String image;

  const HistoryFoodDetailsPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                top: 30.h, left: 20.w,
                child: InkWell(
                  onTap: () {
                    appNavigator.goBack();
                  },
                  child: SvgPicture.asset(svgBackArrow, colorFilter: ColorFilter.mode(ThemeManagerPlus.of<AppTheme>(context)
                      .currentTheme
                      .white!, BlendMode.srcIn),),
                ),
              )
            ],
          ),
          const Expanded(child: FoodCartScreen())
        ],
      ),
    );
  }
}

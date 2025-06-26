import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';

class FoodLoggerViewmodel with ChangeNotifier {
  updateListner() {
    notifyListeners();
  }

  List<Meals> meals = [
    Meals(icon: svgSandwich, title: "Breakfast", isSelected: false),
    Meals(icon: svgPaneerCurry, title: "Lunch", isSelected: false),
    Meals(icon: svgTea, title: "Snack", isSelected: false),
    Meals(icon: svgLoveFood, title: "Dinner", isSelected: false),
  ];
  toggleIsMealSelected(Meals meal) {
    if (meal.isSelected != null) {
      meal.isSelected = !meal.isSelected!;
    }
    notifyListeners();
  }

  String currentMeal = '';

  navigateToDesireMeal(Meals meal) {
    toggleIsMealSelected(meal);
    switch (meal.title) {
      case "Breakfast":
        currentMeal = 'Breakfast';
        appNavigator.pushNamed(routeMealSearch);
        Future.delayed(
          const Duration(seconds: 1),
          () {
            toggleIsMealSelected(meal);
          },
        );
        break;
      case "Lunch":
        currentMeal = 'Lunch';
        appNavigator.pushNamed(routeMealSearch);
        Future.delayed(
          const Duration(seconds: 1),
          () {
            toggleIsMealSelected(meal);
          },
        );
        break;
      case "Snack":
        currentMeal = 'Snack';
        appNavigator.pushNamed(routeMealSearch);
        Future.delayed(
          const Duration(seconds: 1),
          () {
            toggleIsMealSelected(meal);
          },
        );
        break;
      case "Dinner":
        currentMeal = 'Dinner';
        appNavigator.pushNamed(routeMealSearch);
        Future.delayed(
          const Duration(seconds: 1),
          () {
            toggleIsMealSelected(meal);
          },
        );
        break;

      default:
    }
    notifyListeners();
  }
}

class Meals {
  final String? icon;
  // final String? meal;
  bool? isSelected;
  final String? title;
  final String? subtitle;

  Meals({
    this.title,
    this.subtitle,
    this.icon,
    // this.meal,
    this.isSelected,
  });
}

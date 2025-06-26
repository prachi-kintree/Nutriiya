import 'package:flutter/material.dart';

class MealSearchScreenViewmodel with ChangeNotifier {
  final SearchController searchMealController = SearchController();
  final SearchController searchIngredientController = SearchController();
  final List<SuggestedFood> mealSuggestions = [
    SuggestedFood(
        foodname: "Egg",
        calories: 72,
        serving: 1,
        protein: 12,
        carbs: 30,
        fat: 20,
        quantity: 60,
        fibre: 15),
    SuggestedFood(
        foodname: "Apple",
        serving: 1,
        calories: 104,
        quantity: 200,
        protein: 12,
        carbs: 30,
        fat: 20,
        fibre: 15),
    SuggestedFood(
        foodname: "Boiled Egg",
        serving: 1,
        calories: 120,
        quantity: 60,
        protein: 12,
        carbs: 30,
        fat: 20,
        fibre: 15),
    SuggestedFood(
        serving: 1,
        foodname: "Whole milk",
        calories: 500,
        quantity: 250,
        protein: 12,
        carbs: 30,
        fat: 20,
        fibre: 15),
    SuggestedFood(
        serving: 1,
        foodname: "Egg",
        calories: 72,
        quantity: 60,
        protein: 12,
        carbs: 30,
        fat: 20,
        fibre: 15),
  ];
  final List<IngredientsOfFood> ingredientSuggestions = [
    IngredientsOfFood(
        ingredient: 'Onions', calories: 4, isAdded: false, quantity: 1),
    IngredientsOfFood(
        ingredient: 'Farsan', calories: 41, isAdded: false, quantity: 100),
    IngredientsOfFood(
        ingredient: 'Lemon Wedge', calories: 4, isAdded: false, quantity: 2),
  ];
  List<IngredientsOfFood> breakFastIngredientsList = [
    IngredientsOfFood(
        ingredient: 'Onions', calories: 4, isAdded: false, quantity: 1),
    IngredientsOfFood(
        ingredient: 'Farsan', calories: 41, isAdded: false, quantity: 100),
    IngredientsOfFood(
        ingredient: 'Lemon Wedge', calories: 4, isAdded: false, quantity: 2),
  ];

  // List<String> breakfastAddOnList = [];
  // List<String> lunchAddOnList = [];
  // List<String> dinnerAddOnList = [];
  // List<String> snackAddOnList = [];

  List<SuggestedFood> breakfastList = [];
  // List<String> breakfastList = [];
  List<SuggestedFood> lunchList = [];
  List<SuggestedFood> dinnerList = [];
  List<SuggestedFood> snackList = [];
  String mealQuery = '';
  String ingredientQuery = '';
  SuggestedFood? baseFood;
  SuggestedFood? currentFood;
  List<SuggestedFood> filteredMealSuggestions = [];
  List<IngredientsOfFood> filteredIngredientSuggestions = [];
  bool isMealSearching = false;
  bool isIngredientSearching = false;
  searchMealOnChange(value) {
    mealQuery = value;
    isMealSearching = mealQuery.isNotEmpty;
    filteredMealSuggestions = mealSuggestions
        .where(
            (s) => s.foodname.toLowerCase().contains(mealQuery.toLowerCase()))
        .toList();
    notifyListeners();
  }

  searchIngredientOnChange(value) {
    ingredientQuery = value;
    isIngredientSearching = ingredientQuery.isNotEmpty;
    filteredIngredientSuggestions = ingredientSuggestions
        .where((s) =>
            s.ingredient!.toLowerCase().contains(ingredientQuery.toLowerCase()))
        .toList();
    notifyListeners();
  }

  clearSearch() {
    mealQuery = '';
    ingredientQuery = '';
    isIngredientSearching = false;
    isMealSearching = false;
    filteredMealSuggestions.clear();
    filteredIngredientSuggestions.clear();
    notifyListeners();
  }

  void selectFood(SuggestedFood selected) {
    // baseFood is the immutable original copy
    baseFood = SuggestedFood(
      foodname: selected.foodname,
      calories: selected.calories,
      quantity: selected.quantity,
      protein: selected.protein,
      carbs: selected.carbs,
      fat: selected.fat,
      serving: selected.serving,
      fibre: selected.fibre,
    );

    // currentFood is the mutable copy for user to modify
    currentFood = SuggestedFood(
      foodname: selected.foodname,
      calories: selected.calories,
      quantity: selected.quantity,
      protein: selected.protein,
      carbs: selected.carbs,
      fat: selected.fat,
      serving: selected.serving,
      fibre: selected.fibre,
    );
    notifyListeners();
  }

  static SuggestedFood calculateUpdatedNutrients({
    required SuggestedFood baseFood,
    required double currentQuantity,
    required double currentServing,
  }) {
    // Parse the original values
    final baseQuantity = baseFood.quantity ?? 1;
    final baseCalories = baseFood.calories ?? 0;
    final baseProtein = baseFood.protein ?? 0;
    final baseCarbs = baseFood.carbs ?? 0;
    final baseFat = baseFood.fat ?? 0;
    final baseFibre = baseFood.fibre ?? 0;

    // Calculate ratios
    final quantityRatio = currentQuantity / baseQuantity;
    final totalMultiplier = quantityRatio * currentServing;

    // Create and return new SuggestedFood with updated values
    return SuggestedFood(
      foodname: baseFood.foodname,
      quantity: currentQuantity,
      serving: currentServing,
      calories: (baseCalories * totalMultiplier),
      protein: (baseProtein * totalMultiplier),
      carbs: (baseCarbs * totalMultiplier),
      fat: (baseFat * totalMultiplier),
      fibre: (baseFibre * totalMultiplier),
    );
  }

  void _recalculate() {
    if (baseFood == null || currentFood == null) return;
    currentFood = calculateUpdatedNutrients(
      baseFood: baseFood!,
      currentQuantity: currentFood!.quantity,
      currentServing: currentFood!.serving,
    );
    notifyListeners();
  }

  void incrementQuantity() {
    if (currentFood == null) return;
    currentFood!.quantity += 50;
    _recalculate();
  }

  void decrementQuantity() {
    if (currentFood == null) return;
    currentFood!.quantity = (currentFood!.quantity - 50).clamp(50, 10000);
    _recalculate();
  }

  void incrementServing() {
    if (currentFood == null) return;
    currentFood!.serving += 1;
    _recalculate();
  }

  void decrementServing() {
    if (currentFood == null) return;
    currentFood!.serving = (currentFood!.serving - 1).clamp(1, 100);
    _recalculate();
  }

  void markIngredientAsAdded(int index) {
    breakFastIngredientsList[index] =
        breakFastIngredientsList[index].copyWith(isAdded: true);
    notifyListeners();
  }

  //  double get _multiplier => quantity / widget.food.baseQuantity;
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
  @override
  String toString() {
    return 'SuggestedFood(foodname: $foodname, calories: $calories, quantity: $quantity, '
        'protein: $protein, carbs: $carbs, fat: $fat, fibre: $fibre, serving: $serving)';
  }
}

// class IngredientsOfFood {
//   final String? ingredient;
//   final int? calories;
//   bool? isAdded;
//   IngredientsOfFood(
//       {required this.ingredient,
//       required this.calories,
//       required this.isAdded});
// }

class IngredientsOfFood {
  final String? ingredient;
  final int? calories;
  final int? quantity;
  bool? isAdded;

  IngredientsOfFood(
      {required this.ingredient,
      required this.calories,
      required this.isAdded,
      required this.quantity});

  IngredientsOfFood copyWith(
      {String? ingredient, int? calories, bool? isAdded, int? quantity}) {
    return IngredientsOfFood(
        ingredient: ingredient ?? this.ingredient,
        calories: calories ?? this.calories,
        isAdded: isAdded ?? this.isAdded,
        quantity: quantity ?? this.quantity);
  }
}

import 'package:flutter/material.dart';

class HistoryViewmodeld with ChangeNotifier {
  final List category = ['All', 'Breakfast', 'Lunch', 'Snack', 'Dinner'];
  String _currentCategory = 'All';
  String _currentCategoryIndex = '0';
  String get currentCategory => _currentCategory;
  String get currentCategoryIndex => _currentCategoryIndex;
  setCurrentCategory(String type, String index) {
    _currentCategory = type;
    _currentCategoryIndex = index;
    // categoryId = id;

    // List<r.Posts>? cachedPosts = categoryPostsMap[categoryId];
    // int currentPage = currentPageMap[categoryId] ?? 1;
    // int lastPage = lastPageMap[categoryId] ?? 1;

    // if (cachedPosts == null || cachedPosts.isEmpty) {
    //   // No data? Fetch page 1
    //   currentPageMap[categoryId!] = 1;
    //   getRecipes();
    // } else if (currentPage < lastPage) {
    //   // Data exists, but not all pages fetched? Optionally load more
    //   getRecipes(); // Optional: only if you want to lazy load more here
    // } else {
    //   // Already fully loaded
    //   recipePost = cachedPosts;
    //   notifyListeners();
    // }

    // log("category filtered list ${recipePost.map(
    //       (e) => e.postData?.title,
    //     ).toList()}");

    notifyListeners();
  }
}

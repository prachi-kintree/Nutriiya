import 'package:flutter/material.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/scanner_screen.dart';
// import 'package:nutriya/viewmodel/dashboard/scanner/scanner_screen.dart';
import 'package:nutriya/views/Account/account_page.dart';
import 'package:nutriya/views/History/history_listing_page.dart';
import 'package:nutriya/views/User_Progress/user_progress.dart';
import 'package:nutriya/views/dashboard/home/home_screen.dart';

class DashboardViewmodel with ChangeNotifier {
  int tabIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    UserProgressScreen(),
    ScannerScreen(),
    HistoryScreen(),
    AccountPage()
  ];
  Widget getCurrentScreen() {
    return screens[tabIndex];
  }

  updateTabIndex(int selectedIndex) async {
    if (selectedIndex == 0) {
      tabIndex = selectedIndex;
      notifyListeners();
    }
    if (selectedIndex == 1) {
      tabIndex = selectedIndex;
      notifyListeners();
    }
    if (selectedIndex == 2) {
      tabIndex = selectedIndex;
      notifyListeners();
      // appNavigator.pushNamed(routeCreatePost);
      return;
    }
    if (selectedIndex == 3) {
      tabIndex = selectedIndex;
      notifyListeners();
      // appNavigator.pushNamed(routeCensusDashboard);
    }
    if (selectedIndex == 4) {}
    tabIndex = selectedIndex;
    notifyListeners();
  }
}

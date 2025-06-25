import 'package:flutter/material.dart';
import 'package:nutriya/RouteManager/app_routes.dart';
import 'package:nutriya/RouteManager/navigator_service.dart';
import 'package:nutriya/views/dashboard/Scanner/scanner_screen.dart';
import 'package:nutriya/views/dashboard/history/history_screen.dart';
import 'package:nutriya/views/dashboard/home/home_screen.dart';
import 'package:nutriya/views/dashboard/profile/profile_screen.dart';
import 'package:nutriya/views/dashboard/progress/progress_screen.dart';

class DashboardViewmodel with ChangeNotifier {
  int tabIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ProgressScreen(),
    ScannerScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];
  Widget getCurrentScreen() {
    return screens[tabIndex];
  }

  updateTabIndex(int selectedIndex) async {
    if (selectedIndex == 0) {}
    if (selectedIndex == 1) {}
    if (selectedIndex == 2) {
      // appNavigator.pushNamed(routeCreatePost);
      return;
    }
    if (selectedIndex == 3) {
      // appNavigator.pushNamed(routeCensusDashboard);
    }
    if (selectedIndex == 4) {}
    tabIndex = selectedIndex;
    Future.delayed(Duration(milliseconds: 500), () {
      notifyListeners();
    });
  }
}

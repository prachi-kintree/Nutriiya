import 'package:flutter/material.dart';
import 'package:nutriya/extension/extension_string.dart';
import 'package:nutriya/views/User_Progress/user_progress.dart';
import 'package:nutriya/views/dashboard/dashboard_screen.dart';
import '../Injector/app_injector.dart';
import '../utils/LocalData/local_data_manager.dart';
import '../utils/animations/page_route_animation.dart';
import '../utils/styles/app_decoration.dart';
import '../viewmodel/dashboard/scanner/camera_scanner_screen.dart';
import '../viewmodel/dashboard/scanner/ingredient_search_screen.dart';
import '../viewmodel/dashboard/scanner/meal_detail_screen.dart';
import '../viewmodel/dashboard/scanner/meal_search_screen.dart';
import '../views/Account/amount_page.dart';
import '../views/Account/languages/languages.dart';
import '../views/Account/notification/notification_settings.dart';
import '../views/Account/personal_info/personal_info_form.dart';
import '../views/Account/personal_info/personal_info_page.dart';
import '../views/Account/reminder/food/food_reminder.dart';
import '../views/Account/reminder/reminder_list_screen.dart';
import '../views/Account/reminder/water/water_reminder.dart';
import '../views/Account/subscription/subscription_plan.dart';
import '../views/Account/unit_and_measures/unit_and_measures_screen.dart';
import '../views/History/history_listing_page.dart';
import '../views/Onboarding/intro/intro_screen.dart';
import '../views/Onboarding/languages/select_languages.dart';
import '../views/Onboarding/login/login_screen.dart';
import '../views/Onboarding/login/otp/otp_screen.dart';
import '../views/Onboarding/login/sign_in_screen.dart';
import '../views/Onboarding/user_detail/user_details_screen.dart';
import '../views/Onboarding/user_detail/widgets/bmi_report.dart';
import '../views/splash/splash_screen.dart';
import '../views/widgets/food_details/common_food_details.dart';
import 'app_routes.dart';
import 'deep_link_helper.dart';

bool hasLogout = false;
bool hmsAvailability = false;

// https://www.youtube.com/watch?v=C7CAMPdUu8o
class AppRouteManager {
  String determineRoute() {
    if (hasLogout) {
      print("User Logout out and navigate to home");
      return routeHome;
    } else if (getIt<LocalDataManager>().userId != "") {
      print("User Logged in and navigate to dashboard");
      return routeDashboard;
    } else {
      print("Fresh User");
      return routeIntro;
    }
  }

  AppRouteManager._();

  static AppRouteManager _manager = AppRouteManager._();

  static AppRouteManager get shared => _manager;

  Route<dynamic> generateRoute(RouteSettings settings) {
    // return MaterialPageRoute(
    //     builder: (_) => Container(), settings: settings);
    if (settings.name?.toLowerCase().contains("kintree.com") ?? false) {
      print("from dynamic link");
      Map<String, dynamic> deepLinkParmeters =
          ((settings.name?.getQueryParametersAsJson()["_dl"] as String))
              .getQueryParameters();
      if (getIt<LocalDataManager>().userId != "") {
        return DeeepLinkHelper().handleDeepLink(routeLink: settings.name ?? "");
      } else {
        AppDecoration.showToast(message: "Please Login");
        return FadeInRoute(page: const SplashScreen(), settings: settings);
      }
    }
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);

      case routeLogin:
        return FadeInRoute(page: const LoginScreen(), settings: settings);
      case routeSignIn:
        return FadeInRoute(page: const SignInScreen(), settings: settings);
      case routeOtp:
        return FadeInRoute(page: const OtpScreen(), settings: settings);
      case routeSelectUserLanguage:
        return FadeInRoute(page: const SelectLanguage(), settings: settings);
      case routeUserDetails:
        return FadeInRoute(page: UserDetailsScreen(), settings: settings);
      case routeBmiReport:
        return FadeInRoute(page: const BmiReport(), settings: settings);
      case routeIntro:
        return FadeInRoute(page: const IntroScreen(), settings: settings);
      case routeUserProgress:
        return FadeInRoute(
            page: const UserProgressScreen(), settings: settings);
      case routeHistory:
        return FadeInRoute(page: const HistoryScreen(), settings: settings);
      case routeAccount:
        return FadeInRoute(page: const AccountPage(), settings: settings);
      case routeSubscription:
        return FadeInRoute(
            page: const SubscriptionPlanPage(), settings: settings);
        // return FadeInRoute(page: UserDetailsScreen(), settings: settings);
        return FadeInRoute(page: DashboardScreen(), settings: settings);
      case routeMealSearch:
        return FadeInRoute(page: const MealSearchScreen(), settings: settings);
      case routeIngredientSearch:
        return FadeInRoute(page: const IngredientSearchScreen(), settings: settings);
      case routeFoodCart:
        return FadeInRoute(page: const FoodCartScreen(), settings: settings);
      case routeMealDetailScreen:
        return FadeInRoute(page: const MealDetailScreen(), settings: settings);
      case routeMealCameraScreen:
        return FadeInRoute(page: const CameraScannerScreen(), settings: settings);
      case routeDashboard:
        return FadeInRoute(page: const DashboardScreen(), settings: settings);
      case routePersonalInfo:
        return FadeInRoute(page: const PersonalInformationPage(), settings: settings);
      case routePersonalInfoForm:
        return FadeInRoute(page: const PersonalInformationForm(), settings: settings);
      case routeNotificationSetting:
        return FadeInRoute(page: const NotificationSettings(), settings: settings);
      case routeLanguages:
        return FadeInRoute(page: const AppLanguageScreen(), settings: settings);
      case routeReminderList:
        return FadeInRoute(page: const ReminderListScreen(), settings: settings);
      case routeFoodReminder:
        return FadeInRoute(page: const FoodReminder(), settings: settings);
      case routeWaterReminder:
        return FadeInRoute(page: const WaterReminder(), settings: settings);
      case routeUnitsMeasures:
        return FadeInRoute(page: const UnitsAndMeasuresScreen(), settings: settings);
//       case routeWhatsappSettings:
//         return FadeInRoute(page: WhSettings(), settings: settings);
//       case routeEmailSetting:
//         return FadeInRoute(page: NotificationSettings(), settings: settings);
// case routeSmsSetting:
//         return FadeInRoute(page: NotificationSettings(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

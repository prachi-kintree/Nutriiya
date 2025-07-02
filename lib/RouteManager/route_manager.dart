import 'package:flutter/material.dart';
import 'package:nutriya/extension/extension_string.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/any_other_goal_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/big_wins_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/build_streak_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/carving_hits_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/change_preferences_main_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/dietary_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/journey_progress_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/reason_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/regional_food_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/shop_preferences_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/stay_on_track_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/time_budget_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/whats_your_goal_screen.dart';
import 'package:nutriya/views/Account/goal_settings/change_preferences/work_rhythm_screen.dart';
import 'package:nutriya/views/Account/goal_settings/goal_setting_main_screen.dart';
import 'package:nutriya/views/Account/goal_settings/steps_goal_edit_screen.dart';
import 'package:nutriya/views/Account/help/contact_support/contact_support_screen.dart';
import 'package:nutriya/views/Account/help/faq/faq_screen.dart';
import 'package:nutriya/views/Account/help/feedback/feedback_screen.dart';
import 'package:nutriya/views/Account/help/help_support_main_screen.dart';
import 'package:nutriya/views/Account/security/security_main_screen.dart';
import 'package:nutriya/views/Account/subscription/my_subscription_plan_screen.dart';
import 'package:nutriya/views/Account/subscription/subscription_done.dart';
import 'package:nutriya/views/Dashboard/home/connect_watch_screen.dart';
import 'package:nutriya/views/Dashboard/home/fitness_activity_screen.dart';
import 'package:nutriya/views/Dashboard/home/walking_statistic_screen.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/calories_plan_ready_screen.dart';
import 'package:nutriya/views/Onboarding/user_detail/widgets/personalization_calories_calculation_screen.dart';
import 'package:nutriya/views/User_Progress/user_progress.dart';
import 'package:nutriya/views/dashboard/Scanner/camera_scanner_screen.dart';
import 'package:nutriya/views/dashboard/Scanner/food_cart_screen.dart';
import 'package:nutriya/views/dashboard/Scanner/ingredient_search_screen.dart';
import 'package:nutriya/views/dashboard/Scanner/meal_detail_screen.dart';
import 'package:nutriya/views/dashboard/Scanner/meal_search_screen.dart';
import 'package:nutriya/views/dashboard/dashboard_screen.dart';
import '../Injector/app_injector.dart';
import '../utils/LocalData/local_data_manager.dart';
import '../utils/animations/page_route_animation.dart';
import '../utils/styles/app_decoration.dart';
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
import '../views/widgets/food_details/common_food_details.dart'
    hide FoodCartScreen;
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
      case routePersonalizeCaloriesIndicator:
        return FadeInRoute(
            page: const PersonalizationCaloriesCalculationScreen(),
            settings: settings);
      case routeCaloriesPlanReady:
        return FadeInRoute(
            page: const CaloriesPlanReadyScreen(), settings: settings);
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
      case routeSubscriptionDone:
        return FadeInRoute(
            page: const SubscriptionDonePage(), settings: settings);
      case routeMySubScriptionScreen:
        return FadeInRoute(
            page: const MySubscriptionPlanScreen(), settings: settings);
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
        return FadeInRoute(page: DashboardScreen(), settings: settings);
      case routeHelpSupportScreen:
        return FadeInRoute(page: HelpSupportMainScreen(), settings: settings);
      case routeFaqHelpScreen:
        return FadeInRoute(page: FaqHelpScreen(), settings: settings);
      case routeContactHelpScreen:
        return FadeInRoute(page: ContactSupportScreen(), settings: settings);
      case routeFeedbackHelpScreen:
        return FadeInRoute(page: FeedbackScreen(), settings: settings);
      case routeSecurityScreen:
        return FadeInRoute(page: SecurityMainScreen(), settings: settings);
      case routeGoalSettingScreen:
        return FadeInRoute(page: GoalSettingMainScreen(), settings: settings);
      case routeStepEditScreen:
        return FadeInRoute(page: StepsGoalEditScreen(), settings: settings);
      case routeChangePreferencesScreen:
        return FadeInRoute(
            page: ChangePreferencesMainScreen(), settings: settings);
      case routeDietScreen:
        return FadeInRoute(page: DietaryScreen(), settings: settings);
      case routeWhatsYourGoalScreen:
        return FadeInRoute(page: WhatsYourGoalScreen(), settings: settings);
      case routeRegionalFoodScreen:
        return FadeInRoute(page: RegionalFoodScreen(), settings: settings);
      case routeShopScreen:
        return FadeInRoute(page: ShopScreen(), settings: settings);
      case routeRealReasonScreen:
        return FadeInRoute(page: RealReasonScreen(), settings: settings);
      case routeAnyOtherGoalScreen:
        return FadeInRoute(page: AnyOtherGoalScreen(), settings: settings);
      case routeJourneyProgressScreen:
        return FadeInRoute(page: JourneyProgressScreen(), settings: settings);
      case routeStayOnTrackScreen:
        return FadeInRoute(page: StayOnTrackScreen(), settings: settings);
      case routeTimeBudgetScreen:
        return FadeInRoute(page: TimeBudgetScreen(), settings: settings);
      case routeBuildStreakScreen:
        return FadeInRoute(page: BuildStreakScreen(), settings: settings);
      case routeCarvingsHitScreen:
        return FadeInRoute(page: CarvingHitsScreen(), settings: settings);
      case routeBigWinsScreen:
        return FadeInRoute(page: BigWinsScreen(), settings: settings);
      case routeWorkRhythmScreen:
        return FadeInRoute(page: WorkRhythmScreen(), settings: settings);
      case routeConnectWatch:
        return FadeInRoute(page: ConnectWatchScreen(), settings: settings);
      case routeFitnessActivity:
        return FadeInRoute(page: FitnessActivityScreen(), settings: settings);
      case routeWalkingScreen:
        return FadeInRoute(page: WalkingStatisticScreen(), settings: settings);
      // case routeProgress:
      //   return FadeInRoute(page: ProgressScreen(), settings: settings);
      // case routeCreatePost:
      //   return FadeInRoute(page: (), settings: settings);
      // case routeHistory:
      //   return FadeInRoute(page: HistoryScreen(), settings: settings);
      // case routeProfile:
      //   return FadeInRoute(page: ProfileScreen(), settings: settings);
      // // return MaterialPageRoute(
      // //     builder: (_) => UserVerifiedSuccessfully(), settings: settings);
      // // return MaterialPageRoute(builder: (_) => OTPPage(), settings: settings);
      //
      // case routeLoginBasicDetail:
      //   return FadeInRoute(page: LoginBasicDetailForm(), settings: settings);
      // // return MaterialPageRoute(
      // //     builder: (_) => LoginBasicDetailForm(), settings: settings);
      //
      // // return MaterialPageRoute(
      // //   builder: (_) => LoginWithUserName(), settings: settings);
      // case routeForgetPassword:
      //   return FadeInRoute(
      //       page: ForgetUsernameorPassword(), settings: settings);
      // // return MaterialPageRoute(
      // //   builder: (_) => ForgetUsernameorPassword(), settings: settings);
      //
      // case routeSuccess:
      //   return FadeInRoute(page: SuccessPage(), settings: settings);
      // //  return MaterialPageRoute(
      // //    builder: (_) => SucessPage(), settings: settings);
      //
      // // return MaterialPageRoute(
      // //   builder: (_) => CreatePassword(), settings: settings);
      //
      // case routeAddMember:
      //   return FadeInRoute(page: SelectMemberPage(), settings: settings);
      // //return MaterialPageRoute(
      // //  builder: (_) => SelectMemberPage(), settings: settings);
      //
      // case routeAddMemberDetail:
      //   return FadeInRoute(page: AddMemberForm(), settings: settings);
      // // return MaterialPageRoute(
      // //   builder: (_) => AddMemberForm(), settings: settings);
      //
      // case routeCountryList:
      //   return FadeInRoute(page: CountryListPage(), settings: settings);
      // //return MaterialPageRoute(
      // //  builder: (_) => CountryListPage(), settings: settings);
      //
      // //return MaterialPageRoute(
      // //  builder: (_) => TermsAndConditionPage(), settings: settings);
      //
      // case routeForgetCredentialOtpPage:
      //   return FadeInRoute(page: ForgetOtpPage(), settings: settings);
      // // return MaterialPageRoute(
      // //   builder: (_) => ForgetOtpPage(), settings: settings);
      //
      // case routeResetPassword:
      //   return FadeInRoute(page: ResetPassword(), settings: settings);
      // //return MaterialPageRoute(
      // //  builder: (_) => ResetPassword(), settings: settings);
      // case routeShowUserName:
      //   return FadeInRoute(page: ViewUserName(), settings: settings);
      //
      // // case routeDashboard:
      // //   return FadeInRoute(page: DashBoardPage(), settings: settings);
      // case routeDashboard:
      //   return MaterialPageRoute(
      //       builder: (_) => DashBoardPage(), settings: settings);
      //
      // case routeProfile:
      //   return MaterialPageRoute(
      //       builder: (_) => ProfilePage(), settings: settings);
      //
      // case routeAboutUser:
      //   return FadeInRoute(page: AboutUserPage(), settings: settings);
      //
      // case routeCompleteProfile:
      //   return FadeInRoute(page: CompleteProfilePage(), settings: settings);
      //
      // case routeBasicInfoForm:
      //   return FadeInRoute(page: ProfileBasicInfoForm(), settings: settings);
      // case routeContactInfoForm:
      //   return FadeInRoute(page: ProfileContactInfoForm(), settings: settings);
      // case routePostPage:
      //   return FadeInRoute(page: PostPage(), settings: settings);
      //
      // case routeCreatePost:
      //   return CircularRevealRoute(
      //       enterWidget: CreatePostPage(), settings: settings);
      //
      // case postReviewPage:
      //   return FadeInRoute(page: PostReviewPage(), settings: settings);
      //
      // case routeAdditionalInfoForm:
      //   return FadeInRoute(page: AdditionalInfoForm(), settings: settings);
      // case routeRegionalEthnicityInfoForm:
      //   return FadeInRoute(
      //       page: RegionalEthnicityInfoForm(), settings: settings);
      // case routeEducationalDetailsForm:
      //   return FadeInRoute(page: EducationalDetailsForm(), settings: settings);
      //
      // case routeYourInterestForm:
      //   return FadeInRoute(page: YourInterestsForm(), settings: settings);
      //
      // case routeSearchPage:
      //   return FadeInRoute(page: SearchPage(), settings: settings);
      //
      // case routeLocationSearch:
      //   return FadeInRoute(page: LocationSearchPage(), settings: settings);
      // case routeViewKnownLanguage:
      //   return FadeInRoute(page: ViewKnownLanguage(), settings: settings);
      // case routeFeelings:
      //   return FadeInRoute(page: FeelingPage(), settings: settings);
      // case routeGifSearch:
      //   return FadeInRoute(page: GifSearchPage(), settings: settings);
      // case routeTagMember:
      //   return FadeInRoute(page: TagMememberPage(), settings: settings);
      // case routeCreatePollForm:
      //   return FadeInRoute(page: CreatePollForm(), settings: settings);
      // case routeViewForeroomMedia:
      //   return MaterialPageRoute(
      //       builder: (_) => ViewForeRoomMediaPage(), settings: settings);
      // case routeViewEvents:
      //   return FadeInRoute(page: EventTabPage(), settings: settings);
      //
      // case routeCreateEvent:
      //   return FadeInRoute(page: CreateEventForm(), settings: settings);
      // case routeViewPollResult:
      //   return FadeInRoute(page: ViewPollResult(), settings: settings);
      // case routeEventDetails:
      //   return FadeInRoute(page: EventsDetailPage(), settings: settings);
      // case routeMemberDetails:
      //   return FadeInRoute(page: MemberProfliePage(), settings: settings);
      // case routeAddMemberInTree:
      //   return MaterialPageRoute(
      //       builder: (_) => AddFamilyMemberForm(), settings: settings);
      //
      // case routeViewTreeMember:
      //   return FadeInRoute(page: ViewTreeMember(), settings: settings);
      //
      // case routeDnaProductListing:
      //   return FadeInRoute(page: DNAProductListingPage(), settings: settings);
      //
      // case routeListAttendeesRoute:
      //   return FadeInRoute(page: AttendeesSearchPage(), settings: settings);
      // case routeSearchAlbumRoute:
      //   return FadeInRoute(page: SearchAlbumPage(), settings: settings);
      //
      // case routeDnaProductDetails:
      //   return FadeInRoute(page: DnaProductDetailsPage(), settings: settings);
      // case routeDnaCart:
      //   return FadeInRoute(page: DnaCartPage(), settings: settings);
      // case routeDnaAddress:
      //   return FadeInRoute(page: DnaAddressForm(), settings: settings);
      // case routeDnaMyOrder:
      //   return FadeInRoute(page: DnaMyOrders(), settings: settings);
      //
      // case routeFaq:
      //   return FadeInRoute(page: FaqPage(), settings: settings);
      // case routeNotification:
      //   return FadeInRoute(page: NotificationPage(), settings: settings);
      //
      // case routeWillLandingPage:
      //   return FadeInRoute(page: WillLandingPage(), settings: settings);
      // case routeWillPersonalInfoForm:
      //   return FadeInRoute(page: WillPersonalInfoForm(), settings: settings);
      // case routeWillBeneficaryPage:
      //   return FadeInRoute(page: WillBeneficaryPage(), settings: settings);
      // case routeWillAllocationPage:
      //   return FadeInRoute(page: WillAllocationPage(), settings: settings);
      // case routeWillAddExecutor:
      //   return FadeInRoute(page: WillAddExceutorPage(), settings: settings);
      // case routeWillSelfiePage:
      //   return FadeInRoute(page: WillSelfiePage(), settings: settings);
      // case routeWillNotarize:
      //   return FadeInRoute(page: WillNotarizePage(), settings: settings);
      // case routeWillSelfiePreview:
      //   return FadeInRoute(page: WillSelfiePreview(), settings: settings);
      // case routeWillFaqPage:
      //   return FadeInRoute(page: WillFaqPage(), settings: settings);
      // case routeRewardsPage:
      //   return FadeInRoute(page: RewardsLandingPage(), settings: settings);
      //
      // case routeCensusDashboard:
      //   return FadeInRoute(page: CensusDashBoard(), settings: settings);
      //
      // case routeCensusPage1:
      //   return FadeInRoute(page: CensusForm1(), settings: settings);
      // case routeCensusPage2:
      //   return FadeInRoute(page: CensusForm2(), settings: settings);
      //
      // case routeCensusPage3:
      //   return FadeInRoute(page: CensusForm3(), settings: settings);
      //
      // case routeCensusPage4:
      //   return FadeInRoute(page: CensusForm4(), settings: settings);
      //
      // case routeCensusPage5:
      //   return FadeInRoute(page: CensusForm5(), settings: settings);
      // case routeCensusPage6:
      //   return FadeInRoute(page: CensusForm6(), settings: settings);
      // case routeCensusPage7:
      //   return FadeInRoute(page: CensusForm7(), settings: settings);
      // case routeCensusPage8:
      //   return FadeInRoute(page: CensusForm8(), settings: settings);
      // case routeAgeSelectionPage:
      //   return FadeInRoute(page: AgeSelectionPage(), settings: settings);
      //
      // case routeIntro:
      //   return FadeInRoute(page: IntroScreen(), settings: settings);
      //
      // case routeVerifiedSuccess:
      //   return FadeInRoute(
      //       page: UserVerifiedSuccessfully(), settings: settings);
      // case routeProfileCreatedSuccess:
      //   return FadeInRoute(
      //       page: ProfileCreatedSuccessfully(), settings: settings);
      // case routeMemberAddedSuccess:
      //   return FadeInRoute(page: MemberAddedSuccessfully(), settings: settings);
      // case routeCreateNewAlbum:
      //   return FadeInRoute(page: CreateNewAlbumPage(), settings: settings);
      // case routeGlobalSearch:
      //   return FadeInRoute(page: GlobalSearchPage(), settings: settings);
      // case routeGodfatherView:
      //   return FadeInRoute(page: GodFatherCreationView(), settings: settings);
      // case routeOtherGodfatherForm:
      //   return FadeInRoute(
      //       page: OtherGodfatherMemberForm(
      //         memberName: '',
      //       ),
      //       settings: settings);
      // case routeRecipeCreation:
      //   return FadeInRoute(page: RecipeCreationPage(), settings: settings);
      // case routeZodiacSignsLanding:
      //   return FadeInRoute(page: ZodiacSignsLandingPage(), settings: settings);
      // case routeAstrologyLanding:
      //   return FadeInRoute(page: AstrologyLandingPage(), settings: settings);
      //
      // case routeZodiacDetails:
      //   return FadeInRoute(page: ZodiacSignsDetailsPage(), settings: settings);
      // case routeDailyHoroscopeDetails:
      //   return FadeInRoute(
      //       page: DailyHoroscopeDetailsPage(), settings: settings);

      // case routeFaceML:
      //   return FadeInRoute(page: FacePage(), settings: settings);

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

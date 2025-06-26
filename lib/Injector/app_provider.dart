import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/history/history_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/food_logger_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repository/FirebaseAuth/firebase_authservice.dart';
import '../repository/LoginService/login_service.dart';
import '../viewmodel/dashboard/dashboard_viewmodel.dart';
import '../viewmodel/login/login_view_model.dart';
import '../viewmodel/login/user_basic_details_view_model.dart';
import 'app_injector.dart';

class AppProvider {
  static AppProvider shared = AppProvider();

  List<SingleChildWidget> getProvider() {
    return [
//       ChangeNotifierProvider(
//           create: (_) =>
//               AddMemberViewModel(loginservice: getIt<LoginService>())),
      ChangeNotifierProvider(
          create: (_) => LoginViewModel(
                loginservice: getIt<LoginService>(),
              )),
//       ChangeNotifierProvider(
//           create: (_) => ForgetUserNameOrPasswordViewModel(
//               loginservice: getIt<LoginService>(),
//               firebaseAuthService: getIt<FirebaseAuthService>())),
      ChangeNotifierProvider(create: (_) => UserBasicDetailsViewModel()),
//       ChangeNotifierProvider(
//           create: (_) =>
//               LoginUserNameViewModel(loginService: getIt<LoginService>())),
//       ChangeNotifierProvider(
//           create: (_) =>
//               ResetPasswordViewModel(loginService: getIt<LoginService>())),
//       ChangeNotifierProvider(create: (_) => CountryViewModel()),
//       ChangeNotifierProvider(create: (_) => BottomSheetViewModel()),
      ChangeNotifierProvider(create: (_) => DashboardViewmodel()),
      ChangeNotifierProvider(create: (_) => HistoryViewmodeld()),
      ChangeNotifierProvider(create: (_) => FoodLoggerViewmodel()),
      ChangeNotifierProvider(create: (_) => MealSearchScreenViewmodel()),
//       ChangeNotifierProvider(create: (_) => BasicInfoFormViewModel()),
//       ChangeNotifierProvider(create: (_) => FormAdditionInfoViewModel()),
//       ChangeNotifierProvider(
//           create: (_) => FormContactInfoViewModel(
//               loginservice: getIt<LoginService>(),
//               firebaseAuthService: getIt<FirebaseAuthService>())),
//       ChangeNotifierProvider(create: (_) => FormRegionalEthnicityViewModel()),
//       ChangeNotifierProvider(create: (_) => FormEducationDetailsViewModel()),
//       ChangeNotifierProvider(create: (_) => ProfileViewModel()),
//       ChangeNotifierProvider(create: (_) => SearchPageViewModel()),
//       ChangeNotifierProvider(create: (_) => FormYourInterestViewModel()),
//       ChangeNotifierProvider(create: (_) => ProfileCompletionViewModel()),
//       ChangeNotifierProvider(create: (_) => LocationSearchPageViewModel()),
//       ChangeNotifierProvider(create: (_) => FeelingViewModel()),
//       ChangeNotifierProvider(create: (_) => CreatePostPageViewModel()),
//       ChangeNotifierProvider(create: (_) => GifSearchPageViewModel()),
//       // ForeRoomViewModel
//       // ChangeNotifierProvider(create: (_) => ForeRoomViewModel()),
//       ChangeNotifierProvider(create: (_) => ForeRoomViewModelNew()),
//       ChangeNotifierProvider(create: (_) => CreatePollViewModel()),
//       // ViewForeroomMediaViewModel
//       ChangeNotifierProvider(create: (_) => ViewForeroomMediaViewModel()),
//       // CreateEventViewModel
//       ChangeNotifierProvider(create: (_) => EventManagerViewModel()),
//       ChangeNotifierProvider(create: (_) => ViewEventViewModel()),
//       // amilyTreeViewModel
//       ChangeNotifierProvider(create: (_) => FamilyTreeViewModel()),
//       //
//       ChangeNotifierProvider(create: (_) => MemberProfileViewModel()),
//       // AddTreeMemeberViewModel
//       ChangeNotifierProvider(create: (_) => AddTreeMemberViewModel()),
//       ChangeNotifierProvider(create: (_) => ForeroomCommentPageViewModel()),
//
//       // CommentWidgetViewModel
//       ChangeNotifierProvider(create: (_) => CommentWidgetViewModel()),
//       // DnaProductListingViewModel
//       ChangeNotifierProvider(create: (_) => DnaProductListingViewModel()),
//       // AttendeesListViewModel
//       ChangeNotifierProvider(create: (_) => AttendeesListViewModel()),
//
//       ChangeNotifierProvider(create: (_) => DnaProductDetailsViewModel()),
//       ChangeNotifierProvider(create: (_) => DnaCartViewModel()),
//       ChangeNotifierProvider(create: (_) => DnaAddressFormViewmodel()),
//       ChangeNotifierProvider(create: (_) => DnaMyOrderViewModel()),
//       ChangeNotifierProvider(create: (_) => FAQViewModel()),
//       ChangeNotifierProvider(create: (_) => FAQOptionsViewModel()),
//       ChangeNotifierProvider(create: (_) => WillPersonalFormViewModel()),
//       // WillAddBeneficaryViewModel
//
//       ChangeNotifierProvider(create: (_) => WillAddBeneficaryViewModel()),
//       // WillAllocationViewModel
//       ChangeNotifierProvider(create: (_) => WillAllocationViewModel()),
//       // WillAddExecutorViewModel
//       ChangeNotifierProvider(create: (_) => WillAddExecutorViewModel()),
//       // WillSelfieAuthViewModel
//       ChangeNotifierProvider(create: (_) => WillSelfieAuthViewModel()),
//       // WillLandingPageViewModel
//       ChangeNotifierProvider(
//           create: (_) => WillLandingPageViewModel(
//               firebaseAuthService: getIt<FirebaseAuthService>())),
//
// // Rewards
//
//       ChangeNotifierProvider(create: (_) => RewardsLandingPageViewModel()),
//       // RewardsTransactionViewModel
//       ChangeNotifierProvider(create: (_) => RewardsTransactionViewModel()),
//       // RewardTabPageViewModel
//       ChangeNotifierProvider(create: (_) => RewardTabPageViewModel()),
//       ChangeNotifierProvider(create: (_) => CensusFormViewModel()),
//       ChangeNotifierProvider(create: (_) => FeedbackViewModel()),
//       ChangeNotifierProvider(create: (_) => IntroViewModel()),
//       ChangeNotifierProvider(create: (_) => NotificationViewModel()),
//       ChangeNotifierProvider(create: (_) => GodFatherCreationViewModel()),
//       ChangeNotifierProvider(
//           create: (_) => OtherGodfatherMemberFormViewModel()),
//       ChangeNotifierProvider(create: (_) => AstrologyViewModel()),
//
// // coachmark
//       ChangeNotifierProvider(create: (_) => CoachMarksViewmodel()),
//
// // Global Search
//       ChangeNotifierProvider(create: (_) => GlobalSearchViewmodel()),
// // Recipes
//       ChangeNotifierProvider(create: (_) => RecipesViewModel()),
//       ChangeNotifierProvider(create: (_) => ChatViewModel()),
    ];
  }
}

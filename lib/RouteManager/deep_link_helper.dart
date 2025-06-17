import 'package:flutter/material.dart';
import 'package:nutriya/views/splash/splash_screen.dart';

import 'package:provider/provider.dart';

import 'app_routes.dart';

class DeeepLinkHelper {
  DeeepLinkHelper._();

  static DeeepLinkHelper _shared = DeeepLinkHelper._();

  factory DeeepLinkHelper() {
    return _shared;
  }

  Route<dynamic> handleDeepLink({required String routeLink}) {
    String pageFor = "";
    RegExp regex = RegExp(r"page=([^&]+)");

    // Match the regex pattern against the string
    Match? match = regex.firstMatch(routeLink);
    if (match != null) {
      pageFor = match.group(1) ?? "";
    }
    // Extract productId if a match is found

    try {
      switch (pageFor.toLowerCase()) {
        // case "foreroom":
        //   return MaterialPageRoute(
        //       builder: (_) => DashBoardPage(),
        //       settings: RouteSettings(name: routeDashboard));
        // case "createpost":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.navigationContext!
        //       .read<CreatePostPageViewModel>()
        //       .isEditingPost = false;
        //
        //   return MaterialPageRoute(
        //       builder: (_) => CreatePostPage(),
        //       settings: RouteSettings(name: routeCreatePost));
        // case "productlisting":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.navigationContext!
        //       .read<CreatePostPageViewModel>()
        //       .isEditingPost = false;
        //
        //   return MaterialPageRoute(
        //       builder: (_) => DNAProductListingPage(),
        //       settings: RouteSettings(name: routeDnaProductListing));
        //
        // case "createevent":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.pushNamed(routeViewEvents);
        //   appNavigator.navigationContext!
        //       .read<ViewEventViewModel>()
        //       .setSelectedEvent(
        //           selectedEvent: null, isPastEventSelected: false);
        //
        //   return FadeInRoute(
        //       page: CreateEventForm(),
        //       settings: RouteSettings(name: routeCreateEvent));
        //
        // case "createpoll":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return FadeInRoute(
        //       page: CreatePollForm(),
        //       settings: RouteSettings(name: routeCreatePollForm));
        // case "familytree":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return FadeInRoute(
        //       page: DashBoardPage(
        //         navigateToIndex: 1,
        //       ),
        //       settings: RouteSettings(name: routeDashboard));
        //
        // case "addmember":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return MaterialPageRoute(
        //       builder: (_) => AddFamilyMemberForm(),
        //       settings: RouteSettings(name: routeAddMember));
        //
        // case "myrewards":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return FadeInRoute(
        //       page: RewardsLandingPage(),
        //       settings: RouteSettings(name: routeRewardsPage));
        //
        // case "earn":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.pushNamed(routeRewardsPage);
        //
        //   return MaterialPageRoute(
        //       builder: (_) => RewardsTabsPage(
        //             navigateTo: 1,
        //           ));
        //
        // case "transactions":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.pushNamed(routeRewardsPage);
        //
        //   return MaterialPageRoute(
        //       builder: (_) => RewardsTabsPage(
        //             navigateTo: 2,
        //           ));
        // case "redeem":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.pushNamed(routeRewardsPage);
        //
        //   return MaterialPageRoute(
        //       builder: (_) => RewardsTabsPage(
        //             navigateTo: 0,
        //           ));
        // case "notifications":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return FadeInRoute(
        //       page: NotificationPage(),
        //       settings: RouteSettings(name: routeNotification));
        //
        // case "settings_faq":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return FadeInRoute(
        //       page: FaqPage(), settings: RouteSettings(name: routeFaq));
        //
        // case "settings_contactus":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return MaterialPageRoute(
        //       builder: (_) => LinkViewerPage(
        //           webUrl: AppEnvironment.baseUrl + "contact",
        //           pageTitile: "Contact Us"));
        // case "settings_feedback":
        //   appNavigator.pushNamed(routeDashboard);
        //
        //   return MaterialPageRoute(builder: (_) => FeedbackPage());
        // case "privacy_policy":
        //   appNavigator.pushNamed(routeDashboard);
        //   return MaterialPageRoute(
        //       builder: (context) => LinkViewerPage(
        //           webUrl: "https://kintree.com/privacy-policy-webview/",
        //           pageTitile: "Privacy Policy"));
        // case "refund_cancellation_policy":
        //   appNavigator.pushNamed(routeDashboard);
        //   return MaterialPageRoute(
        //       builder: (context) => LinkViewerPage(
        //           webUrl: "https://kintree.com/cancellation-and-refund-policy-webview/",
        //           pageTitile: "Refund and Cancellation Policy"));
        //
        // case "shipping_delivery_policy":
        //   appNavigator.pushNamed(routeDashboard);
        //   return MaterialPageRoute(
        //       builder: (context) => LinkViewerPage(
        //           webUrl: "https://kintree.com/shipping-and-delivery-policy-webview/",
        //           pageTitile: "Shipping and Delivery Policy"));
        // case "terms_conditions":
        //   appNavigator.pushNamed(routeDashboard);
        //   return MaterialPageRoute(
        //       builder: (context) => LinkViewerPage(
        //           webUrl: "https://kintree.com/terms-and-condition-webview/",
        //           pageTitile: "Terms and Conditions"));
        // case "product_details":
        //   appNavigator.pushNamed(routeDashboard);
        //   RegExp regex = RegExp(r"productId=(\d+)");
        //
        //   // Match the regex pattern against the string
        //   Match? match = regex.firstMatch(routeLink);
        //
        //   // Extract productId if a match is found
        //   String? productId = "";
        //   if (match != null) {
        //     productId = match.group(1);
        //   }
        //   appNavigator.navigationContext!
        //       .read<DnaProductDetailsViewModel>()
        //       .getProductDetail(
        //           productId: productId ?? "", callBack: (value) {});
        //   return FadeInRoute(
        //       page: DnaProductDetailsPage(),
        //       settings: RouteSettings(
        //         name: routeDnaProductDetails,
        //       ));
        // case "cart":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.pushNamed(routeDnaProductListing);
        //   return FadeInRoute(
        //       page: DnaCartPage(), settings: RouteSettings(name: routeDnaCart));
        //
        // case "order_listing":
        //   appNavigator.pushNamed(routeDashboard);
        //   return FadeInRoute(
        //       page: DnaMyOrders(),
        //       settings: RouteSettings(name: routeDnaMyOrder));
        // case "post_details":
        //   appNavigator.pushNamed(routeDashboard);
        //   RegExp regex = RegExp(r"post_id=(\d+)");
        //
        //   // Match the regex pattern against the string
        //   Match? match = regex.firstMatch(routeLink);
        //
        //   // Extract productId if a match is found
        //   String? postId = "";
        //   if (match != null) {
        //     postId = match.group(1);
        //   }
        //   return MaterialPageRoute(
        //       builder: (_) => ForeRoomExpandedPostPage(
        //             isOptionClickable: true,
        //             postId: postId ?? "",
        //           ));
        //
        // case "album":
        //   appNavigator.pushNamed(routeDashboard);
        //   appNavigator.navigationContext!
        //       .read<CreatePostPageViewModel>()
        //       .isEditingPost = false;
        //
        //   return MaterialPageRoute(
        //       builder: (_) => CreatePostPage(),
        //       settings: RouteSettings(name: routeCreatePost));
        // case "will":
        //   appNavigator.pushNamed(routeDashboard);
        //   return FadeInRoute(
        //       page: WillLandingPage(),
        //       settings: RouteSettings(name: routeWillLandingPage));

        case "splash":
          return MaterialPageRoute(
              builder: (_) => SplashScreen(),
              settings: RouteSettings(name: routeSplash));
        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('No route defined for '),
                    ),
                  ));
      }
    } catch (e) {
      print(e);
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for '),
                ),
              ));
    }
  }
}

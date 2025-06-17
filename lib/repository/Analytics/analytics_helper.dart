// import 'dart:io';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/material.dart';
// import 'package:singular_flutter_sdk/singular.dart';
// import 'package:singular_flutter_sdk/singular_config.dart';
// import 'package:singular_flutter_sdk/singular_link_params.dart';
// import 'package:webengage_flutter/webengage_flutter.dart';
//
// class AnalyticsHelper {
//   static late SingularConfig config;
//   static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//
//   AnalyticsHelper._();
//
//   static AnalyticsHelper get shared => AnalyticsHelper._();
//
//   init() {
//     config = SingularConfig(SINGULAR_API_KEY, SINGULAR_SECRET_KEY);
//
//     config.singularLinksHandler = (SingularLinkParams params) {
//       String? deeplink = params.deeplink;
//
//       Map? urlParameters = params.urlParameters;
//       // Add your code here to handle the deep link
//       print("Received Deep Link is ${deeplink}, parameters  ${urlParameters}");
//       print("url ${urlParameters?["_dl"]}");
//       String androidLink = urlParameters?["_dl"] ?? "";
//       if (Platform.isAndroid) {
//         if (getIt<LocalDataManager>().userId != "") {
//           Navigator.of(appNavigator.navigationContext!).push(DeeepLinkHelper()
//               .handleDeepLink(
//                   routeLink:
//                       Platform.isAndroid ? androidLink : (deeplink ?? "")));
//         } else {
//           AppDecoration.showToast(message: "Please Login");
//         }
//       }
//     };
//
//     Singular.start(config);
//   }
//
//   trackUserEvent(
//       {required String eventName, Map<String, dynamic> data = const {}}) {
//     if (!AppEnvironment.isDebug) {
//       analytics.logEvent(name: eventName, parameters: data);
//       Singular.event(eventName);
//     }
//   }
//
//   loginUser(
//       {String firstName = "",
//       String lastName = "",
//       String gender = "",
//       String mobileNumber = "",
//       String email = "",
//       String birthDate = "",
//       String kinCoins = ""}) {
//     WebEngagePlugin.userLogin("KIN_${getIt<LocalDataManager>().userId}");
//     WebEngagePlugin.setUserFirstName(firstName);
//     WebEngagePlugin.setUserLastName(lastName);
//     WebEngagePlugin.setUserGender(gender);
//     WebEngagePlugin.setUserEmail(email);
//     WebEngagePlugin.setUserBirthDate(birthDate);
//     WebEngagePlugin.setUserAttribute("KinCoins", kinCoins);
//   }
//
//   trackWebEngageEvent(
//       {required String eventName, Map<String, dynamic> parameters = const {}}) {
//     List<String> name =
//         eventName.split(" ").toList().map((e) => e.toSentenceCase()).toList();
//
//     WebEngagePlugin.trackEvent(name.join(""), parameters);
//   }
//
//   trackCategoryViewed({required String categoryViewed}) {
//     trackWebEngageEvent(
//         eventName: "CategoryViewed", parameters: {"type": categoryViewed});
//   }
// }

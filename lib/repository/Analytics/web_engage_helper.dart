// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:kintree/Injector/app_injector.dart';
// import 'package:kintree/RouteManager/deep_link_helper.dart';
// import 'package:kintree/RouteManager/navigator_service.dart';
// import 'package:kintree/extension/extension_map.dart';
// import 'package:kintree/utils/LocalData/local_data_manager.dart';
// import 'package:kintree/utils/styles/app_decoration.dart';
// import 'package:webengage_flutter/webengage_flutter.dart';
//
// class WebEngageHelper {
//   WebEngagePlugin? _webEngagePlugin;
//
//   WebEngagePlugin? get instance => _webEngagePlugin;
//
//   handleNavigation(Map<String, dynamic> data) {
//     try {
//       var actionLink = data["actions"];
//
//       if (Platform.isIOS) {
//         String iosLink = "";
//
//         for (var action in actionLink) {
//           if ((action["actionLink"] as String).contains("/Ccppc/")) {
//             iosLink = action["actionLink"];
//             break;
//           }
//         }
//
//         if (getIt<LocalDataManager>().userId != "") {
//           String plainUrl = Uri.decodeComponent(iosLink);
//           Navigator.of(appNavigator.navigationContext!)
//               .push(DeeepLinkHelper().handleDeepLink(routeLink: plainUrl));
//         } else {
//           AppDecoration.showToast(message: "Please Login");
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   init() {
//     _webEngagePlugin = WebEngagePlugin();
//     _webEngagePlugin?.setUpInAppCallbacks((message, s) {
//       print("On In app click is Called");
//       handleNavigation(message ?? {});
//     }, (message) {
//       print("On In app Show is Called");
//       print(message);
//     }, (message) {}, (message) {});
//   }
// }

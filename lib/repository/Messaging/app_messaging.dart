import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';


import '../../Injector/app_injector.dart';
import '../../utils/LocalData/local_data_manager.dart';

class AppMessaging {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<String?> getFcmToken() async {
    if (Platform.isIOS) {
      final fcmToken = await getIt<LocalDataManager>().getFcmToken();
      return fcmToken;
    } else {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      return fcmToken;
    }
  }

  static requestNotificationPermission() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      criticalAlert: true,
      sound: true,
      carPlay: true,
      badge: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("authorized");
      getFcmToken();
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("authorized");
      getFcmToken();
    } else {
      //AppSettings.openNotificationSettings(callback: () {});
      print("redirecting user");
    }
  }

  // static initializeMessaging() async {

  //   await requestNotificationPermission();
  // }
}

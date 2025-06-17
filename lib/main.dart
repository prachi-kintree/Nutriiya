import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriya/repository/Messaging/app_messaging.dart';
import 'package:nutriya/translation/codegen_loader.g.dart';
import 'package:nutriya/utils/LocalData/local_data_manager.dart';
import 'package:nutriya/utils/notification/notification.dart';

import 'Injector/app_injector.dart';
import 'app_entry.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  // ));

  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();

  // AppMessaging.requestNotificationPermission();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
  ]);
  AppInjector.injectDependency();
  getIt<LocalDataManager>().initialize();
  debugPrint("Token ------ ${getIt<LocalDataManager>().userToken}");
  //await AppRemoteConfig.initConfig();

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    // AppDecoration.showToast(message: "Error Encountered");
  };
  // AppEnvironment.setUp(appFor: Environment.dev);

  // FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
  //   if (Platform.isAndroid) {
  //     await NotificationService().showNotifications(
  //       0,
  //       event.data['title'] ?? "New notification",
  //       event.data['body'],
  //     );
  //   } else {
  //     await NotificationService().showNotifications(
  //       0,
  //       event.notification?.title ?? "New notification",
  //       event.notification?.body,
  //     );
  //   }
  // });
  runApp(EasyLocalization(
      path: "assets/translations",
      fallbackLocale: const Locale("en"),
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale("ar"),
        Locale("bn"),
        Locale("en"),
        Locale("es"),
        Locale("fr"),
        Locale("gu"),
        Locale("hi"),
        Locale("kn"),
        Locale("ml"),
        Locale("mr"),
        Locale("ta"),
        Locale("te"),
        Locale("ur"),
        Locale("zh")
      ],
      child: const AppEntry()));
}


// HEAD detached at 3.13.6

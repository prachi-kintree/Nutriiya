import 'dart:io';

import 'package:connectivity_watcher/connectivity_watcher.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_watcher/controller/connectivity_controller.dart';
import 'package:connectivity_watcher/widgets/connection_aware_app.dart';
import 'package:connectivity_watcher/widgets/custom_no_internet.dart';

import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutriya/repository/AppDetailService/app_detail_service.dart';
import 'package:nutriya/translation/locale_keys.g.dart';
import 'package:nutriya/utils/CustomWidgets/restart_app.dart';
import 'package:nutriya/utils/LocalData/local_data_manager.dart';
import 'package:nutriya/utils/app_string/app_image_path.dart';
import 'package:nutriya/utils/notification/notification.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';
import 'package:nutriya/utils/styles/app_text_styles.dart';
import 'package:nutriya/utils/theme/app_theme_color.dart';
import 'package:nutriya/utils/theme/theme_model.dart';

import 'package:provider/provider.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';
import 'package:uuid/uuid.dart';

import 'Injector/app_injector.dart';
import 'Injector/app_provider.dart';
import 'RouteManager/navigator_service.dart';
import 'RouteManager/route_manager.dart';
import 'extension/shadow_texfield_border.dart';


final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// https://medium.getwidget.dev/effective-error-handling-in-flutter-tips-and-techniques-2bf9298a02e7

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  // This widget is the root of your application.
  // final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    // _notificationService.init();
    getIt<AppDetailService>().setAppDetails();
    // getIt<WebEngageHelper>().init();

    // InternetConnectivityService().startMonitoring();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      String uuid = Uuid().v1();
      getIt<LocalDataManager>().setUniqueAndroidId(uuid);
    }
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ThemeManagerPlus<AppTheme>(
          lightTheme: lightTheme,
          darkTheme: Darktheme,
          currentTheme: lightTheme,
          child: RestartApp(builder: (context, route) {
            print("Restart app with ${route}");
            return MultiProvider(
              providers: AppProvider.shared.getProvider(),
              child:
            //     // ConnectionAwareApp(
            //   //     connectivityStyle: NoConnectivityStyle.CUSTOM,
            //   //     // noInternetText: AppDecoration.showToast(
            //   //     //     message: "No Internet Connection"),
            //   //     offlineWidget: CustomNoInternetWrapper(builder: (context) {
            //   //       AppDecoration.showToast(message: LocaleKeys.no_internet_connection.tr());
            //   //       // return SizedBox.shrink();
            //   //       return CustomNoInternet();
            //   //     }),
            //   //     builder: (context, connectionKey) {
            //   //       appNavigator.setNavigationKey(connectionKey);
            //   //       print("Building");
            //   //       return
            //
            //           Builder(builder: (context) {
            //           // context
            //           //     .read<FormAdditionInfoViewModel>()
            //           //     .getLanguagesKnowData();
            //           // // context
            //           // //    .read<WillPersonalFormViewModel>()
            //           // //    .getDesignationsList();
            //           // context
            //           //     .read<FormAdditionInfoViewModel>()
            //           //     .getOccupations();
            //           // context
            //           //     .read<FormEducationDetailsViewModel>()
            //           //     .getEducationList();
            //
            //           print("Calling regional list");
                     MaterialApp(
                          scrollBehavior:
                              ScrollConfiguration.of(context).copyWith(
                            overscroll: false,
                          ),
                          debugShowCheckedModeBanner: false,
                          builder: (context, widget) {
                            Widget error = const Text('...rendering error...',
                                style: TextStyle(
                                  color: Colors.transparent,
                                  decoration:
                                      TextDecoration.none, // Removes underline
                                ));
                            if (widget is Scaffold || widget is Navigator) {
                              error = Scaffold(body: Center(child: error));
                            }
                            ErrorWidget.builder = (errorDetails) => error;
                            if (widget != null) return widget;
                            throw ('widget is null');
                          },
                          initialRoute: route,
                          navigatorKey: appNavigator.navigationKey,
                          onGenerateRoute: AppRouteManager.shared.generateRoute,
                          localizationsDelegates: context.localizationDelegates,
                          supportedLocales: context.supportedLocales,
                          locale: context.locale,
                          navigatorObservers: [routeObserver],
                          theme: ThemeData(
                            useMaterial3: false,
                            primaryColor: Color(0xFF943F7F),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            bottomSheetTheme: BottomSheetThemeData(
                                backgroundColor: Colors.transparent),
                            textSelectionTheme: TextSelectionThemeData(),
                            inputDecorationTheme: InputDecorationTheme(
                              border: DecoratedInputBorder(
                                  child: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )),
                                  shadow: BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 1.0),
                                  )),
                            ),
                          ),
                          title: 'Kintree',

                      ));
            //         })
            //       // }),
            // );
          }),
        );
      },
    );
  }
}

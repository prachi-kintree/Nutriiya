import 'package:flutter/material.dart';

import '../../RouteManager/app_routes.dart';
import '../../RouteManager/route_manager.dart';

class RestartApp extends StatefulWidget {
  Widget Function(BuildContext context, String Route) builder;
  static String route = routeSplash;

  RestartApp({
    super.key,
    required this.builder
  });
  static void restartApp(BuildContext context, {String? newRoute}) {
    route =
        // newRoute ??
        routeSplash;
    context.findAncestorStateOfType<_RestartAppState>()!.restartApp();
  }

  @override
  State<RestartApp> createState() => _RestartAppState();
}

class _RestartAppState extends State<RestartApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: Builder(builder: (context) {
        print("Cameeeee herer100 $hasLogout");
        return widget.builder(context,
            RestartApp.route);
      }),
    );
  }
}

import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppRemoteConfig {
  static FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(
          seconds: 1), // a fetch will wait up to 10 seconds before timing out
      minimumFetchInterval: const Duration(
          seconds:
              10), // fetch parameters will be cached for a maximum of 1 hour
    ));

    _fetchConfig();
  }

  // Fetching, caching, and activating remote config
  static void _fetchConfig() async {
    if (Platform.isAndroid) {
      await _remoteConfig.fetchAndActivate();
    }
  }

  static getString({required String field}) {
    if (Platform.isAndroid) {
      // RemoteConfigValue data = _remoteConfig.getValue("feature_flag");
      // Map<String, dynamic> mapValues = json.decode(data.asString());
      // print(mapValues["feature_list"]);
    }
  }
}

import 'package:nutriya/model/AppDetailModel/app_detail_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppDetailService {
  AppDetailModel? appDetails;

  setAppDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String packageName = packageInfo.packageName;
    print("-------+++---------$packageName");
    String version = packageInfo.version;
    print("-------+++---------$version");


    appDetails = AppDetailModel(packageName: packageName, appVersion: version);
    print("_______ ${appDetails?.appVersion}");
  }
}

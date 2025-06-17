import 'package:get_it/get_it.dart';
import 'package:nutriya/repository/FirebaseAuth/firebase_authservice.dart';
import 'package:nutriya/repository/LoginService/login_service.dart';

import '../repository/AppDetailService/app_detail_service.dart';
import '../repository/FormService/form_service.dart';
import '../repository/TreeService/tree_service.dart';
import '../repository/TreeService/view_member_service.dart';
import '../utils/DataBase/database_service.dart';
import '../utils/Helper/contact_helper.dart';
import '../utils/Helper/date_helper.dart';
import '../utils/ImageManager/image_manager.dart';
import '../utils/LocalData/local_data_manager.dart';
import '../utils/TextFieldValidator/fleld_validator.dart';



GetIt getIt = GetIt.instance;

class AppInjector {
  static injectDependency() {

    getIt.registerLazySingleton<LoginService>(() => LoginService());
    // getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
    getIt.registerLazySingleton<AppDetailService>(() => AppDetailService());
    getIt.registerLazySingleton<LocalDataManager>(() => LocalDataManager());
    // ContactHelper
    getIt.registerLazySingleton<ContactHelper>(() => ContactHelper());
    getIt.registerLazySingleton<FieldValidator>(() => FieldValidator());
    // FormService
    getIt.registerLazySingleton<FormService>(() => FormService());
    // ImagePickerManager
    getIt.registerLazySingleton<ImagePickerManager>(() => ImagePickerManager());

    getIt.registerLazySingleton<DateHelper>(() => DateHelper());

    getIt.registerLazySingleton<TreeHelper>(() => TreeHelper());

    getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());

    getIt.registerLazySingleton<ViewMemberService>(() => ViewMemberService());

  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/data/data_sources/remote_data_source.dart';
import 'package:menofia_military/data/network/network_info.dart';
import 'package:menofia_military/data/repository/repository_impl.dart';
import 'package:menofia_military/domain/repository/repository.dart';
import 'package:menofia_military/domain/usecases/get_attendance_report_usecase.dart';
import 'package:menofia_military/domain/usecases/register_students_attendance_usecase.dart';
import 'package:menofia_military/domain/usecases/student_login_usecase.dart';
import 'package:menofia_military/domain/usecases/super_login_usecase.dart';
import 'package:menofia_military/presentation/student/student_login/view_model/student_login_view_model.dart';
import 'package:menofia_military/presentation/student/student_main/pages/student_qr/view_model/student_qr_generator_view_model.dart';
import 'package:menofia_military/presentation/super/super_login/view_model/super_login_view_model.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance/view_modle/super_attendance_view_model.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_scan/view_model/super_scan_attendance_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InjectionContainer {
  static Future<void> init() async {
    final getStorage = GetStorage();
    await getStorage.initStorage;

    Get.put<LocalStorageHelper>(
      LocalStorageHelperImpl(
        getStorage: getStorage,
      ),
      permanent: true,
    );
    Get.put<NetworkInfo>(
      NetworkInfoImpl(
        internetConnectionChecker: InternetConnectionChecker.instance,
      ),
    );
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
    Get.put<FirebaseFirestore>(
      FirebaseFirestore.instance,
      permanent: true,
    );
    Get.put<RemoteDataSource>(
      RemoteDataSourceImpl(
        firebaseFirestore: Get.find(),
        firebaseAuth: Get.find(),
      ),
    );

    Get.put<Repository>(
      RepositoryImpl(
        remoteDataSource: Get.find(),
        networkInfo: Get.find(),
      ),
    );
  }
}

final instance = GetIt.instance;

Future<void> initAppModules() async {
  //SharedPrefs instance

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  //AppPrefs instance

  instance.registerLazySingleton<AppPrefs>(
    () => AppPrefs(
      sharedPreferences: instance(),
    ),
  );

  //Network info instance

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: InternetConnectionChecker.createInstance(),
    ),
  );
  //FirebaseFireStore instance

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  instance.registerLazySingleton<FirebaseFirestore>(
    () => firebaseFirestore,
  );

//FirebaseAuth instace

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  instance.registerLazySingleton<FirebaseAuth>(
    () => firebaseAuth,
  );
  //Remotedatasoucre instance

  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      firebaseFirestore: instance(),
      firebaseAuth: instance(),
    ),
  );

  //Repository instance

  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: instance(),
      networkInfo: instance(),
    ),
  );
}

void initStudentLoginModule() {
  if (GetIt.I.isRegistered<StudentLoginUsecase>()) {
    return;
  }
  instance.registerFactory(
    () => StudentLoginUsecase(
      repository: instance(),
    ),
  );

  instance.registerFactory(
    () => StudentLoginViewModel(
      loginUseCase: instance(),
      appPrefs: instance(),
    ),
  );
}

void initQRCodeModule() {
  if (GetIt.I.isRegistered<StudentQrGeneratorViewModel>()) {
    return;
  }
  instance.registerFactory(
    () => StudentQrGeneratorViewModel(
      appPrefs: instance(),
    ),
  );
}

void initSuperLoginModule() {
  if (GetIt.I.isRegistered<SuperLoginUsecase>()) {
    return;
  }
  instance.registerFactory(
    () => SuperLoginUsecase(
      repository: instance(),
    ),
  );

  instance.registerFactory(
    () => SuperLoginViewModel(
      superLoginUsecase: instance(),
      appPrefs: instance(),
    ),
  );
}

void initSuperMainModule() {
  if (GetIt.I.isRegistered<RegisterStudentsAttendanceUsecase>()) {
    return;
  }

  //Registering super scan dependencies
  instance.registerFactory(
    () => RegisterStudentsAttendanceUsecase(
      repository: instance(),
    ),
  );

  instance.registerFactory(
    () => SuperScanAttendanceViewModel(
      registerStudentsAttendanceUsecase: instance(),
    ),
  );

  //Registering super report dependencies

  if (GetIt.I.isRegistered<GetAttendanceReportUsecase>()) {
    return;
  }

  instance.registerFactory(
    () => GetAttendanceReportUsecase(
      repository: instance(),
    ),
  );

  instance.registerFactory(
    () => SuperAttendanceViewModel(
      getAttendanceReportUsecase: instance(),
    ),
  );
}

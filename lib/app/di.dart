import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/data/data_sources/remote_data_source.dart';
import 'package:menofia_military/data/network/network_info.dart';
import 'package:menofia_military/data/repository/repository_impl.dart';
import 'package:menofia_military/domain/repository/repository.dart';
import 'package:menofia_military/domain/usecases/get_attendance_report_usecase.dart';
import 'package:menofia_military/domain/usecases/register_students_attendance_usecase.dart';
import 'package:menofia_military/domain/usecases/student_login_usecase.dart';
import 'package:menofia_military/domain/usecases/super_login_usecase.dart';
import 'package:menofia_military/presentation/student_login/view_model/student_login_view_model.dart';
import 'package:menofia_military/presentation/student_main/pages/student_qr/view_model/student_qr_generator_view_model.dart';
import 'package:menofia_military/presentation/super_login/view_model/super_login_view_model.dart';
import 'package:menofia_military/presentation/super_main/pages/super_attendance/view_modle/super_attendance_view_model.dart';
import 'package:menofia_military/presentation/super_main/pages/super_scan/view_model/super_scan_attendance_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

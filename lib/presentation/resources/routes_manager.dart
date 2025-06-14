import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/splash/controller/splash_bindings.dart';
import 'package:menofia_military/presentation/student/student_login/controller/student_login_bindings.dart';
import 'package:menofia_military/presentation/student/student_login/view/student_login_view.dart';
import 'package:menofia_military/presentation/student/student_main/controller/student_main_view_bindings.dart';
import 'package:menofia_military/presentation/student/student_main/controller/student_main_view_controller.dart';
import 'package:menofia_military/presentation/student/student_main/pages/student_qr/controller/student_qr_generator_bindings.dart';
import 'package:menofia_military/presentation/student/student_main/view/student_main_view.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/splash/views/splash_view.dart';
import 'package:menofia_military/presentation/super/super_login/controller/super_login_bindings.dart';
import 'package:menofia_military/presentation/super/super_login/view/super_login_view.dart';
import 'package:menofia_military/presentation/super/super_main/controller/super_main_view_bindings.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance/controller/super_attendance_view_bindings.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance_details/view/super_attendance_details_view.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_scan/controller/super_scan_view_bindings.dart';
import 'package:menofia_military/presentation/super/super_main/view/super_main_view.dart';

abstract class Routes {
  static const String splashRoute = "/";
  static const String studentLoginRoute = "/studentLoginRoute";
  static const String superLoginRoute = "/superLoginRoute";
  static const String registerRoute = "/register";
  static const String unknownRoute = "/unknownRoute";

  static const String studentMainRoute = "/studentMainRoute";
  static const String superMainRoute = "/superMainRoute";
  static const String superAttendanceDetails = "/superAttendanceDetails";
}

abstract class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.studentLoginRoute,
      page: () {
        initStudentLoginModule();
        return StudentLoginView();
      },
      binding: StudentLoginBindings(),
    ),
    GetPage(
      name: Routes.superLoginRoute,
      page: () => SuperLoginView(),
      binding: SuperLoginBindings(),
    ),
    // Uncomment and implement RegisterView if needed
    // GetPage(name: Routes.registerRoute, page: () => const RegisterView()),
    GetPage(
      name: Routes.studentMainRoute,
      page: () => StudentMainView(),
      bindings: [
        StudentMainViewBindings(),
        StudentQrGeneratorBindings(),
      ],
    ),
    GetPage(
      name: Routes.superMainRoute,
      page: () =>  SuperMainView(),
      bindings: [
        SuperAttendanceViewBindings(),
        SuperScanViewBindings(),
        SuperMainViewBindings(),
      ]
    ),
    GetPage(
      name: Routes.superAttendanceDetails,
      page: () => const SuperAttendanceDetailsView(),
    ),
  ];

  static GetPage unknownRoute({required BuildContext context}) {
    return GetPage(
      name: Routes.superAttendanceDetails,
      page: () => Scaffold(
        appBar: AppBar(
          title: Text(
            'Unknow Area',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Center(
          child: Text(
            'Unknow Area',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

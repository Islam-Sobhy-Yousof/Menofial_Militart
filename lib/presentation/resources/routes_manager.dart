import 'package:flutter/material.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/student_login/view/student_login_view.dart';
import 'package:menofia_military/presentation/student_main/student_main_view.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/splash/views/splash_view.dart';
import 'package:menofia_military/presentation/super_login/view/super_login_view.dart';
import 'package:menofia_military/presentation/super_main/pages/super_attendance_details/view/super_attendance_details_view.dart';
import 'package:menofia_military/presentation/super_main/super_main_view.dart';

abstract class Routes {
  static const String splashRoute = "/";
  static const String studentLoginRoute = "/studentLoginRoute";
  static const String superLoginRoute = "/superLoginRoute";
  static const String registerRoute = "/register";

  static const String studentMainRoute = "/studentMainRoute";
  static const String superMainRoute = "/superMainRoute";
  static const String superAttendanceDetails = "/superAttendanceDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.studentLoginRoute:
        initStudentLoginModule();
        return MaterialPageRoute(builder: (_) => const StudentLoginView());
      case Routes.superLoginRoute:
        initSuperLoginModule();
        return MaterialPageRoute(builder: (_) => const SuperLoginView());
      // case Routes.registerRoute:
      //   // initRegisterModule();
      //   return MaterialPageRoute(builder: (_) => const RegisterView());

      case Routes.studentMainRoute:
        initQRCodeModule();
        return MaterialPageRoute(builder: (_) => const StudentMainView());

      case Routes.superMainRoute:
        initSuperMainModule();
        return MaterialPageRoute(builder: (_) => const SuperMainView());

      case Routes.superAttendanceDetails:
        return MaterialPageRoute(
          builder: (_) => const SuperAttendanceDetailsView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}

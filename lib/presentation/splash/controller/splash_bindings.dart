

import 'package:get/get.dart';
import 'package:menofia_military/presentation/splash/controller/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => SplashController());
  }

}
import 'package:get/get.dart';
import 'package:menofia_military/presentation/super/super_main/controller/super_main_view_controller.dart';

class SuperMainViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SuperMainViewController(),);
  }

}
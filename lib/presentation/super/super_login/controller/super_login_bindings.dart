import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/route_manager.dart';
import 'package:menofia_military/domain/usecases/super_login_usecase.dart';
import 'package:menofia_military/presentation/super/super_login/controller/super_login_controller.dart';

class SuperLoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SuperLoginUsecase(
        repository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => SuperLoginController(
        superLogingUsecase: Get.find(),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/domain/usecases/student_login_usecase.dart';
import 'package:menofia_military/presentation/student/student_login/controller/student_login_controller.dart';

class StudentLoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StudentLoginUsecase(
        repository: Get.find(),
      ),
    );
    Get.lazyPut(
     () =>  StudentLoginController(
        studentLoginUsecasetu: Get.find(),
      ),
    );
  }
}



import 'package:get/get.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';

class StudentQrGeneratorController extends GetxController {
  static StudentQrGeneratorController get instance => Get.find();
  final _localStorageHelper = Get.find<LocalStorageHelper>();
  final studnetId = Rxn<String>();

void fetchStudentId(){
studnetId.value = _localStorageHelper.getStudentId();
}
  
}
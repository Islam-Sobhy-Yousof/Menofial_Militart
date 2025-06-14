import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/domain/usecases/student_login_usecase.dart';
import 'package:menofia_military/presentation/common/utils/helpers/show_dialog.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/common/widgets/states/custom_popup.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';

class StudentLoginController extends GetxController {
  static StudentLoginController get instance => Get.find();
  final isLoading = false.obs;
  final areAllInputsValid = false.obs;
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final errorText = Rxn<String>();
  final StudentLoginUsecase _studentLoginUsecase;
  StudentLoginController({
    required StudentLoginUsecase studentLoginUsecasetu,
  }) : _studentLoginUsecase = studentLoginUsecasetu;

  void validateStudnetId() {
    if (num.tryParse(controller.text.trim()) == null) {
      //Studnet Id is not valid and you should return error message
      areAllInputsValid.value = false;
      errorText.value = StringsManager.studentIDError;
      return;
    }
    areAllInputsValid.value = true;
    errorText.value = null;
  }

  void login({required BuildContext context}) async {
    if (!areAllInputsValid.value) return;
    isLoading.value = true;
    AppDialogs.showCustomDialog(
      context: context,
      child: CustomPopup(
        popupMainState: CustomProgressIndicator(),
        popupText: StringsManager.loading,
      ),
    );
    final response = await _studentLoginUsecase(
      input: StudentLoginUsecaseInput(
        studentID: controller.text.trim(),
      ),
    );

    isLoading.value = false;

    response.fold((failure) {
      AppDialogs.showCustomDialog(
        dismissOnTouchOutside: true,
        context: context,
        child: CustomPopup(
          popupMainState: Lottie.asset(
            JsonAssets.error,
          ),
          popupText: StringsManager.studentIDError,
        ),
        
      );
    }, (data) {
      final localStorageHelper = Get.find<LocalStorageHelper>();
     localStorageHelper.setStudentId(studentId: data.studentId);

     localStorageHelper.setStudentName(studentName: data.studentName);

      AppDialogs.dismiss();

      Get.offAllNamed(Routes.studentMainRoute);
    });
  }

  void onChanged(String? _) {
    validateStudnetId();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

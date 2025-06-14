import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/app/helper_functions.dart';
import 'package:menofia_military/domain/usecases/student_login_usecase.dart';
import 'package:menofia_military/domain/usecases/super_login_usecase.dart';
import 'package:menofia_military/presentation/common/utils/helpers/show_dialog.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/common/widgets/states/custom_popup.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';

class SuperLoginController extends GetxController {
  static SuperLoginController get instance => Get.find();
  final isLoading = false.obs;
  final areAllInputsValid = false.obs;
  final toggelPassword = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final emailErrorText = Rxn<String>();
  final passwordErrorText = Rxn<String>();
  final SuperLoginUsecase _superLoginUsecase;
  SuperLoginController({
    required SuperLoginUsecase superLogingUsecase,
  }) : _superLoginUsecase = superLogingUsecase;

  void onShowPasswordIconPressed() {
    toggelPassword.value = !toggelPassword.value;
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
    final response = await _superLoginUsecase(
      input: SuperLoginUsecaseInput(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    isLoading.value = false;

    response.fold((failure) {
      print('islam the failure is : ${failure.code}');
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

      AppDialogs.dismiss();

      Get.offAllNamed(Routes.superMainRoute);
    });
  }

  void _areAllInputsValid() {
    areAllInputsValid.value = _validateEmail() && _vlalidatePassword();
  }

  void onChangeEmail(String? email) {
    _areAllInputsValid();
    _validateEmail();
  }

  void onChangePassword(String? password) {
    _areAllInputsValid();
    _vlalidatePassword();
  }

  bool _validateEmail() {
    if (!validateEmail(
      email: emailController.text.trim(),
    )) {
      emailErrorText.value = StringsManager.emailError;

      return false;
    }
    emailErrorText.value = null;
    return true;
  }

  bool _vlalidatePassword() {
    if (passwordController.text.isEmpty) {
      passwordErrorText.value = StringsManager.passwordError;

      return false;
    }
    passwordErrorText.value = null;
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

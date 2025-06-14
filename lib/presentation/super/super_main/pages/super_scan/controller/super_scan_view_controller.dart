import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menofia_military/app/helper_functions.dart';
import 'package:menofia_military/domain/usecases/register_students_attendance_usecase.dart';
import 'package:menofia_military/presentation/common/utils/helpers/show_dialog.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/common/widgets/states/custom_popup.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/constants_manager.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SuperScanViewController extends GetxController {
  static SuperScanViewController get instance => Get.find();
  final isErrorState = false.obs;
  final isLoadingState = false.obs;

  Timer? _timer;
  final RegisterStudentsAttendanceUsecase _registerStudentsAttendanceUsecase;
  final MobileScannerController mobileScannerController =
      MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  SuperScanViewController(
      {required RegisterStudentsAttendanceUsecase
          registerStudentsAttendanceUsecase})
      : _registerStudentsAttendanceUsecase = registerStudentsAttendanceUsecase;

  void onDetect(dynamic results, BuildContext context) async {
    AppDialogs.dismiss();
    final scannedID = results.barcodes.first.rawValue;
    if (scannedID.isEmpty || !validateStudentID(studentID: scannedID)) {
      isErrorState.value = true;
      isLoadingState.value = false;
      AppDialogs.showCustomDialog(
        context: context,
        child: CustomPopup(
          popupText: StringsManager.wrongQrCodeValue,
          popupMainState: Lottie.asset(
            JsonAssets.error,
          ),
        ),
      );
      return;
    }
    isLoadingState.value = true;
    AppDialogs.showCustomDialog(
      context: context,
      child: CustomPopup(
        popupText: StringsManager.loading,
        popupMainState: CustomProgressIndicator(),
      ),
    );
    final response = await _registerStudentsAttendanceUsecase(
      input: RegisterStudentsAttendanceUsecaseInput(
        studentID: scannedID,
      ),
    );

    response.fold(
      (failure) {
        isErrorState.value = true;
        isLoadingState.value = false;
        AppDialogs.showCustomDialog(
          context: context,
          child: CustomPopup(
            popupText: failure.message,
            popupMainState: Lottie.asset(
              JsonAssets.error,
            ),
          ),
        );
      },
      (data) {
        isLoadingState.value = false;
        isErrorState.value = false;
        AppDialogs.dismiss();

        AppDialogs.showCustomDialog(
          context: context,
          child: CustomPopup(
            popupText: StringsManager.scanSuccessMessage,
            popupMainState: Lottie.asset(
              JsonAssets.success,
            ),
          ),
        );
        _timer = Timer(
          Duration(seconds: ConstantsManager.popUpDelay),
          () {
            AppDialogs.dismiss();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }
}

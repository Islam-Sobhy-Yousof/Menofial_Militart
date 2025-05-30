import 'dart:async';

import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/presentation/base/base_view_model.dart';
import 'package:menofia_military/presentation/common/data_classes/freezed_data_class.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';

class StudentQrGeneratorViewModel extends BaseViewModel
    with StudentQrGeneratorViewModelInputs, StudentQrGeneratorViewModelOutputs {
  //============= Stream Controllers =============
  final StreamController<String> _qrCodeDataStreamController =
      StreamController<String>.broadcast();

  //============= Dependencies =============
  final AppPrefs _appPrefs;

  //============= Data =============
  late StudentQrCodeObject _studentQrCodeObject;

  StudentQrGeneratorViewModel({required AppPrefs appPrefs})
      : _appPrefs = appPrefs;

  //============= Lifecycle =============
  @override
  void start() {
    // addContentState();
    _studentQrCodeObject = StudentQrCodeObject(studentID: AppConstants.empty);
  }

  @override
  void dispose() {
    _qrCodeDataStreamController.close();
    super.dispose();
  }

  @override
  void addContentState() {
    inputState.add(ContentState());
  }

  //============= Inputs =============
  @override
  void generateQR() async {
    inputState.add(PopupLoadingState());
    final qrCodeData = _appPrefs.getString(
      key: AppConstants.studentIdPref,
    );

    if (qrCodeData.isEmpty) {
      inputQrCodeData.add(AppConstants.empty);
      inputState.add(
        PopupErrorState(message: AppStrings.noQRCodeData),
      );
      return;
    }

    _studentQrCodeObject = _studentQrCodeObject.copyWith(studentID: qrCodeData);
    inputQrCodeData.add(_studentQrCodeObject.studentID);
    addContentState();
  }

  @override
  Sink get inputQrCodeData => _qrCodeDataStreamController.sink;

  //============= Outputs =============
  @override
  Stream<String> get outQrCodeData =>
      _qrCodeDataStreamController.stream.map((qrCode) => qrCode);
}

mixin StudentQrGeneratorViewModelInputs {
  void generateQR();
  void addContentState();

  Sink get inputQrCodeData;
}

mixin StudentQrGeneratorViewModelOutputs {
  Stream<String> get outQrCodeData;
}

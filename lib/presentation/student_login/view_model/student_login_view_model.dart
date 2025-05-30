import 'dart:async';

import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/domain/usecases/student_login_usecase.dart';
import 'package:menofia_military/presentation/base/base_view_model.dart';
import 'package:menofia_military/presentation/common/data_classes/freezed_data_class.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';

class StudentLoginViewModel extends BaseViewModel
    with StudentLoginViewModelInputs, StudentLoginViewModelOutputs {
  //============= Stream Controllers =============
  final StreamController<String> _studentIDStreamController =
      StreamController<String>.broadcast();

  final StreamController<void> _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<bool> _isStudentLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  //============= Dependencies =============
  final StudentLoginUsecase _loginUseCase;
  final AppPrefs _appPrefs;
  //============= Data =============
  late StudentObject _loginObject;

  StudentLoginViewModel(
      {required StudentLoginUsecase loginUseCase, required AppPrefs appPrefs})
      : _loginUseCase = loginUseCase,
        _appPrefs = appPrefs;

  //============= Lifecycle =============
  @override
  void start() {
    addContentState();
    _loginObject = StudentObject(studentID: AppConstants.empty);
  }

  @override
  void dispose() {
    _studentIDStreamController.close();
    _areAllInputsValidStreamController.close();
    _isStudentLoggedInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  void addContentState() {
    inputState.add(ContentState());
  }

  //============= Inputs =============
  @override
  void setStudentId({required String studentID}) {
    inputStudentID.add(studentID);
    _loginObject = _loginObject.copyWith(studentID: studentID);
    inputAreAllInputsValid.add(null);
  }

  @override
  void login() async {
    inputState.add(PopupLoadingState());

    final response = await _loginUseCase(
      input: StudentLoginUsecaseInput(
        studentID: _loginObject.studentID,
      ),
    );

    response.fold((failure) {
      inputState.add(
        PopupErrorState(
          message: failure.message,
        ),
      );
    }, (data) {
      addContentState();
      _appPrefs.setString(
        key: AppConstants.studentIdPref,
        value: data.studentId,
      );
      _appPrefs.setString(
        key: AppConstants.studentNamePref,
        value: data.studentName,
      );
      _appPrefs.setString(
        key: AppConstants.studentCollegePref,
        value: data.studentCollege,
      );
      inputIsStudentLoggedInSuccessfully.add(true);
    });
  }

  @override
  Sink get inputStudentID => _studentIDStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputIsStudentLoggedInSuccessfully =>
      _isStudentLoggedInSuccessfullyStreamController.sink;

  //============= Outputs =============
  @override
  Stream<bool> get outIsStudentIDValid =>
      _studentIDStreamController.stream.map(_isValidStudentID);

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsStudentLoggedInSuccessfully =>
      _isStudentLoggedInSuccessfullyStreamController.stream;

  //============= Private Methods =============
  bool _isValidStudentID(String studentID) {
    return studentID.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isValidStudentID(_loginObject.studentID);
  }
}

mixin StudentLoginViewModelInputs {
  void setStudentId({required String studentID});
  void login();
  void addContentState();

  Sink get inputStudentID;
  Sink get inputAreAllInputsValid;
  Sink get inputIsStudentLoggedInSuccessfully;
}

mixin StudentLoginViewModelOutputs {
  Stream<bool> get outIsStudentIDValid;
  Stream<bool> get outAreAllInputsValid;
  Stream<bool> get outIsStudentLoggedInSuccessfully;
}

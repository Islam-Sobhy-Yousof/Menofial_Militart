import 'dart:async';

import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/helper_functions.dart';
import 'package:menofia_military/domain/usecases/super_login_usecase.dart';
import 'package:menofia_military/presentation/base/base_view_model.dart';
import 'package:menofia_military/presentation/common/data_classes/freezed_data_class.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';

class SuperLoginViewModel extends BaseViewModel
    with SuperLoginViewModelInputs, SuperLoginViewModelOutputs {
  //============= Stream Controllers =============
  final StreamController<String> _superEmailStreamController =
      StreamController<String>.broadcast();

  final StreamController<String> _superPasswordStreamController =
      StreamController<String>.broadcast();

  final StreamController<void> _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<bool> _isSuperLoggedInSuccessfullyStreamController =
      StreamController<bool>.broadcast();

  //============= Dependencies =============
  final SuperLoginUsecase _superLoginUsecase;
  late SuperLoginObject _superLoginObject;
  final AppPrefs _appPrefs;

  SuperLoginViewModel({
    required SuperLoginUsecase superLoginUsecase,
    required AppPrefs appPrefs,
  })  : _superLoginUsecase = superLoginUsecase,
        _appPrefs = appPrefs;
  //============= Data =============

  //============= Lifecycle =============
  @override
  void start() {
    addContentState();
    _superLoginObject = SuperLoginObject(
      superEmail: AppConstants.empty,
      superPassword: AppConstants.empty,
    );
  }

  @override
  void dispose() {
    _superEmailStreamController.close();
    _superPasswordStreamController.close();
    _areAllInputsValidStreamController.close();
    _isSuperLoggedInSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  void addContentState() {
    inputState.add(ContentState());
  }

  //============= Inputs =============
  @override
  void setSuperEmail({required String superEmail}) {
    inputSuperEmail.add(superEmail);
    _superLoginObject = _superLoginObject.copyWith(superEmail: superEmail);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setSuperPassword({required String superPassword}) {
    inputSuperPassword.add(superPassword);
    _superLoginObject =
        _superLoginObject.copyWith(superPassword: superPassword);
    inputAreAllInputsValid.add(null);
  }

  @override
  void login() async {
    inputState.add(PopupLoadingState());

    final response = await _superLoginUsecase(
      input: SuperLoginUsecaseInput(
        email: _superLoginObject.superEmail,
        password: _superLoginObject.superPassword,
      ),
    );

    response.fold((failure) {
      inputState.add(
        PopupErrorState(
          message: failure.message,
        ),
      );
    }, (data) {
      inputIsSuperLoggedInSuccessfully.add(true);
      //Saving data to shared pref
      addContentState();
      _appPrefs.setString(
        key: AppConstants.superEmailPref,
        value: data.superEmail,
      );
      _appPrefs.setString(
        key: AppConstants.superNamePref,
        value: data.superName,
      );
      _appPrefs.setString( //islamsobhy
        key: AppConstants.superTokenPref,
        value: data.superToken,
      );
      _appPrefs.setSuperLoggedIn();
    
    });
  }

  @override
  Sink get inputSuperEmail => _superEmailStreamController.sink;

  @override
  Sink get inputSuperPassword => _superPasswordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputIsSuperLoggedInSuccessfully =>
      _isSuperLoggedInSuccessfullyStreamController.sink;

  //============= Outputs =============
  @override
  Stream<bool> get outIsSuperEmailValid =>
      _superEmailStreamController.stream.map(_isValidSuperEmail);

  @override
  Stream<bool> get outIsSuperPasswordlValid =>
      _superPasswordStreamController.stream.map(_isValidSuperPassword);
  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsSuperLoggedInSuccessfully =>
      _isSuperLoggedInSuccessfullyStreamController.stream.map((isLoggedIn) {
        return isLoggedIn;
      });

  //============= Private Methods =============
  bool _isValidSuperEmail(String superEmail) {
    return _validateEmail(email: superEmail);
  }

  bool _isValidSuperPassword(String superPassword) {
    return superPassword.length >= AppConstants.loginPasswordMinLen;
  }

  bool _areAllInputsValid() {
    return _isValidSuperEmail(
          _superLoginObject.superEmail,
        ) &&
        _isValidSuperPassword(
          _superLoginObject.superPassword,
        );
  }

  bool _validateEmail({required String email}) {
    return validateEmail(email: email);
  }
}

mixin SuperLoginViewModelInputs {
  void setSuperEmail({required String superEmail});
  void setSuperPassword({required String superPassword});
  void login();
  void addContentState();

  Sink get inputSuperEmail;
  Sink get inputSuperPassword;
  Sink get inputAreAllInputsValid;
  Sink get inputIsSuperLoggedInSuccessfully;
}

mixin SuperLoginViewModelOutputs {
  Stream<bool> get outIsSuperEmailValid;
  Stream<bool> get outIsSuperPasswordlValid;
  Stream<bool> get outAreAllInputsValid;
  Stream<bool> get outIsSuperLoggedInSuccessfully;
}

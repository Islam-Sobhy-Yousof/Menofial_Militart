import 'dart:async';

import 'package:menofia_military/app/helper_functions.dart';
import 'package:menofia_military/domain/usecases/register_students_attendance_usecase.dart';
import 'package:menofia_military/presentation/base/base_view_model.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';

class SuperScanAttendanceViewModel extends BaseViewModel
    with SuperAttendanceViewModelInput, SuperAttendanceViewModelOutput {
  final StreamController<bool> _studentIDRegisterationStreamController =
      StreamController<bool>.broadcast();

  final RegisterStudentsAttendanceUsecase _registerStudentsAttendanceUsecase;

  SuperScanAttendanceViewModel(
      {required RegisterStudentsAttendanceUsecase
          registerStudentsAttendanceUsecase})
      : _registerStudentsAttendanceUsecase = registerStudentsAttendanceUsecase;
  @override
  void start() {
    //empty tell now :)
  }

  @override
  void dispose() {
    _studentIDRegisterationStreamController.close();
    super.dispose();
  }

  @override
  void registerAttendance({required String studentID}) async {
    inputState.add(PopupLoadingState());
    if (studentID.isEmpty || !validateStudentID(studentID: studentID)) {
      studentIDRegisterationInput.add(false);
      addContentState();
      return;
    }
    final response = await _registerStudentsAttendanceUsecase(
      input: RegisterStudentsAttendanceUsecaseInput(
        studentID: studentID,
      ),
    );

    response.fold((failure) {
      studentIDRegisterationInput.add(false);
      addContentState();
    }, (data) {
      addContentState();
      studentIDRegisterationInput.add(true);
    });
  }

  @override
  Sink get studentIDRegisterationInput =>
      _studentIDRegisterationStreamController.sink;

  @override
  Stream<bool> get studentIDRegisterationOutput =>
      _studentIDRegisterationStreamController.stream.map((val) => val);

  @override
  void addContentState() {
    inputState.add(ContentState());
  }
}

mixin SuperAttendanceViewModelInput {
  void registerAttendance({required String studentID});

  void addContentState();

  Sink get studentIDRegisterationInput;
}

mixin SuperAttendanceViewModelOutput {
  Stream<bool> get studentIDRegisterationOutput;
}

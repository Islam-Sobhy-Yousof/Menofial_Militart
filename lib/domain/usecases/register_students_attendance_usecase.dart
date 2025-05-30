

import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/data/network/request.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/repository/repository.dart';
import 'package:menofia_military/domain/usecases/base_usecase.dart';

class RegisterStudentsAttendanceUsecase
    implements BaseUsecase<RegisterStudentsAttendanceUsecaseInput, bool> {
  final Repository _repository;

  RegisterStudentsAttendanceUsecase({required Repository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(
      {required RegisterStudentsAttendanceUsecaseInput input}) async {
    return await _repository.superRegisterStudentAttendance(studentID: input.studentID);
  }
}

class RegisterStudentsAttendanceUsecaseInput {
  final String studentID;

  RegisterStudentsAttendanceUsecaseInput({required this.studentID});
}

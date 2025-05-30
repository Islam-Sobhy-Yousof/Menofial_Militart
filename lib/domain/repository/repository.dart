import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/data/network/request.dart';
import 'package:menofia_military/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, StudentAuthentication>> studentLogin({
    required StudentLoginRequest studentLoginRequest,
  });

  Future<Either<Failure, SuperAuthentication>> superLogin({
    required SuperLoginRequest superLoginRequest,
  });

  Future<Either<Failure, bool>> superRegisterStudentAttendance({
    required String studentID,
  });

  Future<Either<Failure,List<Attendance>>> getAttendanceHistory();
}

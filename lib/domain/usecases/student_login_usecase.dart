import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/data/network/request.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/repository/repository.dart';
import 'package:menofia_military/domain/usecases/base_usecase.dart';

class StudentLoginUsecase
    implements BaseUsecase<StudentLoginUsecaseInput, StudentAuthentication> {
  final Repository _repository;

  StudentLoginUsecase({required Repository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, StudentAuthentication>> call(
      {required StudentLoginUsecaseInput input}) async {
    return await _repository.studentLogin(
      studentLoginRequest: StudentLoginRequest(sutdentID: input.studentID),
    );
  }
}

class StudentLoginUsecaseInput {
  final String studentID;

  StudentLoginUsecaseInput({required this.studentID});
}

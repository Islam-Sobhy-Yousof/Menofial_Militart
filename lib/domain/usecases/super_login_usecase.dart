import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/data/network/request.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/repository/repository.dart';
import 'package:menofia_military/domain/usecases/base_usecase.dart';

class SuperLoginUsecase
    implements BaseUsecase<SuperLoginUsecaseInput, SuperAuthentication> {
  final Repository _repository;

  SuperLoginUsecase({required Repository repository})
      : _repository = repository;
  @override
  Future<Either<Failure, SuperAuthentication>> call(
      {required SuperLoginUsecaseInput input}) async {
    return await _repository.superLogin(
      superLoginRequest: SuperLoginRequest(
        email: input.email,
        password: input.password,
      ),
    );
  }
}

class SuperLoginUsecaseInput {
  final String email;
  final String password;

  SuperLoginUsecaseInput({required this.email, required this.password});
}

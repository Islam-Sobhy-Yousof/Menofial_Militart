import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/repository/repository.dart';
import 'package:menofia_military/domain/usecases/base_usecase.dart';

class GetAttendanceReportUsecase
    implements BaseUsecase<void, List<Attendance>> {
  final Repository _repository;

  GetAttendanceReportUsecase({required Repository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Attendance>>> call({void input}) async {
    return await _repository.getAttendanceHistory();
  }
}

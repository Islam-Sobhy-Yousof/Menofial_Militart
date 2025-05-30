import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/data_sources/remote_data_source.dart';
import 'package:menofia_military/data/mappers/mappers.dart';
import 'package:menofia_military/data/network/error_handler.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/data/network/network_info.dart';
import 'package:menofia_military/data/network/request.dart';
import 'package:menofia_military/data/responses/responses.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required NetworkInfo networkInfo})
      : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;
  @override
  Future<Either<Failure, StudentAuthentication>> studentLogin(
      {required StudentLoginRequest studentLoginRequest}) async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final response = await _remoteDataSource.studentLogin(
          loginRequest: studentLoginRequest);

      if (response == null) {
        return Left(DataSource.notFoundError.getFailure());
      }
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuperAuthentication>> superLogin(
      {required SuperLoginRequest superLoginRequest}) async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final response = await _remoteDataSource.superLogin(
          superLoginRequest: superLoginRequest);

      if (response == null) {
        return Left(DataSource.notFoundError.getFailure());
      }

      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> superRegisterStudentAttendance(
      {required String studentID}) async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      await _remoteDataSource.superRegisterStudentAttendance(
          studentID: studentID);

      return Right(true);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Attendance>>> getAttendanceHistory() async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final List<AttendanceResponse> response =
          await _remoteDataSource.getAttendanceHistory();

      final List<Attendance> attendanceReport =
          response.map((val) => val.toDomain()).toList();
      return Right(attendanceReport);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:menofia_military/data/network/failure.dart';

abstract class BaseUsecase<Inp, Out> {
  Future<Either<Failure, Out>> call({required Inp input});
}

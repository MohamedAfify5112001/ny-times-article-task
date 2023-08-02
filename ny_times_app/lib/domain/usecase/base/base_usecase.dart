import 'package:dartz/dartz.dart';
import 'package:ny_times_app/app/failure/failure.dart';

abstract class BaseUseCase<Out> {
  Future<Either<Failure, List<Out>>> call();
}

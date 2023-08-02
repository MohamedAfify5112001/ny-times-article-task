import 'package:dartz/dartz.dart';

import '../../app/failure/failure.dart';
import '../model/ny_times_model.dart';

abstract interface class NyTimesRepository {
  Future<Either<Failure, List<NyTimesModel>>> getNyTimes();
}

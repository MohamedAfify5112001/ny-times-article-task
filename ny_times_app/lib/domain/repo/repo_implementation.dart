import 'package:dartz/dartz.dart';
import 'package:ny_times_app/app/failure/failure.dart';
import 'package:ny_times_app/data/model/ny_times_model.dart';
import 'package:ny_times_app/data/repo/ny_times_repo.dart';

import '../../data/data_source/data_source.dart';

final class NyTimesRepositoryImplementation implements NyTimesRepository {
  final AppDataSource appDataSource;
  NyTimesRepositoryImplementation({required this.appDataSource});
  @override
  Future<Either<Failure, List<NyTimesModel>>> getNyTimes() async =>
      await appDataSource.getNyTimes();
}

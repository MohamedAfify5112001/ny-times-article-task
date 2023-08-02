import 'package:dartz/dartz.dart';
import 'package:ny_times_app/app/failure/failure.dart';
import 'package:ny_times_app/data/repo/ny_times_repo.dart';
import 'package:ny_times_app/domain/entity/ny_times_entity.dart';

import '../base/base_usecase.dart';

final class NyTimesUseCase extends BaseUseCase<NyTimesEntity> {
  final NyTimesRepository newsRepository;
  NyTimesUseCase({required this.newsRepository});
  @override
  Future<Either<Failure, List<NyTimesEntity>>> call() async =>
      newsRepository.getNyTimes();
}

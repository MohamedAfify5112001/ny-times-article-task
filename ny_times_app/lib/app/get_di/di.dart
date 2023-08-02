import 'package:get_it/get_it.dart';
import 'package:ny_times_app/data/data_source/data_source.dart';
import 'package:ny_times_app/data/repo/ny_times_repo.dart';
import 'package:ny_times_app/domain/repo/repo_implementation.dart';
import 'package:ny_times_app/presentation/view_model/ny_times_bloc.dart';

import '../../domain/usecase/ny_times_use_case/ny_times_usecase.dart';

sealed class AppModule {
  static final instance = GetIt.instance;

  static Future<void> initAppModule() async {
    // Singleton For App Data Source
    instance.registerLazySingleton<AppDataSource>(
        () => AppDataSourceImplemntation());

    // Singleton For Ny News Repo
    instance.registerLazySingleton<NyTimesRepository>(() =>
        NyTimesRepositoryImplementation(
            appDataSource: instance<AppDataSource>()));

    // Singleton For Ny News Use Case
    instance.registerLazySingleton<NyTimesUseCase>(
        () => NyTimesUseCase(newsRepository: instance<NyTimesRepository>()));
    await _initBloc();
  }

  static Future<void> _initBloc() async {
    if (!GetIt.I.isRegistered<NyTimesBloc>()) {
      instance.registerFactory<NyTimesBloc>(
          () => NyTimesBloc(nyTimesUseCase: instance<NyTimesUseCase>()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ny_times_app/app/styles/constants/constant.dart';
import 'package:ny_times_app/data/model/ny_times_model.dart';
import 'package:ny_times_app/data/network/dio_helper.dart';

import '../../app/failure/failure.dart';

abstract interface class AppDataSource {
  Future<Either<Failure, List<NyTimesModel>>> getNyTimes();
}

final class AppDataSourceImplemntation implements AppDataSource {
  @override
  Future<Either<Failure, List<NyTimesModel>>> getNyTimes() async {
    try {
      final Response response = await DioHelper.getRequest(
          endPointPath: AppConstants.$endPoint,
          apiKeyParam: AppConstants.$apiKey);

      final results = (response.data['results']) as List;
      List<NyTimesModel> nyNewsItems =
          results.map((nyNews) => NyTimesModel.fromJson(nyNews)).toList();
      return Right(nyNewsItems);
    } on DioException catch (error) {
      return Left(Failure(message: error.message!));
    }
  }
}

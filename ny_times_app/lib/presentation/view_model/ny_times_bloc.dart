import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../app/failure/failure.dart';
import '../../domain/entity/ny_times_entity.dart';
import '../../domain/usecase/ny_times_use_case/ny_times_usecase.dart';

part 'ny_times_event.dart';

part 'ny_times_state.dart';

class NyTimesBloc extends Bloc<NyTimesEvent, NyTimesState> {
  final NyTimesUseCase nyTimesUseCase;

  NyTimesBloc({required this.nyTimesUseCase}) : super(const NyTimesState()) {
    on<FetchNyNewsEvent>(_onFetchNyNewsItems);
  }

  Future<void> _onFetchNyNewsItems(
      FetchNyNewsEvent event, Emitter<NyTimesState> emit) async {
    emit(state.copyWith(nyNewsStatus: NyTimesStatus.loading));
    final Either<Failure, List<NyTimesEntity>> nyNewsFolding =
        await nyTimesUseCase();
    nyNewsFolding.fold(
      (fail) => emit(
        state.copyWith(
          nyNewsStatus: NyTimesStatus.failure,
          failure: fail.message,
        ),
      ),
      (success) => emit(
        state.copyWith(
            nyNewsStatus: NyTimesStatus.success, nyNewsItems: success),
      ),
    );
  }
}

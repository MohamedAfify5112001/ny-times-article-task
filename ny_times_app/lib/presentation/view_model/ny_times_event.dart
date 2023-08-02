part of 'ny_times_bloc.dart';

sealed class NyTimesEvent extends Equatable {
  const NyTimesEvent();

  @override
  List<Object> get props => [];
}

final class FetchNyNewsEvent extends NyTimesEvent {
  const FetchNyNewsEvent();
}

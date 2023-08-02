part of 'ny_times_bloc.dart';

enum NyTimesStatus { initial, loading, success, failure }

final class NyTimesState extends Equatable {
  final NyTimesStatus nyNewsStatus;
  final List<NyTimesEntity> nyNewsItems;
  final String failure;

  const NyTimesState({
    this.nyNewsStatus = NyTimesStatus.initial,
    this.nyNewsItems = const <NyTimesEntity>[],
    this.failure = '',
  });
  NyTimesState copyWith({
    NyTimesStatus? nyNewsStatus,
    List<NyTimesEntity>? nyNewsItems,
    String? failure,
  }) {
    return NyTimesState(
      nyNewsStatus: nyNewsStatus ?? this.nyNewsStatus,
      nyNewsItems: nyNewsItems ?? this.nyNewsItems,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [nyNewsStatus, nyNewsItems, failure];
}

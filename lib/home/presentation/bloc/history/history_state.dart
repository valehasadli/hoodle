part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final List<HistoryEntity> history;
  final HistoryStatus status;

  const HistoryState({
    this.history = const <HistoryEntity>[],
    this.status = HistoryStatus.pure,
  });

  HistoryState copyWith({
    List<HistoryEntity> history,
    HistoryStatus status,
  }) {
    return HistoryState(
      history: history ?? this.history,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [history, status];
}

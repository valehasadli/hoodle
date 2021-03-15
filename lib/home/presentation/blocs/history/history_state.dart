part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final List<HistoryEntity> history;
  final HistoryStatus status;
  final int lastPage;
  final int currentPage;
  final int total;

  const HistoryState({
    this.history = const <HistoryEntity>[],
    this.status = HistoryStatus.pure,
    this.lastPage = 1,
    this.currentPage = 1,
    this.total = 0,
  });

  HistoryState copyWith({
    List<HistoryEntity> history,
    HistoryStatus status,
    int lastPage,
    int currentPage,
    int total,
  }) {
    return HistoryState(
      history: history ?? this.history,
      status: status ?? this.status,
      lastPage: lastPage ?? this.lastPage,
      currentPage: currentPage ?? this.currentPage,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [
        history,
        status,
        lastPage,
        currentPage,
        total,
      ];
}

part of 'timeline_bloc.dart';

class TimelineState extends Equatable {
  final List<TimelineEntity> timeline;
  final TimelineStatus status;
  final int lastPage;
  final int currentPage;
  final int total;

  const TimelineState({
    this.timeline = const <TimelineEntity>[],
    this.status = TimelineStatus.pure,
    this.lastPage = 1,
    this.currentPage = 1,
    this.total = 0,
  });

  TimelineState copyWith({
    List<TimelineEntity> timeline,
    TimelineStatus status,
    int lastPage,
    int currentPage,
    int total,
  }) {
    return TimelineState(
      timeline: timeline ?? this.timeline,
      status: status ?? this.status,
      lastPage: lastPage ?? this.lastPage,
      currentPage: currentPage ?? this.currentPage,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [
        timeline,
        status,
        lastPage,
        currentPage,
        total,
      ];
}

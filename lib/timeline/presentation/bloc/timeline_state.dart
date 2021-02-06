part of 'timeline_bloc.dart';

class TimelineState extends Equatable {
  final List<TimelineEntity> timeline;
  final TimelineStatus status;

  const TimelineState({
    this.timeline = const <TimelineEntity>[],
    this.status = TimelineStatus.pure,
  });

  TimelineState copyWith({
    List<TimelineEntity> timeline,
    TimelineStatus status,
  }) {
    return TimelineState(
      timeline: timeline ?? this.timeline,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [timeline, status];
}

part of 'timeline_bloc.dart';

abstract class TimelineEvent extends Equatable {
  const TimelineEvent();

  @override
  List<Object> get props => [];
}

class TimelineFetch extends TimelineEvent {
  const TimelineFetch();
}
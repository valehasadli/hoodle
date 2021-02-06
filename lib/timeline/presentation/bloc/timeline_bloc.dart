import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/errors/failures.dart';

import '../../application/timeline_facade_service.dart';
import '../../domain/entities/timeline_entity.dart';

part 'timeline_status.dart';
part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  final TimelineFacadeService service;

  TimelineBloc({@required this.service})
      : assert(service != null),
        super(const TimelineState());

  @override
  Stream<TimelineState> mapEventToState(
    TimelineEvent event,
  ) async* {
    if (event is TimelineFetch) {
      yield* _mapFetchToState(event, state);
    }
  }

  Stream<TimelineState> _mapFetchToState(
    TimelineFetch event,
    TimelineState state,
  ) async* {
    yield state.copyWith(status: TimelineStatus.progress);

    final Either<Failure, List<TimelineEntity>> failureOrTimeline =
        await service.fetchTimeline();

    yield failureOrTimeline.fold(
      (failure) => state.copyWith(status: TimelineStatus.failure),
      (timeline) => state.copyWith(
        timeline: timeline,
        status: TimelineStatus.success,
      ),
    );
  }
}

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
    } else if (event is TimelineScrolled) {
      yield* _mapScrolledToState(event, state);
    }
  }

  Stream<TimelineState> _mapScrolledToState(
    TimelineScrolled event,
    TimelineState state,
  ) async* {
    if (state.currentPage <= state.lastPage &&
        state.status != TimelineStatus.dirty) {
      yield state.copyWith(status: TimelineStatus.dirty);

      final Either<Failure, List<TimelineEntity>> failureOrTimeline =
          await service.fetchTimeline(page: state.currentPage + 1);

      yield failureOrTimeline.fold(
        (failure) => state.copyWith(status: TimelineStatus.failure),
        (history) {
          state.timeline.addAll(history);
          return state.copyWith(
            status: TimelineStatus.success,
            currentPage: history.first.currentPage,
            lastPage: history.first.lastPage,
            total: history.first.total,
          );
        },
      );
    }
  }

  Stream<TimelineState> _mapFetchToState(
    TimelineFetch event,
    TimelineState state,
  ) async* {
    yield state.copyWith(status: TimelineStatus.progress);

    final Either<Failure, List<TimelineEntity>> failureOrTimeline =
        await service.fetchTimeline(page: state.currentPage);

    yield failureOrTimeline.fold(
      (failure) => state.copyWith(status: TimelineStatus.failure),
      (timeline) => timeline.isNotEmpty
          ? state.copyWith(
              timeline: timeline,
              status: TimelineStatus.success,
              currentPage: timeline.first.currentPage,
              lastPage: timeline.first.lastPage,
              total: timeline.first.total,
            )
          : state,
    );
  }
}

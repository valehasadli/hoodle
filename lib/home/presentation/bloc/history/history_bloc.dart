import 'dart:async';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/errors/failures.dart';
import '../../../application/history_facade_service.dart';
import '../../../domain/entities/history_entity.dart';

part 'history_status.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryFacadeService service;

  HistoryBloc({@required this.service})
      : assert(service != null),
        super(const HistoryState());

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is HistoryFetch) {
      yield* _mapFetchToState(event, state);
    } else if (event is HistoryScrolled) {
      yield* _mapScrolledToState(event, state);
    }
  }

  Stream<HistoryState> _mapScrolledToState(
    HistoryScrolled event,
    HistoryState state,
  ) async* {
    if (state.currentPage <= state.lastPage &&
        state.status != HistoryStatus.scroll) {
      yield state.copyWith(status: HistoryStatus.scroll);

      final Either<Failure, List<HistoryEntity>> failureOrHistory =
          await service.fetchHistory(page: state.currentPage + 1);

      yield failureOrHistory.fold(
        (failure) => state.copyWith(status: HistoryStatus.failure),
        (history) {
          return state.copyWith(
            history: history,
            status: HistoryStatus.success,
            currentPage: history.first.currentPage,
            lastPage: history.first.lastPage,
            total: history.first.total,
          );
        },
      );
    }
  }

  Stream<HistoryState> _mapFetchToState(
    HistoryFetch event,
    HistoryState state,
  ) async* {
    yield state.copyWith(status: HistoryStatus.progress);
    final Either<Failure, List<HistoryEntity>> failureOrHistory =
        await service.fetchHistory(page: state.currentPage);

    yield failureOrHistory.fold(
      (failure) => state.copyWith(status: HistoryStatus.failure),
      (history) => state.copyWith(
        history: history,
        status: HistoryStatus.success,
        currentPage: history.first.currentPage,
        lastPage: history.first.lastPage,
        total: history.first.total,
      ),
    );
  }
}

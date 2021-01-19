import 'dart:async';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../common/errors/failures.dart';
import '../../../application/translation_facade_service.dart';
import '../../../domain/entities/translation_entity.dart';

part 'translation_status.dart';
part 'translation_event.dart';
part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  final TranslationFacadeService service;

  TranslationBloc({@required this.service})
      : assert(service != null),
        super(const TranslationState());

  @override
  Stream<Transition<TranslationEvent, TranslationState>> transformEvents(
    Stream<TranslationEvent> events,
    TransitionFunction<TranslationEvent, TranslationState> transitionFn,
  ) {
    final Stream<TranslationEvent> nonDebounceStream = events.where(
      (event) => event is! TranslationSubmitted,
    );

    final Stream<TranslationEvent> debounceStream = events
        .where(
          (event) => event is TranslationSubmitted,
        )
        .debounceTime(
          const Duration(milliseconds: 2000),
        );

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<TranslationState> mapEventToState(TranslationEvent event) async* {
    if (event is TranslationKeyLanguageChanged) {
      yield _mapKeyLanguageChangedToState(event, state);
    } else if (event is TranslationValueLanguageChanged) {
      yield _mapValueLanguageChangedToState(event, state);
    } else if (event is TranslationSwitchLanguage) {
      yield _mapSwitchLanguageToState(event, state);
    } else if (event is TranslationResetted) {
      yield _mapResettedToState(event, state);
    } else if (event is TranslationKeyChanged) {
      yield _mapKeyChangedToState(event, state);
    } else if (event is TranslationSubmitted) {
      if (state.key.length > 1) {
        yield* _mapSubmittedToState(event, state);
      } else {
        yield state.copyWith(
          key: '',
          value: '',
          status: TranslationStatus.pure,
        );
      }
    }
  }

  TranslationState _mapKeyLanguageChangedToState(
    TranslationKeyLanguageChanged event,
    TranslationState state,
  ) {
    return state.copyWith(keyLanguageLocale: event.language);
  }

  TranslationState _mapValueLanguageChangedToState(
    TranslationValueLanguageChanged event,
    TranslationState state,
  ) {
    return state.copyWith(valueLanguageLocale: event.language);
  }

  TranslationState _mapSwitchLanguageToState(
    TranslationSwitchLanguage event,
    TranslationState state,
  ) {
    return state.copyWith(
      keyLanguageLocale: event.valueLanguageLocale,
      valueLanguageLocale: event.keyLanguageLocale,
    );
  }

  TranslationState _mapKeyChangedToState(
    TranslationKeyChanged event,
    TranslationState state,
  ) {
    return state.copyWith(
      key: event.key,
      status: TranslationStatus.dirty,
    );
  }

  TranslationState _mapResettedToState(
    TranslationResetted event,
    TranslationState state,
  ) {
    return state.copyWith(
      key: '',
      value: '',
      status: TranslationStatus.pure,
    );
  }

  Stream<TranslationState> _mapSubmittedToState(
    TranslationSubmitted event,
    TranslationState state,
  ) async* {
    yield state.copyWith(status: TranslationStatus.progress);

    final Either<Failure, TranslationEntity> failureOrTranslate =
        await service.translate(
      key: state.key,
      keyLanguageLocale: state.keyLanguageLocale,
      valueLanguageLocale: state.valueLanguageLocale,
    );

    yield failureOrTranslate.fold(
      (failure) => state.copyWith(status: TranslationStatus.failure),
      (translation) => state.copyWith(
        id: translation.id,
        userId: translation.userId,
        key: translation.key,
        keyLanguageLocale: translation.keyLanguageLocale,
        value: translation.value,
        valueLanguageLocale: translation.valueLanguageLocale,
        count: translation.count,
        favorite: translation.favorite,
        history: translation.history,
        status: TranslationStatus.success,
      ),
    );
  }
}

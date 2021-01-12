import 'dart:async';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/errors/failures.dart';
import '../../application/registration_facade_service.dart';
import '../../domain/entities/registration_entity.dart';

part 'registration_status.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationFacadeService service;

  RegistrationBloc({@required this.service})
      : assert(service != null),
        super(const RegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegistrationNameChanged) {
      yield _mapNameChangedToState(event, state);
    } else if (event is RegistrationEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is RegistrationPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is RegistrationConformPasswordChanged) {
      yield _mapConformPasswordChangedToState(event, state);
    } else if (event is RegistrationPasswordObscureChanged) {
      yield _mapPasswordObscureChangedToState(event, state);
    } else if (event is RegistrationSubmitted) {
      yield* _mapSubmittedToState(event, state);
    }
  }

  RegistrationState _mapNameChangedToState(
    RegistrationNameChanged event,
    RegistrationState state,
  ) {
    return state.copyWith(
      name: event.name,
      status: RegistrationStatus.dirty,
    );
  }

  RegistrationState _mapEmailChangedToState(
    RegistrationEmailChanged event,
    RegistrationState state,
  ) {
    return state.copyWith(
      email: event.email,
      status: RegistrationStatus.dirty,
    );
  }

  RegistrationState _mapPasswordChangedToState(
    RegistrationPasswordChanged event,
    RegistrationState state,
  ) {
    return state.copyWith(
      password: event.password,
      status: RegistrationStatus.dirty,
    );
  }

  RegistrationState _mapConformPasswordChangedToState(
    RegistrationConformPasswordChanged event,
    RegistrationState state,
  ) {
    return state.copyWith(
      conformPassword: event.conformPassword,
      status: RegistrationStatus.dirty,
    );
  }

  RegistrationState _mapPasswordObscureChangedToState(
    RegistrationPasswordObscureChanged event,
    RegistrationState state,
  ) {
    return state.copyWith(
      obscure: event.obscure,
      status: RegistrationStatus.dirty,
    );
  }

  Stream<RegistrationState> _mapSubmittedToState(
    RegistrationSubmitted event,
    RegistrationState state,
  ) async* {
    yield state.copyWith(status: RegistrationStatus.progress);

    final Either<Failure, RegistrationEntity> failureOrRegistration =
        await service.registration(
      name: state.name,
      email: state.email,
      password: state.password,
      deviceName: state.deviceName,
    );

    yield failureOrRegistration.fold(
      (failure) => state.copyWith(status: RegistrationStatus.failure),
      (registration) => state.copyWith(
        name: registration.name,
        email: registration.email,
        status: RegistrationStatus.success,
      ),
    );
  }
}

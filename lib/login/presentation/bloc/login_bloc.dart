import 'dart:async';

import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/errors/failures.dart';
import '../../application/auth_facade_service.dart';
import '../../domain/entities/login_entity.dart';

part 'login_status.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthFacadeService service;

  LoginBloc({@required this.service})
      : assert(service != null),
        super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginPasswordObscureChanged) {
      yield _mapPasswordObscureChangedToState(event, state);
    } else if (event is LoginRememberMeChanged) {
      yield _mapRememberMeChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapSubmittedToState(event, state);
    }
  }

  LoginState _mapEmailChangedToState(
    LoginEmailChanged event,
    LoginState state,
  ) {
    return state.copyWith(
      email: event.email,
      status: LoginStatus.dirty,
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    return state.copyWith(
      password: event.password,
      status: LoginStatus.dirty,
    );
  }

  LoginState _mapPasswordObscureChangedToState(
    LoginPasswordObscureChanged event,
    LoginState state,
  ) {
    return state.copyWith(
      obscure: event.obscure,
      status: LoginStatus.dirty,
    );
  }

  LoginState _mapRememberMeChangedToState(
    LoginRememberMeChanged event,
    LoginState state,
  ) {
    return state.copyWith(
      rememberMe: event.rememberMe,
      status: LoginStatus.dirty,
    );
  }

  Stream<LoginState> _mapSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    yield state.copyWith(status: LoginStatus.progress);

    final Either<Failure, LoginEntity> failureOrLogin = await service.login(
      email: state.email,
      password: state.password,
      deviceName: state.deviceName,
    );

    yield failureOrLogin.fold(
      (failure) => state.copyWith(status: LoginStatus.failure),
      (login) => state.copyWith(
        email: login.email,
        status: LoginStatus.success,
      ),
    );
  }
}

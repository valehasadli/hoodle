import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/errors/failures.dart';

import '../../../../login/api/auth_api.dart';

part 'auth_status.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLogout) {
      yield* _mapLogoutToState(event, state);
    }
  }

  Stream<AuthState> _mapLogoutToState(
    AuthLogout event,
    AuthState state,
  ) async* {
    yield state.copyWith(status: AuthStatus.progress);

    final Either<Failure, bool> failureOrLogout = await AuthApi().logout();

    yield failureOrLogout.fold(
      (failure) => state.copyWith(status: AuthStatus.failure),
      (logout) => state.copyWith(status: AuthStatus.success, active: logout),
    );
  }
}

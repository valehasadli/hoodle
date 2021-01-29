part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool active;
  final AuthStatus status;

  const AuthState({
    this.active = true,
    this.status = AuthStatus.pure,
  });

  AuthState copyWith({
    bool active,
    AuthStatus status,
  }) {
    return AuthState(
      active: active ?? this.active,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        active,
        status,
      ];
}

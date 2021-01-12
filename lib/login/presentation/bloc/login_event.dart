part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class LoginPasswordObscureChanged extends LoginEvent {
  final bool obscure;

  const LoginPasswordObscureChanged({@required this.obscure});

  @override
  List<Object> get props => [obscure];
}

class LoginRememberMeChanged extends LoginEvent {
  final bool rememberMe;

  const LoginRememberMeChanged({@required this.rememberMe});

  @override
  List<Object> get props => [rememberMe];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

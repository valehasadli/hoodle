part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationNameChanged extends RegistrationEvent {
  final String name;

  const RegistrationNameChanged({@required this.name});

  @override
  List<Object> get props => [name];
}

class RegistrationEmailChanged extends RegistrationEvent {
  final String email;

  const RegistrationEmailChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;

  const RegistrationPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class RegistrationConformPasswordChanged extends RegistrationEvent {
  final String conformPassword;

  const RegistrationConformPasswordChanged({@required this.conformPassword});

  @override
  List<Object> get props => [conformPassword];
}

class RegistrationPasswordObscureChanged extends RegistrationEvent {
  final bool obscure;

  const RegistrationPasswordObscureChanged({@required this.obscure});

  @override
  List<Object> get props => [obscure];
}

class RegistrationSubmitted extends RegistrationEvent {
  const RegistrationSubmitted();
}

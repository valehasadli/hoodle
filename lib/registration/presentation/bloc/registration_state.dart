part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String conformPassword;
  final bool obscure;
  final String deviceName;
  final RegistrationStatus status;

  const RegistrationState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.conformPassword = '',
    this.obscure = true,
    this.deviceName = 'apple',
    this.status = RegistrationStatus.pure,
  });

  RegistrationState copyWith({
    String name,
    String email,
    String password,
    String conformPassword,
    bool obscure,
    String deviceName,
    RegistrationStatus status,
  }) {
    return RegistrationState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      conformPassword: conformPassword ?? this.conformPassword,
      obscure: obscure ?? this.obscure,
      deviceName: deviceName ?? this.deviceName,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        name,
        email,
        password,
        conformPassword,
        obscure,
        deviceName,
        status,
      ];
}

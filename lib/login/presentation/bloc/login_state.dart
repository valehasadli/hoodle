part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String deviceName;
  final bool obscure;
  final bool rememberMe;
  final LoginStatus status;

  const LoginState({
    this.email = '',
    this.password = '',
    this.deviceName = 'apple',
    this.obscure = true,
    this.rememberMe = false,
    this.status = LoginStatus.pure,
  });

  LoginState copyWith({
    String email,
    String password,
    String deviceName,
    bool obscure,
    bool rememberMe,
    LoginStatus status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      deviceName: deviceName ?? this.deviceName,
      obscure: obscure ?? this.obscure,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        deviceName,
        obscure,
        rememberMe,
        status,
      ];
}

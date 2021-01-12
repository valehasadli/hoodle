import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final dynamic rememberToken;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String token;

  const LoginEntity({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.emailVerifiedAt,
    @required this.rememberToken,
    @required this.isAdmin,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.token,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        rememberToken,
        isAdmin,
        createdAt,
        updatedAt,
        token,
      ];
}

import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class _InternetyInterface {
  Future<bool> get isConnected;
}

class Internet extends _InternetyInterface {
  final DataConnectionChecker _connectionChecker;

  Internet(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}

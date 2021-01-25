import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class _InternetInterface {
  Future<bool> get isConnected;
}

class Internet extends _InternetInterface {
  final DataConnectionChecker _connectionChecker;

  Internet(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}

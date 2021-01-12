import 'package:data_connection_checker/data_connection_checker.dart';

abstract class ConnectivityInterface {
  Future<bool> get isConnected;
}

class Connectivity extends ConnectivityInterface {
  final DataConnectionChecker _connectionChecker;

  Connectivity(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}

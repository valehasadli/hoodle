import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../screens/no_connection_screen.dart';

class NetworkSensitive extends StatefulWidget {
  final Widget child;

  const NetworkSensitive({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _NetworkSensitiveState createState() => _NetworkSensitiveState();
}

class _NetworkSensitiveState extends State<NetworkSensitive> {
  bool _isConnected;

  @override
  void initState() {
    super.initState();
    _isConnected = false;
  }

  @override
  Widget build(BuildContext context) {
    var _listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          setState(() => _isConnected = true);
          break;
        case DataConnectionStatus.disconnected:
          setState(() => _isConnected = false);
          break;
      }
    });

    @override
    void dispose() {
      _listener.cancel();
      super.dispose();
    }

    return _isConnected ? widget.child : NoConnectionScreen();
  }
}

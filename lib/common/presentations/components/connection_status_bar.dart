import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../../configs/responsive.dart';

class ConnectionStatusBar extends StatefulWidget {
  @override
  _ConnectionStatusBarState createState() => _ConnectionStatusBarState();
}

class _ConnectionStatusBarState extends State<ConnectionStatusBar> {
  bool _isConnected = true;

  void setStateIfMounted(Function function) {
    if (mounted) setState(function);
  }

  @override
  Widget build(BuildContext context) {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          setStateIfMounted(() => _isConnected = true);
          break;
        case DataConnectionStatus.disconnected:
          setStateIfMounted(() => _isConnected = false);
          break;
      }
    });

    return _isConnected
        ? SizedBox.shrink()
        : Material(
            child: SafeArea(
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 2),
                color: _isConnected ? Colors.green : Colors.red,
                height: getProportionateScreenWidth(30),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Please check your internet connection',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

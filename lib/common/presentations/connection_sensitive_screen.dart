import 'package:flutter/material.dart';

import '../configs/responsive.dart';
import 'components/connection_status_bar.dart';

class ConnectionSensitiveScreen extends StatefulWidget {
  final Widget child;

  const ConnectionSensitiveScreen({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _ConnectionSensitiveScreenState createState() =>
      _ConnectionSensitiveScreenState();
}

class _ConnectionSensitiveScreenState extends State<ConnectionSensitiveScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: widget.child,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConnectionStatusBar(),
        ),
      ],
    );
  }
}

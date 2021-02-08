import 'package:flutter/material.dart';

import '../../common/config/responsive.dart';
import '../../common/presentation/connection_sensitive_screen.dart';
import 'components/body.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return ConnectionSensitiveScreen(
      child: Scaffold(
        backgroundColor: Color(0xFF4284F4),
        body: Body(),
      ),
    );
  }
}

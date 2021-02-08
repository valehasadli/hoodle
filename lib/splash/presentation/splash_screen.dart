import 'package:flutter/material.dart';

import '../../common/config/responsive.dart';
import '../../common/presentation/connection_sensitive_screen.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return ConnectionSensitiveScreen(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Body(),
        appBar: AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}

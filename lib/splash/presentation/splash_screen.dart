import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import '../../common/screens/connection_sensitive_screen.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
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

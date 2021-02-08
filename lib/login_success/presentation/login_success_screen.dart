import 'package:flutter/material.dart';

import '../../common/config/responsive.dart';
import '../../common/presentation/connection_sensitive_screen.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return ConnectionSensitiveScreen(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login Success'),
        ),
        body: Body(),
      ),
    );
  }
}

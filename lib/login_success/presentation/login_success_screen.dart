import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import '../../common/presentation/connection_sensitive_screen.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
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

import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login Success'),
      ),
      body: Body(),
    );
  }
}

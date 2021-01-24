import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import '../../common/components/network_sensitive.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return NetworkSensitive(
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

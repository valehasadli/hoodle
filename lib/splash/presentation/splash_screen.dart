import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      body: Body(),
      appBar: AppBar(brightness: Brightness.light),
    );
  }
}

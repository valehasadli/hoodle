import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/config/responsive.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}

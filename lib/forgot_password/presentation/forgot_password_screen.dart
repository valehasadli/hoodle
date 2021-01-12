import 'package:flutter/material.dart';

import '../../common/components/custom_app_bar.dart';
import '../../common/config/custom_size.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}

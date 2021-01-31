import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import '../../common/presentation/components/guest_app_bar.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);

    return Scaffold(
      appBar: GuestAppBar(),
      body: Body(),
    );
  }
}

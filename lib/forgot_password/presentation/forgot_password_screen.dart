import 'package:flutter/material.dart';

import '../../common/configs/responsive.dart';
import '../../common/presentations/components/appbars/guest_app_bar.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Scaffold(
      appBar: GuestAppBar(),
      body: Body(),
    );
  }
}

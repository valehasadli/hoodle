import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import '../../common/presentation/components/guest_app_bar.dart';
import '../../common/presentation/connection_sensitive_screen.dart';

import 'components/body.dart';

class SocketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return ConnectionSensitiveScreen(
      child: Scaffold(
        appBar: GuestAppBar(),
        body: Body(),
      ),
    );
  }
}

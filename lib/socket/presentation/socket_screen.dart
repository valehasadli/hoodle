import 'package:flutter/material.dart';

import '../../common/config/responsive.dart';
import '../../common/presentation/components/guest_app_bar.dart';
import '../../common/presentation/connection_sensitive_screen.dart';

import 'components/body.dart';

class SocketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return ConnectionSensitiveScreen(
      child: Scaffold(
        appBar: GuestAppBar(),
        body: Body(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/configs/responsive.dart';
import '../../common/presentations/connection_sensitive_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ConnectionSensitiveScreen(
        child: Scaffold(
          backgroundColor: Color(0xFF4284F4),
          body: Body(),
        ),
      ),
    );
  }
}

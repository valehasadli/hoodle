import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';
import '../../common/presentation/connection_sensitive_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
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

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../routes/router.gr.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExtendedNavigator.of(context).push(
          Routes.forgotPasswordScreen,
        );
      },
      child: Text(
        'Forgot Password',
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

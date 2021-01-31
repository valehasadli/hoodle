import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../routes/router.gr.dart';
import '../../utils/constants.dart';
import '../../config/custom_size.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).push(
              Routes.registrationScreen,
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

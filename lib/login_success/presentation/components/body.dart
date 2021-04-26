import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../common/routes/router.gr.dart';
import '../../../common/configs/responsive.dart';
import '../../../common/presentations/components/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: Responsive.screenHeight * 0.04),
          Image.asset(
            'assets/images/success.png',
            height: Responsive.screenHeight * 0.4,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: Responsive.screenHeight * 0.08),
          Text(
            'Login Success',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: Responsive.screenWidth * 0.6,
            child: DefaultButton(
              text: 'Navigate to Home',
              press: () => ExtendedNavigator.of(context).replace(
                Routes.navigationScreen,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

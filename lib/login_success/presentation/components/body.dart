import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../routes/router.gr.dart';
import '../../../common/config/custom_size.dart';
import '../../../common/components/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: CustomSize.screenHeight * 0.04),
          Image.asset(
            'assets/images/success.png',
            height: CustomSize.screenHeight * 0.4,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: CustomSize.screenHeight * 0.08),
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
            width: CustomSize.screenWidth * 0.6,
            child: DefaultButton(
              text: 'Back to Home',
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

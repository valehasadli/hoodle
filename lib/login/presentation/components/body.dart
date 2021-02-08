import 'package:flutter/material.dart';

import '../../../common/config/responsive.dart';
import '../../../common/presentation/components/social_card.dart';
import '../../../common/presentation/components/no_account_text.dart';

import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Responsive.screenHeight * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Text(
                  'Sign in with your email and password or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Responsive.screenHeight * 0.08),
                LoginForm(),
                SizedBox(height: Responsive.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () => print('pressed google sign in'),
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () => print('pressed fb sign in'),
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () => print('pressed twitter sign in'),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/config/responsive.dart';
import '../../../common/utils/theme_constants.dart';

import '../../../common/presentation/components/social_card.dart';
import '../../../common/presentation/components/term_and_condition_text.dart';

import 'registration_form.dart';

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
                  'Register Account',
                  style: kHeadingStyle,
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Responsive.screenHeight * 0.04),
                RegistrationForm(),
                SizedBox(height: Responsive.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                TermAndConditionText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

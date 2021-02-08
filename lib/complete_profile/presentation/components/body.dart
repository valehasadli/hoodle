import 'package:flutter/material.dart';

import '../../../common/config/responsive.dart';
import '../../../common/utils/theme_constants.dart';

import '../../../common/presentation/components/term_and_condition_text.dart';

import 'complete_profile_form.dart';

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
                  'Complete Profile',
                  style: kHeadingStyle,
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Responsive.screenHeight * 0.04),
                CompleteProfileForm(),
                SizedBox(height: Responsive.screenHeight * 0.04),
                TermAndConditionText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

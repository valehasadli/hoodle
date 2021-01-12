import 'package:flutter/material.dart';

import '../../../common/components/term_and_condition_text.dart';
import '../../../common/config/custom_size.dart';
import '../../../common/utils/constants.dart';

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
                SizedBox(height: CustomSize.screenHeight * 0.04),
                Text(
                  'Complete Profile',
                  style: headingStyle,
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: CustomSize.screenHeight * 0.04),
                CompleteProfileForm(),
                SizedBox(height: CustomSize.screenHeight * 0.04),
                TermAndConditionText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

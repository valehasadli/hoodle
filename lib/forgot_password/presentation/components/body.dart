import 'package:flutter/material.dart';

import '../../../common/presentation/components/no_account_text.dart';
import '../../../common/config/responsive.dart';

import 'forgot_password_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                SizedBox(height: Responsive.screenHeight * 0.08),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Container(
                  width: getProportionateScreenWidth(250),
                  child: Text(
                    'Please enter your email and we will send you a link to return to your account',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: Responsive.screenHeight * 0.1),
                ForgotPasswordForm(),
                SizedBox(height: Responsive.screenHeight * 0.2),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

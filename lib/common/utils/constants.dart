import 'package:flutter/material.dart';

import '../config/custom_size.dart';

const kPrimaryColor = Color(0xFF4284F4);
const kPrimaryLightColor = Color(0xFF818181);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFFA53E),
    Color(0xFFFF7643),
  ],
);

const kSearchBoxTitleTextStyle = TextStyle(
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

const kFormTextStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.w300,
);

final kCircularBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(
    getProportionateScreenWidth(20),
  ),
);

const kBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    bottomLeft: Radius.circular(20.0),
  ),
);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const int routeDurationInMilliseconds = 100;

const String kBaseUrl = 'https://hoodle-translation-api.herokuapp.com/api';

// Form Errors

// email constants
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kLongEmailError = "Email is too long";

// password constants
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kLongPassError = "Password is too long";
const String kMatchPassError = "Passwords don't match";
const String kPassShouldNotPasswordError = "Password should not 'password'";

// name constants
const String kNameNullError = "Please Enter your name";
const String kShortNameError = "Name is too short";
const String kLongNameError = "Name is too long";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// server errors
const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNEXPECTED_FAILURE_MESSAGE = 'Unexpected Failure';

import 'package:flutter/material.dart';

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
  borderRadius: BorderRadius.circular(20),
);

const kBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    bottomLeft: Radius.circular(20.0),
  ),
);

const kHeadingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

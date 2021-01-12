import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/constants.dart';
import '../config/custom_size.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final bool loading;
  final bool ready;

  const DefaultButton({
    Key key,
    @required this.text,
    @required this.press,
    this.color = kPrimaryColor,
    this.loading = false,
    this.ready = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: ready ? press : null,
        child: loading
            ? SpinKitWave(
                color: Colors.white,
                size: getProportionateScreenWidth(20),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
        color: color,
        disabledColor: kSecondaryColor,
      ),
    );
  }
}

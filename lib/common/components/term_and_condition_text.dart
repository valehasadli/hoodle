import 'package:flutter/material.dart';

class TermAndConditionText extends StatelessWidget {
  const TermAndConditionText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'By continuing your confirm that you agree \nwith our Term and Condition',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.caption,
    );
  }
}

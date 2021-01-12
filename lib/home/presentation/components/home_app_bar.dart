import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../common/components/rounded_icon_button.dart';
import '../../../common/config/custom_size.dart';

class HomeAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Row(
          children: [
            if (ExtendedNavigator.of(context).canPop())
              RoundedIconButton(
                icon: Icons.arrow_back_ios,
                press: () => ExtendedNavigator.of(context).maybePop(),
                showShadow: true,
              ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Text(
              'Hoodle',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(5)),
            Text(
              'Translation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

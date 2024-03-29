import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../configs/responsive.dart';
import '../rounded_icon_button.dart';

class GuestAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          // vertical: getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconButton(
              icon: Icons.arrow_back_ios,
              press: () => ExtendedNavigator.of(context).maybePop(),
              showShadow: true,
            ),
          ],
        ),
      ),
    );
  }
}

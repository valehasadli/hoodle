import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hoodle/common/errors/failures.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../common/config/custom_size.dart';
import '../../../common/utils/constants.dart';
import '../../../routes/router.gr.dart';
import '../../../login/api/auth_api.dart';

class HomeAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      brightness: Brightness.light,
      backgroundColor: kPrimaryColor,
      title: Row(
        children: [
          Text('Hoodle'),
          SizedBox(width: getProportionateScreenWidth(5)),
          Text(
            'Translation',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(MdiIcons.logout),
          onPressed: () async {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: const Text('Redirecting...'),
                ),
              );

            Future.delayed(const Duration(seconds: 2), () {
              ExtendedNavigator.of(context).push(
                Routes.splashScreen,
              );
            });
            await AuthApi().logout();
          },
          color: Colors.white,
        )
      ],
    );
  }
}

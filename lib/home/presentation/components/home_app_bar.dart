import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../common/config/custom_size.dart';
import '../../../common/utils/constants.dart';

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
          onPressed: () => print('call login domain api log out service'),
          color: Colors.white,
        )
      ],
    );
  }
}

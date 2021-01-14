import 'package:flutter/material.dart';

import '../../../common/utils/constants.dart';
import '../../../common/config/custom_size.dart';

class HomeAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      titleSpacing: getProportionateScreenWidth(20),
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
    );
  }
}

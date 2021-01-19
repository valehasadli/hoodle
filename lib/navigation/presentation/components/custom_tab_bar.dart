import 'package:flutter/material.dart';

import '../../../common/config/custom_size.dart';
import '../../../common/utils/constants.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isBottomIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? Border(
                bottom: BorderSide(
                  color: kPrimaryColor,
                  width: 3.0,
                ),
              )
            : Border(
                top: BorderSide(
                  color: kPrimaryColor,
                  width: 3.0,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((index, element) => MapEntry(
                index,
                Tab(
                  icon: Icon(
                    element,
                    color:
                        index == selectedIndex ? kPrimaryColor : Colors.black45,
                    size: getProportionateScreenWidth(30),
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

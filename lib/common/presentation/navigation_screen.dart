import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/custom_size.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../timeline/presentation/timeline_screen.dart';
import 'connection_sensitive_screen.dart';
import 'components/custom_tab_bar.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TimelineScreen(),
    ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.timeline,
    MdiIcons.account,
  ];

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return DefaultTabController(
      length: _icons.length,
      child: ConnectionSensitiveScreen(
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
            color: Colors.white,
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ),
      ),
    );
  }
}

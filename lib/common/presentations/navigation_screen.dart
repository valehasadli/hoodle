import 'package:flutter/material.dart';

import '../configs/responsive.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/profile_screen.dart';

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
    ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.account_box,
  ];

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
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

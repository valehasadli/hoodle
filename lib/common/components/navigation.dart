import 'package:flutter/material.dart';

import '../../common/config/custom_size.dart';

import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../timeline/presentation/timeline_screen.dart';
import '../../navigation/presentation/components/custom_tab_bar.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TimelineScreen(),
    ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.timeline,
    Icons.verified_user,
  ];

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/components/custom_bottom_navigation_bar.dart';
import '../../common/config/custom_size.dart';

import 'components/body.dart';
import 'components/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      backgroundColor: Color(0xFF4284F4),
      appBar: HomeAppBar(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

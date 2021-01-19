import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFF4284F4),
        appBar: HomeAppBar(),
        body: Body(),
      ),
    );
  }
}

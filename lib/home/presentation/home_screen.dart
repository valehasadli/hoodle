import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../common/components/custom_bottom_navigation_bar.dart';
import '../../common/config/custom_size.dart';
import '../../common/utils/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Scaffold(
          backgroundColor: Color(0xFF4284F4),
          appBar: buildAppBar(context),
          body: Body(animationController: _animationController),
          bottomNavigationBar: SizeTransition(
            sizeFactor: _animationController,
            axisAlignment: -1.0,
            child: CustomBottomNavigationBar(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 1) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _animationController.forward();
            break;
          case ScrollDirection.reverse:
            _animationController.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
}

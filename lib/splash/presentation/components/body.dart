import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../common/routes/router.gr.dart';
import '../../../common/presentations/components/default_button.dart';
import '../../../common/configs/responsive.dart';
import '../../../common/utils/theme_constants.dart';
import '../../../common/utils/animation_constants.dart';

import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Hoodle, Let’s translate!",
      "image": "assets/splash/splash_1.png"
    },
    {
      "text": "We help people connect each other",
      "image": "assets/splash/splash_2.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (int value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  image: splashData[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        ExtendedNavigator.of(context).push(
                          Routes.loginScreen,
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({@required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: index == currentPage ? 20 : 6,
      decoration: BoxDecoration(
        color: index == currentPage ? kPrimaryColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

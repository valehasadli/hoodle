import 'package:flutter/material.dart';

import 'form/translation_form.dart';
import 'history/translation_history.dart';

class Body extends StatelessWidget {
  final AnimationController animationController;

  const Body({
    Key key,
    @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              TranslationForm(
                animationController: animationController,
              ),
              TranslationHistory(),
            ],
          ),
        ),
      ),
    );
  }
}

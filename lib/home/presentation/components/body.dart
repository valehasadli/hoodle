import 'package:flutter/material.dart';

import 'form/translation_form.dart';
import 'history/translation_history.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
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
              TranslationForm(),
              TranslationHistory(),
            ],
          ),
        ),
      ),
    );
  }
}

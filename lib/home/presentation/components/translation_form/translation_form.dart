import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../common/configs/responsive.dart';
import '../../../../common/utils/theme_constants.dart';

import 'languages/languages.dart';
import 'translation/translation.dart';

class TranslationForm extends StatefulWidget {
  const TranslationForm({
    Key key,
  }) : super(key: key);

  @override
  _TranslationFormState createState() => _TranslationFormState();
}

class _TranslationFormState extends State<TranslationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(10),
        ),
        decoration: kCircularBoxDecoration,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Languages(),
              Divider(),
              Translation(),
            ],
          ),
        ),
      ),
    );
  }
}

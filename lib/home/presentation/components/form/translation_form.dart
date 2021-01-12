import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injections.dart';
import '../../../../common/config/custom_size.dart';
import '../../../../common/utils/constants.dart';

import '../../bloc/translation/translation_bloc.dart';

import 'languages/languages.dart';
import 'translation/translation.dart';

class TranslationForm extends StatefulWidget {
  final AnimationController animationController;

  const TranslationForm({
    Key key,
    @required this.animationController,
  }) : super(key: key);

  @override
  _TranslationFormState createState() => _TranslationFormState();
}

class _TranslationFormState extends State<TranslationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: widget.animationController,
      axisAlignment: -1.0,
      child: Padding(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(20),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(10),
          ),
          decoration: kCircularBoxDecoration,
          child: BlocProvider<TranslationBloc>(
            create: (BuildContext context) => serviceLocator<TranslationBloc>(),
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
        ),
      ),
    );
  }
}

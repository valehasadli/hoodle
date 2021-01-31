import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/constants.dart';

import '../../../bloc/translation/translation_bloc.dart';

part 'key_language_button.dart';
part 'value_language_button.dart';
part 'switch_language_button.dart';

class Languages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem> items = [
      DropdownMenuItem(
        child: Text('English'),
        value: 'en',
      ),
      DropdownMenuItem(
        child: Text('Russian'),
        value: 'ru',
      ),
      DropdownMenuItem(
        child: Text('Azerbaijan'),
        value: 'az',
      ),
      DropdownMenuItem(
        child: Text('Korean'),
        value: 'ko',
      ),
      DropdownMenuItem(
        child: Text('Turkish'),
        value: 'tr',
      ),
    ];
    return BlocBuilder<TranslationBloc, TranslationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeyLanguageButton(
              language: state.keyLanguageLocale,
              items: items,
            ),
            SwitchLanguageButton(
              keyLanguage: state.valueLanguageLocale,
              valueLanguage: state.keyLanguageLocale,
            ),
            ValueLanguageButton(
              language: state.valueLanguageLocale,
              items: items,
            ),
          ],
        );
      },
    );
  }
}

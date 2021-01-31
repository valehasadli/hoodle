import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/constants.dart';
import '../../../../../common/config/custom_size.dart';

import '../../../bloc/translation/translation_bloc.dart';

part 'translation_key.dart';
part 'translation_divider.dart';
part 'translation_value.dart';

class Translation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(10),
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          TranslationKey(),
          TranslationDivider(),
          TranslationValue(),
        ],
      ),
    );
  }
}

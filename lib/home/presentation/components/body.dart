import 'package:flutter/material.dart';

import '../../../common/presentation/components/auth_app_bar.dart';

import 'translation_form/translation_form.dart';
import 'translation_history/translation_history.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TrackingScrollController _scroll = TrackingScrollController();
    return SafeArea(
      child: CustomScrollView(
        controller: _scroll,
        slivers: [
          AuthAppBar(),
          SliverToBoxAdapter(
            child: TranslationForm(),
          ),
          SliverToBoxAdapter(
            child: TranslationHistory(),
          ),
        ],
      ),
    );
  }
}

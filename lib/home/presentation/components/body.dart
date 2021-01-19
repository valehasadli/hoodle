import 'package:flutter/material.dart';

import 'form/translation_form.dart';
import 'history/translation_history.dart';
import 'home_app_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TrackingScrollController _scroll = TrackingScrollController();
    return SafeArea(
      child: CustomScrollView(
        controller: _scroll,
        slivers: [
          HomeAppBar(),
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

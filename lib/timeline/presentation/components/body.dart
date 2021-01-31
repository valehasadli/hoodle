import 'package:flutter/material.dart';

import '../../../common/presentation/components/auth_app_bar.dart';
import 'timeline.dart';

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
            child: Timeline(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoodle/home/presentation/blocs/history/history_bloc.dart';
import 'package:hoodle/home/presentation/blocs/translation/translation_bloc.dart';
import 'package:hoodle/injections.dart';

import '../../../common/presentations/components/appbars/auth_app_bar.dart';

import 'translation_form/translation_form.dart';
import 'translation_history/translation_history.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TrackingScrollController _scroll = TrackingScrollController();
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TranslationBloc>(
            create: (BuildContext context) => serviceLocator<TranslationBloc>(),
          ),
          BlocProvider<HistoryBloc>(
            create: (BuildContext context) => serviceLocator<HistoryBloc>()
              ..add(
                const HistoryFetch(),
              ),
          ),
        ],
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
      ),
    );
  }
}

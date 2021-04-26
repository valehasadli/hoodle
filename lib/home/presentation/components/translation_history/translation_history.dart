import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoodle/home/presentation/blocs/translation/translation_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/configs/responsive.dart';
import '../../../../common/utils/theme_constants.dart';
import '../../../domain/entities/history_entity.dart';
import '../../blocs/history/history_bloc.dart';

part 'history.dart';
part 'history_card.dart';
part 'history_error.dart';
part 'history_loading.dart';

class TranslationHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getProportionateScreenWidth(10)),
          topRight: Radius.circular(getProportionateScreenWidth(10)),
        ),
      ),
      height: Responsive.screenHeight * 0.6,
      width: double.infinity,
      child: BlocListener<TranslationBloc, TranslationState>(
        listener: (context, state) {
          if (state.status == TranslationStatus.success &&
              state.event is TranslationAddHistory) {
            context.read<HistoryBloc>().add(HistoryFetch());
          }
        },
        child: BlocConsumer<HistoryBloc, HistoryState>(
          listener: (context, state) {
            if (state.status == HistoryStatus.scroll) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: const Text('History Loading'),
                  ),
                );
            }
            if (state.status == HistoryStatus.success) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
          builder: (context, state) {
            if (state.status == HistoryStatus.failure) {
              return HistoryError();
            }

            if (state.status == HistoryStatus.progress) {
              return HistoryLoading();
            }

            return History(history: state.history);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/config/custom_size.dart';
import '../../../../common/utils/constants.dart';
import '../../../../injections.dart';
import '../../../domain/entities/history_entity.dart';
import '../../bloc/history/history_bloc.dart';

part 'history.dart';
part 'history_card.dart';
part 'history_error.dart';
part 'history_loading.dart';

class TranslationHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (BuildContext context) => serviceLocator<HistoryBloc>()
        ..add(
          const HistoryFetch(),
        ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenWidth(10)),
            topRight: Radius.circular(getProportionateScreenWidth(10)),
          ),
        ),
        height: CustomSize.screenHeight * 0.6,
        width: double.infinity,
        child: BlocConsumer<HistoryBloc, HistoryState>(
          listener: (context, state) {
            if (state.status == HistoryStatus.scroll) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: const Text('History Loading'),
                  ),
                );
            } else if (state.status == HistoryStatus.success) {
              Scaffold.of(context).hideCurrentSnackBar();
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injections.dart';
import '../../../common/config/custom_size.dart';

import '../bloc/timeline_bloc.dart';
import '../../domain/entities/timeline_entity.dart';

part 'timeline/item_card.dart';
part 'timeline/success.dart';
part 'timeline/progress.dart';
part 'timeline/failure.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimelineBloc>(
      create: (BuildContext context) => serviceLocator<TimelineBloc>()
        ..add(
          const TimelineFetch(),
        ),
      child: Container(
        height: CustomSize.screenHeight,
        width: double.infinity,
        child: BlocConsumer<TimelineBloc, TimelineState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == TimelineStatus.progress) {
              return Progress();
            }
            if (state.status == TimelineStatus.failure) {
              return Failure();
            }

            return Success(timeline: state.timeline);
          },
        ),
      ),
    );
  }
}

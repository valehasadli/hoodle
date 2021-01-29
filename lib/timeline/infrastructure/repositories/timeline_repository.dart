import 'dart:io';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../common/errors/failures.dart';
import '../../../common/errors/exceptions.dart';
import '../../../common/platform/internet.dart';
import '../../../common/models/meta_model.dart';
import '../../domain/entities/timeline_entity.dart';
import '../../domain/interfaces/timeline_interface.dart';
import '../data_sources/timeline_remote_data_provider.dart';
import '../data_sources/timeline_local_data_provider.dart';
import '../models/timeline_model.dart';

class TimelineRepository implements TimelineInterface {
  final Internet internet;
  final TimelineRemoteDataProvider timelineRemoteDataProvider;
  final TimelineLocalDataProvider timelineLocalDataProvider;

  const TimelineRepository({
    @required this.internet,
    @required this.timelineRemoteDataProvider,
    @required this.timelineLocalDataProvider,
  });

  @override
  Future<Either<Failure, List<TimelineEntity>>> fetchTimeline() async {
    if (await internet.isConnected) {
      try {
        final Map data = await timelineRemoteDataProvider.fetchTimeline();

        final MetaModel metaModel = data['meta'];
        final List<TimelineModel> timelineModel = data['timeline'];

        final List<TimelineEntity> timeline = timelineModel
            .map(
              (timeline) => TimelineEntity(
                id: timeline.id,
                message: timeline.message,
              ),
            )
            .toList();

        await timelineLocalDataProvider.cacheTimeline(model: timelineModel);

        return Right(timeline);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw SocketException('internet connection problem');
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../injections.dart';
import '../../common/errors/failures.dart';

import '../domain/entities/timeline_entity.dart';
import '../domain/interfaces/timeline_interface.dart';
import '../application/timeline_facade_service.dart';

class TimelineApi implements TimelineInterface {
  final TimelineFacadeService _service =
      serviceLocator<TimelineFacadeService>();

  @override
  Future<Either<Failure, List<TimelineEntity>>> fetchTimeline() async {
    return await _service.fetchTimeline();
  }
}

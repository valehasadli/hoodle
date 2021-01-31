import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:hoodle/injections.dart';
import 'package:hoodle/timeline/domain/entities/timeline_entity.dart';
import 'package:hoodle/timeline/domain/interfaces/timeline_interface.dart';

import '../../common/errors/failures.dart';
import '../application/timeline_facade_service.dart';

class TimelineApi implements TimelineInterface {
  final TimelineFacadeService _service =
      serviceLocator<TimelineFacadeService>();

  @override
  Future<Either<Failure, List<TimelineEntity>>> fetchTimeline({
    @required int page,
  }) async {
    return await _service.fetchTimeline(page: page);
  }
}

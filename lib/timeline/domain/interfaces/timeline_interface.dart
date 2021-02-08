import 'package:dartz/dartz.dart';
import '../../../common/errors/failures.dart';
import '../entities/timeline_entity.dart';

abstract class TimelineInterface {
  Future<Either<Failure, List<TimelineEntity>>> fetchTimeline();
}

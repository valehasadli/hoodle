import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import '../../common/errors/failures.dart';
import '../domain/entities/timeline_entity.dart';
import '../domain/interfaces/timeline_interface.dart';
import '../infrastructure/repositories/timeline_repository.dart';

class TimelineFacadeService implements TimelineInterface {
  final TimelineRepository repository;

  const TimelineFacadeService({@required this.repository});

  Future<Either<Failure, List<TimelineEntity>>> fetchTimeline() async {
    return await repository.fetchTimeline();
  }
}

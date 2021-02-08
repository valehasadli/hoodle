import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TimelineEntity extends Equatable {
  final int id;
  final String message;

  const TimelineEntity({
    @required this.id,
    @required this.message,
  });

  @override
  List<Object> get props => [
        id,
        message,
      ];
}

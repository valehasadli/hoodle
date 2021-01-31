import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TimelineEntity extends Equatable {
  final int id;
  final String message;
  final int currentPage;
  final int lastPage;
  final int total;

  const TimelineEntity({
    @required this.id,
    @required this.message,
    @required this.currentPage,
    @required this.lastPage,
    @required this.total,
  });

  @override
  List<Object> get props => [
        id,
        message,
        currentPage,
        lastPage,
        total,
      ];
}

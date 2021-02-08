import 'package:meta/meta.dart';

class TimelineModel {
  TimelineModel({
    @required this.id,
    @required this.message,
  });

  final int id;
  final String message;

  factory TimelineModel.fromJson(Map<String, dynamic> json) => TimelineModel(
        id: json["id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
      };
}

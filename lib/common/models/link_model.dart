import 'package:meta/meta.dart';

class LinkModel {
  LinkModel({
    @required this.first,
    @required this.last,
    @required this.prev,
    @required this.next,
  });

  final String first;
  final String last;
  final dynamic prev;
  final String next;

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

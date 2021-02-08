part of '../timeline.dart';

class Success extends StatelessWidget {
  final List<TimelineEntity> timeline;

  Success({
    Key key,
    @required this.timeline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: timeline.length,
      itemBuilder: (_, index) {
        return ItemCard(timeline: timeline[index]);
      },
    );
  }
}

part of '../timeline.dart';

class Success extends StatelessWidget {
  final List<TimelineEntity> timeline;
  final ScrollController _scroll = ScrollController();

  Success({
    Key key,
    @required this.timeline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scroll
        ..addListener(() {
          if (_scroll.offset == _scroll.position.maxScrollExtent &&
              context.read<TimelineBloc>().state.total > timeline.length) {
            context.read<TimelineBloc>().add(TimelineScrolled());
          }
        }),
      itemCount: timeline.length,
      itemBuilder: (_, index) {
        return ItemCard(timeline: timeline[index]);
      },
    );
  }
}

part of 'translation_history.dart';

class History extends StatelessWidget {
  final List<HistoryEntity> history;
  final ScrollController _scroll = ScrollController();

  History({
    Key key,
    @required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(history.length);
    return ListView.builder(
      controller: _scroll
        ..addListener(() {
          if (_scroll.offset == _scroll.position.maxScrollExtent &&
              context.read<HistoryBloc>().state.total > history.length) {
            context.read<HistoryBloc>().add(HistoryScrolled());
          }
        }),
      itemCount: history.length,
      itemBuilder: (_, index) {
        return HistoryCard(history: history[index]);
      },
    );
  }
}

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
    return ListView.builder(
      controller: _scroll
        ..addListener(() {
          if (_scroll.offset == _scroll.position.maxScrollExtent) {
            BlocProvider.of<HistoryBloc>(context).add(HistoryScrolled());
          }
        }),
      itemCount: history.length,
      itemBuilder: (_, index) {
        return HistoryCard(history: history[index]);
      },
    );
  }
}

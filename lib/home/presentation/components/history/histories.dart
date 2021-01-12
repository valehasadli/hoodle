part of 'translation_history.dart';

class Histories extends StatelessWidget {
  final List<HistoryEntity> histories;

  const Histories({
    Key key,
    @required this.histories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: histories.length,
      itemBuilder: (_, index) {
        return HistoryCard(history: histories[index]);
      },
    );
  }
}

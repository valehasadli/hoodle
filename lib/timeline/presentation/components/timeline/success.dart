part of '../timeline.dart';

class Success extends StatelessWidget {
  final QuerySnapshot querySnapshot;

  const Success({
    Key key,
    @required this.querySnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: querySnapshot.size,
      itemBuilder: (_, index) {
        return ItemCard(documentSnapshot: querySnapshot.docs[index]);
      },
    );
  }
}
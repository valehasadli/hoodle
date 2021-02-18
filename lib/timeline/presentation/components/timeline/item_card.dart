part of '../timeline.dart';

class ItemCard extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const ItemCard({
    Key key,
    @required this.documentSnapshot,
  }) : super(key: key);

  Map<String, dynamic> get timeline {
    return documentSnapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        top: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenWidth(10),
          ),
        ),
      ),
      child: Text(timeline['message']),
    );
  }
}

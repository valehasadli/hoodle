part of 'translation_history.dart';

class HistoryError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenWidth(50)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Icon(
              Icons.error,
              size: getProportionateScreenWidth(50),
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

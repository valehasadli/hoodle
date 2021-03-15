part of 'translation_history.dart';

class HistoryCard extends StatelessWidget {
  final HistoryEntity history;

  const HistoryCard({
    Key key,
    @required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Responsive.screenWidth * 0.7,
                  child: Text(
                    history.key,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.star_outline,
                    color: Colors.orange.shade200,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              history.value,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            margin: EdgeInsets.only(
              top: getProportionateScreenWidth(10),
              bottom: getProportionateScreenWidth(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 16.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    '${history.keyLanguageLocale.toUpperCase()}-${history.valueLanguageLocale.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.copy_outlined,
                    size: getProportionateScreenWidth(16),
                    color: Colors.grey.shade400,
                  ),
                  onPressed: () => buildSnackBar(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildSnackBar(BuildContext context) {
    return Clipboard.setData(
      ClipboardData(text: history.value),
    ).then((_) {
      const snackBar = SnackBar(
        content: const Text('copied to clipboard'),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }
}

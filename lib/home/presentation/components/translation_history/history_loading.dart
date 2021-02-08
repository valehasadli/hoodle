part of 'translation_history.dart';

class HistoryLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: ListView.builder(
                itemBuilder: (_, __) => Container(
                  margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    top: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(20),
                  ),
                  // height: MediaQuery.of(context).size.height * 0.12,
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
                              width: getProportionateScreenWidth(200),
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
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.copy_outlined,
                                size: 16.0,
                                color: Colors.grey.shade400,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/theme_constants.dart';
import '../../config/responsive.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final Function press;
  final Color color;
  final bool loading;
  final bool ready;

  const DefaultButton({
    Key key,
    @required this.text,
    @required this.press,
    this.color = kPrimaryColor,
    this.loading = false,
    this.ready = true,
  }) : super(key: key);

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  bool _isConnected = true;

  void setStateIfMounted(Function function) {
    if (mounted) setState(function);
  }

  @override
  Widget build(BuildContext context) {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          setStateIfMounted(() => _isConnected = true);
          break;
        case DataConnectionStatus.disconnected:
          setStateIfMounted(() => _isConnected = false);
          break;
      }
    });
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: widget.ready && _isConnected ? widget.press : null,
        child: widget.loading
            ? SpinKitWave(
                color: Colors.white,
                size: getProportionateScreenWidth(20),
              )
            : Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
        color: widget.color,
        disabledColor: kSecondaryColor,
      ),
    );
  }
}

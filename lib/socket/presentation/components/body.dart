import 'package:flutter/material.dart';
import 'package:flutter_pusher_client/flutter_pusher.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    PusherOptions options = PusherOptions(
      host: 'localhost',
      port: 6001,
      auth: PusherAuth.fromJson({
        'headers': {
          'Authorization': 'Bearer 131|m1GTGKfc6eZitSF9M7mRoVLGEU0anDfnkkBik2GB'
        }
      }),
      cluster: 'ap2',
      encrypted: true,
    );

    FlutterPusher pusher = FlutterPusher(
      '7d4b069089528dc40d73',
      options,
      enableLogging: true,
      onError: (val) => print("Pusher error: ${val.exception}"),
      onConnectionStateChange: (val) =>
          print('Pusher state: ${val.currentState}'),
    );

    // Echo echo = new Echo({
    //   'broadcaster': 'pusher',
    //   'client': pusher,
    //   'auth': {
    //     'headers': {
    //       'Authorization': 'Bearer 2|k91ufoVuniqtZPyZiqwvv1xLJZQW330SicM15OYQ',
    //     }
    //   }
    // });

    var channel = pusher.subscribe('timeline');
    channel.bind('timeline.update', (val) => print(val));
    // echo.connect();
    // echo.join('timeline');
    // echo.channel('timeline').listen('timeline.update', (e) {
    //   print(e);
    // });

    //print(echo.);
    // socket.on('connect', (_) => print('connect'));
    //echo.socket.on('disconnect', (_) => print('disconnect'));
    return Container(
      child: Center(
        child: Text('socket'),
      ),
    );
  }
}

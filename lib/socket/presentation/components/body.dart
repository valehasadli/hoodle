import 'package:flutter/material.dart';
import 'package:flutter_pusher_client/flutter_pusher.dart';
import 'package:laravel_echo/laravel_echo.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> initPusher() async {
    final PusherOptions options = PusherOptions(
      auth: PusherAuth(
        'https://hoodle-translation-api.herokuapp.com/broadcasting/auth',
      ),
      encrypted: true,
      cluster: 'ap2',
    );
    FlutterPusher pusher;
    pusher = FlutterPusher('7d4b069089528dc40d73', options, enableLogging: true,
        onConnectionStateChange: (ConnectionStateChange state) async {
      print('stateChange ${state.toJson()}');
      if (pusher != null && state.currentState == 'CONNECTED') {
        pusher.subscribe('timeline').bind('timeline.update',
            (event) => print("Event Kamran" + event.toString()));

        // final String socketId = pusher.getSocketId();
        // print(
        //   'pusher socket id: $socketId',
        // ); // Laravel echo will subscribe the channel with full namespace.
        // // Ex: App\Events
        // final Echo echo = Echo(<String, dynamic>{
        //   'broadcaster': 'pusher',
        //   'client': pusher,
        // });
        // echo.channel('timeline').listen('timeline.update', (event) {
        //   print('event: $event');
        //   // final Message msg = Message.fromJson(message);
        //   // messages.add(msg);
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initPusher();
    // PusherOptions options = PusherOptions(
    //   encrypted: false,
    //   host: 'https://hoodle-translation-api.herokuapp.com',
    //   cluster: 'ap2',
    //   port: 6001,
    //   auth: PusherAuth(
    //     'https://hoodle-translation-api.herokuapp.com/broadcasting/auth',
    //     headers: {
    //       'Authorization': 'Bearer 181|tBt2BYwxmYy8WpCCpfD7FWotw5qaYtS41e5xRjEa'
    //     },
    //   ),
    // );
    //
    // FlutterPusher pusher = FlutterPusher(
    //   '7d4b069089528dc40d73',
    //   options,
    //   enableLogging: true,
    //   onError: (val) => print("Pusher error: ${val.exception}"),
    //   onConnectionStateChange: (val) =>
    //       print('Pusher state: ${val.currentState}'),
    // );
    //
    // Echo echo = new Echo({
    //   'broadcaster': 'pusher',
    //   'client': pusher,
    //   'wsHost': 'https://hoodle-translation-api.herokuapp.com',
    //   'httpHost': 'https://hoodle-translation-api.herokuapp.com',
    //   'wsPort': 6001,
    //   'auth': {
    //     'headers': {
    //       'Authorization': 'Bearer 181|tBt2BYwxmYy8WpCCpfD7FWotw5qaYtS41e5xRjEa'
    //     }
    //   },
    //   'authEndpoint':
    //       'https://hoodle-translation-api.herokuapp.com/broadcasting/auth',
    //   'disableStats': true,
    //   'forceTLS': false,
    //   'enabledTransports': ['ws', 'wss']
    // });
    //
    // echo.join('timeline')
    //   ..listen('timeline.update', (event) {
    //     print(event);
    //   });

    return Container(
      child: Center(
        child: Text('socket'),
      ),
    );
  }
}

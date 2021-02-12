import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:pusher_websocket_flutter/pusher.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Event lastEvent;
  String lastConnectionState;
  Channel channel;

  var channelController = TextEditingController(text: 'timeline');
  var eventController = TextEditingController(text: 'timeline.update');

  @override
  void initState() {
    super.initState();
    initPusher();
  }

  Future<void> initPusher() async {
    try {
      await Pusher.init(
        '7d4b069089528dc40d73',
        PusherOptions(
          cluster: 'ap2',
          auth: PusherAuth(
            'https://hoodle-translation-api.herokuapp.com/broadcasting/auth',
            headers: {
              'Authorization':
                  'Bearer 1|8OICezrFEDEiDFa7l1yO6P0g13eEA9d7uNv1hofN',
            },
          ),
          encrypted: true,
        ),
        enableLogging: true,
      );
    } on PlatformException catch (e) {
      print(e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildInfo(),
              RaisedButton(
                child: Text("Connect"),
                onPressed: () {
                  Pusher.connect(onConnectionStateChange: (x) async {
                    if (mounted)
                      setState(() {
                        lastConnectionState = x.currentState;
                      });
                  }, onError: (x) {
                    debugPrint("Error: ${x.message}");
                  });
                },
              ),
              RaisedButton(
                child: Text("Disconnect"),
                onPressed: () {
                  Pusher.disconnect();
                },
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      controller: channelController,
                      decoration: InputDecoration(hintText: "Channel"),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Subscribe"),
                    onPressed: () async {
                      channel = await Pusher.subscribe(channelController.text);
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      controller: channelController,
                      decoration: InputDecoration(hintText: "Channel"),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Unsubscribe"),
                    onPressed: () async {
                      await Pusher.unsubscribe(channelController.text);
                      channel = null;
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      controller: eventController,
                      decoration: InputDecoration(hintText: "Event"),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Bind"),
                    onPressed: () async {
                      await channel.bind(eventController.text, (x) {
                        if (mounted)
                          setState(() {
                            lastEvent = x;
                          });
                      });
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      controller: eventController,
                      decoration: InputDecoration(hintText: "Event"),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Unbind"),
                    onPressed: () async {
                      await channel.unbind(eventController.text);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Connection State: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastConnectionState ?? "Unknown"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Last Event Channel: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastEvent?.channel ?? ""),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Last Event Name: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastEvent?.event ?? ""),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Last Event Data: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(lastEvent?.data ?? ""),
          ],
        ),
      ],
    );
  }
}

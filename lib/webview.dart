import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as sio;

import 'home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late final Completer<WebViewController> controller;
  sio.Socket? socket;
  @override
  void initState() {
    connectAndListen();

    super.initState();
  }
  connectAndListen() {
    var socket = sio.io("http://127.0.0.1:3000/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((_) {
      log("Successfully Connected");
      socket.emit('book room', 'Test Message');
      socket.on('msgServer', (server) {
        log(server);
        //Navigator.pop(context);
        //if (server.isEmpty == false) {
        //if(mounted) {
        //setState(() {
        // Navigator.of(context).pop();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) =>const Home()));
        // });
        // });

        //}
      });
    });
    socket.onConnectError((data) {
      //log(data);
    });
    socket.onError((data) {
      //log(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Telebirr WebView',
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0), child: AppBar()),
          body: const WebView(
            initialUrl: "http://127.0.0.1:3000/",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}

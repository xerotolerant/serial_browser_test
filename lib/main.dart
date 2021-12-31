import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js.dart' as js;
import 'dart:js_util';

import 'package:serial_browser_test/serialport.dart';

@JS('window.alert')
external void alert(String str);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void callJS() async {
    print('calling js');
    alert('js called successfully');
  }

  requestSerialPort() async {
    print('requesting serial port');
    final port = await promiseToFuture(requestPort());
    print(port);
    port.open();
    // print(port.open());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('text'),
          ElevatedButton(
            onPressed: callJS,
            child: const Text('call js'),
          ),
          ElevatedButton(
            onPressed: requestSerialPort,
            child: const Text('Request Serial Port'),
          ),
        ],
      ),
    );
  }
}

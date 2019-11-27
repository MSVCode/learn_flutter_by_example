import 'package:flutter/material.dart';
import 'package:isolates/DemoPage.dart';

void main() => runApp(MyApp());

const appName = 'Isolate';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoPage(appName),
    );
  }
}
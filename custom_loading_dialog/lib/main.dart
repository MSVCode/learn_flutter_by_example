import 'dart:math';

import 'package:custom_loading_dialog/widget/LoadingDialog.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Dialog',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<LoadingDialogState> loadingKey = GlobalKey();

  void showLoading() {
    showLoadingDialog(context: context, key: loadingKey);

    Future.delayed(Duration(seconds: 2), () => loadingKey.currentState.close());
  }

  void showLoadingWithProgress() async {
    showLoadingDialog(context: context, progressBar: true, key: loadingKey);

    Future.delayed(Duration(seconds: 1), () => this.addProgress());
  }

  double progress = 0;
  Random random = Random();
  void addProgress() {
    progress += random.nextInt(30) / 100 + 0.1; //no need to setstate
    loadingKey.currentState.setProgress(progress);

    if (progress < 1) {
      Future.delayed(Duration(seconds: 1), () => this.addProgress());
    } else {
      progress = 0;
      loadingKey.currentState.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Dialog"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Simple Loading"),
              onPressed: showLoading,
            ),
            RaisedButton(
              child: Text("Loading with Progress"),
              onPressed: showLoadingWithProgress,
            ),
            // RaisedButton(
            //   child: Text("Simple Dialog"),
            //   onPressed: () => showDialog(
            //     context: context,
            //     builder: (_) => Dialog(
            //       child: SizedBox(
            //         height: 150,
            //         child: Center(child: Text("I'm a Dialog")),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isolates/helper/primeNumber.dart';

class DemoPage extends StatefulWidget {
  final String title;

  DemoPage(this.title);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<int> primes = [];

  void callWithoutIsolate() {
    setState(() => primes = []);
    var output = findPrimeNumbers(2500);
    setState(() => primes = output);
  }

  void callWithIsolate() async {
    setState(() => primes = []);
    var output = await compute(findPrimeNumbers, 2500);
    setState(() => primes = output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text("To see if we skip frames"),
            LinearProgressIndicator(),
            CircularProgressIndicator(),
            LinearProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text("Without Isolate"),
              onPressed: callWithoutIsolate,
            ),
            RaisedButton(
              child: Text("With Isolate"),
              onPressed: callWithIsolate,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Last Primary Number Found is: ${primes.length > 0 ? primes[primes.length - 1] : "--"}",
            ),
          ],
        ),
      ),
    );
  }
}

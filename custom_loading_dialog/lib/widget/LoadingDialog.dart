import "package:flutter/material.dart";

class LoadingDialog extends StatefulWidget {
  final bool progressBar;

  LoadingDialog({this.progressBar = false, Key key}) : super(key: key);

  @override
  LoadingDialogState createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
  double progress = 0; //0-1

  void close() {
    Navigator.pop(context);
  }

  void setProgress(double value) {
    if (value < 0) value = 0;
    if (value > 1) value = 1;

    setState(() {
      progress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Container(
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              widget.progressBar == true
                  ? LinearProgressIndicator(
                      value: progress,
                    )
                  : CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Loading"),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );

    // return Dialog(
    //   child: Container(
    //     height: 150,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         LinearProgressIndicator(
    //           value: progress,
    //         ),
    //         Text("Loading"),
    //       ],
    //     ),
    //   ),
    // );

    // return Dialog(
    //   child: Container(
    //     height: 150,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         CircularProgressIndicator(),
    //         Text("Loading"),
    //       ],
    //     ),
    //   ),
    // );
  }
}

Future<DateTime> showLoadingDialog(
    {@required BuildContext context, bool progressBar, Key key}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) {
      return LoadingDialog(progressBar: progressBar, key: key);
    },
  );
}

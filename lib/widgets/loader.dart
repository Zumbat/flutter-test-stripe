import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderDialog {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  children: <Widget>[
                    Center(
                      child: Column(children: const [
                        SpinKitDoubleBounce(size: 70, color: Colors.blueAccent),
                      ]),
                    )
                  ]));
        });
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

class SnackBarDemo extends StatefulWidget {
  SnackBarDemo({Key key}) : super(key: key);

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}


class _SnackBarDemoState extends State<SnackBarDemo> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SnackBarDemo'),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SnackBarButton()
              ]
            )
         ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Open SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Processing...'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            )
          )
        );
      },
    );
  }
}
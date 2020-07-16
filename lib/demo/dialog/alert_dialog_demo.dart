import 'package:flutter/material.dart';
import 'dart:async';

class AlertDialogDemo extends StatefulWidget {
  AlertDialogDemo({Key key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}


enum Action {
  Ok,Cancel
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = "Nothing";

  Future<void> _openAlertDialog () async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false, // 点击空白处不关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
              child: Text('Cancel')
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, Action.Ok);
              },
              child: Text('Ok')
            )
          ],
        );
      }
    );
    
    if( action == null)  return;

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'cancel';
        });
        break;
      default:
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialogDemo'),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('your choice is: ${_choice}'),
                SizedBox(
                  height: 16.0,
                ),
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                )
              ]
            )
         ),
      ),
    );
  }
}
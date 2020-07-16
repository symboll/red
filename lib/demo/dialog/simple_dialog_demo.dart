import 'package:flutter/material.dart';
import 'dart:async';

class SimpleDialogDemo extends StatefulWidget {
  SimpleDialogDemo({Key key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

enum Option {
  A,B,C
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String choice = 'Nothing';
  Future<void> _openSimpleDialog () async {
    final option = await showDialog(
      context: context,
      builder:(BuildContext context) {
        return  SimpleDialog(
          title: Text('SimpleDialog'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: () {
                Navigator.pop(context, Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: () {
                Navigator.pop(context, Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: () {
                Navigator.pop(context, Option.C);
              },
            )
          ],
        );
      }
    );
    
    if(option == null) return;

    // setState(() {
    //   choice = option;
    // });
    switch (option) {
      case Option.A:
        setState(() {
          choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          choice = 'C';
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
          title: Text('SimpleDialogDemo'),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('your choice is ${choice}')
              ]
            )
         ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.format_list_numbered),
          onPressed: _openSimpleDialog
        ),
      ),
    );
  }
}
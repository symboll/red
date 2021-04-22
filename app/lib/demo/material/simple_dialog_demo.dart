import 'package:flutter/material.dart';
import 'dart:async';

enum Options{
  A, B, C
}
 
class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

  Future<void> _openSimpleDialog () async {
    Options res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          children: [
            SimpleDialogOption(
              child:  Text('hello A'),
              onPressed: () {
                Navigator.pop(context, Options.A);
              },
            ),
            SimpleDialogOption(
              child:  Text('hello B'),
              onPressed: () {
                Navigator.pop(context, Options.B);
              },
            ),
            SimpleDialogOption(
              child:  Text('hello C'),
              onPressed: () {
                Navigator.pop(context, Options.C);
              },
            )
          ],
        ); 
      }
    );

    // switch (option) {
    //   case Options.A:
    //     this.setState(() {
    //       _choice = "A";
    //     });
    //     break;
    // }
    if(res != null) {
      this.setState(() {
        _choice = res.toString().split('.')[1];
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialog'),
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[600]
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('your choice is $_choice')
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
} 
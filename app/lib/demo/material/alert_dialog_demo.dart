import 'package:flutter/material.dart';
import 'dart:async';

enum Options{
  Ok,
  Cancel
}
 
class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';
  Future<void> _openAlertDialog () async{
    Options res = await showDialog(
      context: context,
      barrierDismissible: false,    // 点击蒙层是否能关闭
      // barrierColor: Colors.red,  // 蒙层颜色
      builder: (BuildContext context) => AlertDialog(
        title: Text('Alert Dialog'),
        content: Text('Are you sure about this?'),
        actions: [
          FlatButton(
            child: Text('Cancel'),
             onPressed: () { Navigator.pop(context, Options.Cancel); } 
          ),
          FlatButton(
            child: Text('Ok'),
            onPressed: () { Navigator.pop(context, Options.Ok); } 
          ),
        ],
      )
    );

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
        title: Text('AlertDialog'),
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
              Text('your choice is $_choice'),
              SizedBox(height: 16.0,),
              RaisedButton(
                child: Text('Open AlertDialog'),
                onPressed: _openAlertDialog
              )
            ],
          ),
        )
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.format_list_numbered),
      //   onPressed: _openAlertDialog,
      // ),
    );
  }
} 
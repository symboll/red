import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}



class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  String _choice = 'Nothing';
  _openBottomSheet () {
    _bottomSheetScaffoldKey
    .currentState
    .showBottomSheet((context) => BottomAppBar(
      child: Container(
        height: 90.0,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.pause_circle_outline),
            SizedBox(
              width: 16.0,
            ),
            Text('01:30 / 03: 30'),
            Expanded(
              child: Text(
                'Fix you - Coldplay',
                textAlign: TextAlign.right,
              ),
            )

          ],
        ),
      ),
    ));
  }
  
  Future<void> _openModelBottomSheet() async {
    final action = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context,'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context,'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context,'C');
                  },
                ),
                ListTile(
                  title: Text('Option D'),
                  onTap: () {
                    Navigator.pop(context,'D');
                  },
                )
              ],
            ),
          ),
        );
      }
    );
    
    if(action == null) { return; }
    print('action is ${action}');
    setState(() {
      _choice = action;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _bottomSheetScaffoldKey,
        appBar: AppBar(
          title: Text('BottomSheetDemo'),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('your choiced is: ${_choice}'),
                SizedBox(height: 16.0,),
                FlatButton(
                  onPressed: _openBottomSheet,
                  child: Text('Open Bottom Sheet'),
                ),
                FlatButton(
                  onPressed: _openModelBottomSheet,
                  child: Text('Open Model Bottom Sheet'),
                )
              ]
            )
         ),
      ),
    );
  }
}

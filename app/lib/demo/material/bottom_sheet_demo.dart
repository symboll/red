import 'package:flutter/material.dart';
import 'dart:async';


 
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  String _choice = 'Nothing';

  void _handleOpenBottomSheet () {
    _bottomSheetScaffoldKey.currentState.showBottomSheet(
      (BuildContext context) => BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16.0,),
              Text('01: 30 / 03: 30'),
              Expanded(
                child: Text('Fix you - Coldplay', textAlign:  TextAlign.right,)
              )
            ],
          ),
        ),
      )
    );
  }

  _handleTap (string) {
    Navigator.pop(context, string);
  }
  Future<void> _handleOpenModalBottomSheet () async{
    String res = await showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) => Container(
        height: 300.0,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Option A'),
                onTap: () => _handleTap('A'),
              ),
              ListTile(
                title: Text('Option B'),
                onTap: () => _handleTap('B'),
              ),
              ListTile(
                title: Text('Option C'),
                onTap: () => _handleTap('C'),
              ),
              ListTile(
                title: Text('Option D'),
                onTap: () => _handleTap('D'),
              )
            ],
          )
        )
      )
    );

    if(res != null){
      this.setState(() {
        _choice = res;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheet'),
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
              FlatButton(
                child: Text('Open Bottom Sheet'),
                onPressed: _handleOpenBottomSheet
              ),
              FlatButton(
                child: Text('Open Model Bottom Sheet'),
                onPressed: _handleOpenModalBottomSheet
              )
            ],
          ),
        )
      ),
    );
  }
} 
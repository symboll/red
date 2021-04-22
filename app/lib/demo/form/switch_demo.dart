
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchValue = false;

  void _handleSwitchChange (bool value) {
    this.setState(() {
      _switchValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
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
              SwitchListTile(
                value: _switchValue, 
                onChanged: _handleSwitchChange,
                // selected: ,
                title: Text('Switch Item') ,
                subtitle: Text('Description'),
                secondary: Icon( _switchValue ? Icons.visibility : Icons.visibility_off),
                selected: _switchValue,
                activeColor: Colors.red,
              ),
              // Row( 
              //   children: [
              //     Switch(
              //       value: _switchValue, 
              //       onChanged: _handleSwitchChange
              //     )
              //   ],
              // )
            ],
          ),
        )
      )
    );
  }
}
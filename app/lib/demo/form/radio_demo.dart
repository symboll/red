

import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {

  int _radioGroupValue = 0;

  void _handleRadioChange (int value) {
    this.setState(() {
      _radioGroupValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
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
              RadioListTile(
                value: 0, 
                groupValue: _radioGroupValue, 
                onChanged: _handleRadioChange,
                title: Text('Option A'),
                subtitle: Text('Description A'),
                secondary: Icon(Icons.filter_1),
                selected: _radioGroupValue == 0,
              ),
              RadioListTile(
                value: 1, 
                groupValue: _radioGroupValue, 
                onChanged: _handleRadioChange,
                title: Text('Option B'),
                subtitle: Text('Description B'),
                secondary: Icon(Icons.filter_2),
                selected:  _radioGroupValue == 1,
              ),
              RadioListTile(
                value: 2, 
                groupValue: _radioGroupValue, 
                onChanged: _handleRadioChange,
                title: Text('Option C'),
                subtitle: Text('Description C'),
                secondary: Icon(Icons.filter_3),
                selected:  _radioGroupValue == 2,
              ),
              // Row(
              //   children: [
              //     Radio(
              //         value: 0, 
              //         groupValue: _radioGroupA, 
              //         onChanged: _handleRadioChange
              //       ),
              //       Radio(
              //         value: 1, 
              //         groupValue: _radioGroupA, 
              //         onChanged: _handleRadioChange
              //       )
              //   ],
              // )
            ],
          ),
        )
      )
    );
  }
}
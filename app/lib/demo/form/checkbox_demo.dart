

import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
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
              CheckboxListTile(
                value: _checkboxValue, 
                onChanged: (value) {  
                  this.setState(() {
                    _checkboxValue = value;
                  });
                },
                title: Text('Checkbox Item A'),
                subtitle: Text('Description A'),
                secondary: Icon(Icons.bookmark),
                selected: _checkboxValue,
                activeColor: Colors.red,
              ),
              // Row(
              //   children: [
              //     Checkbox(
              //       value:_checkboxValue,
              //       activeColor: Colors.green,
              //       onChanged: (value) {
              //         this.setState(() { 
              //           _checkboxValue = value;
              //         });
              //       }
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
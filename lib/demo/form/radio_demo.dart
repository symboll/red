import 'package:flutter/material.dart';


class RadioDemo extends StatefulWidget {
  RadioDemo({Key key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroup = 0;
  void _radioValueChanged (int value)  {
    setState(() {
      _radioGroup = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('RadioGroupValue: ${_radioGroup}'),
            SizedBox(height: 16.0),
            RadioListTile(
              value: 0,
              groupValue: _radioGroup,
              onChanged: _radioValueChanged,
              title:Text('Option A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroup == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroup,
              onChanged: _radioValueChanged,
              title:Text('Option B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_2),
              selected: _radioGroup == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Radio(
                //   value: 0,
                //   groupValue: _radioGroup,
                //   onChanged:_radioValueChanged,
                // ),
                // Radio(
                //   value: 1,
                //   groupValue: _radioGroup,
                //   onChanged:_radioValueChanged,
                // ),
              ],
            )
          ],
        ),
      )
    );
  }
}
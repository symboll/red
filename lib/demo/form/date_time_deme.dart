import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  DateTimeDemo({Key key}) : super(key: key);

  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectDate () async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
    );

    if(date == null) return;
    
    setState(() {
      _selectedDate = date;
    });
  }

  Future<void> _selectTime () async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: _selectedTime
    );

    if(time == null) return;
    
    setState(() {
      _selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap:_selectDate,
              child: Row(
                children: <Widget>[
                  Text(DateFormat.yMd().format(_selectedDate)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            InkWell(
              onTap:_selectTime,
              child: Row(
                children: <Widget>[
                  Text(_selectedTime.format(context)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selecteDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate () async {
    final DateTime date = await showDatePicker(
      context: context, 
      initialDate: selecteDate, 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100)
    );
    if(date != null) { 
      this.setState(() {
        selecteDate = date;
      });
    }
    return;
  }

  Future<void> _selectTime () async {
    final TimeOfDay time = await showTimePicker(
      context: context, 
      initialTime: selectedTime
    );

    if(time != null) {
      this.setState(() {
        selectedTime = time;
      });
    }
    return;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime'),
        elevation: 0,
      ),
      body: Theme(
        // data: Theme.of(context).copyWith(
        //   primaryColor: Colors.grey[600]
        // ),
        data: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.green
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap:  _selectDate,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(DateFormat.yMd().format(selecteDate)),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              InkWell(
                onTap:  _selectTime,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(selectedTime.format(context)),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
} 
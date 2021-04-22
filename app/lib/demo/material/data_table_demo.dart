import 'package:flutter/material.dart';

 
class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
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
            
            ],
          ),
        )
      ),
    );
  }
} 
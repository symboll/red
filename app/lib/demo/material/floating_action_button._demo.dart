
import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatefulWidget {
  @override
  _FloatingActionButtonDemoState createState() => _FloatingActionButtonDemoState();
}

class _FloatingActionButtonDemoState extends State<FloatingActionButtonDemo> {
  int value = 0;
  Widget _floatingActionButton (context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      // elevation: 0.0,
      // backgroundColor: Colors.black,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0)
      // ),
      onPressed: () {
        this.setState(() {
          value++;
        });
        // Navigator.of(context).pop();
      },
    );
  }

  Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () { }, 
    icon: Icon(Icons.add),
    label: Text('add')
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text('$value'),
      ),
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: _floatingActionButtonExtended,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 88.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
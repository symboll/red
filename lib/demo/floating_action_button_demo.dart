import 'package:flutter/material.dart';

class FloatingActionButtonDemo  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 12.0,
      backgroundColor: Color.fromRGBO(3, 45, 255, 1.0),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
    );

    final Widget _floatingActionButtonExtend = FloatingActionButton.extended(
      onPressed: () {},
      label: Text('T')
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      // floatingActionButton: _floatingActionButton
      floatingActionButton: _floatingActionButtonExtend,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),

    );
  }
}


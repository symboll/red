import 'package:flutter/material.dart';


class StateManagementDemo extends StatefulWidget{
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  
  int _count = 0;

  void _increaseCount () {
    setState(() {
      _count+=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      // body: Center(
      //   child: Chip(label: Text('${_count}')),
      // ),
      body: Counter(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount
      ),
    );
  }
}


class Counter extends StatelessWidget {
  final int count;
  final VoidCallback callback;
  Counter(this.count, this.callback);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('${count}'),
        onPressed: callback,
      ),
    );
  }
}



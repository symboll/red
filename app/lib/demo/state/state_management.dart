
import 'package:flutter/material.dart';

class StateManageMentDemo extends StatefulWidget {
  @override
  _StateManageMentDemoState createState() => _StateManageMentDemoState();
}

class _StateManageMentDemoState extends State<StateManageMentDemo> {
  int _count = 0;
  void _handlePressed () {
    this.setState(() {
      _count += 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManageMentDemo'),
      ),
      body: Counter(_count, _handlePressed),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _handlePressed,
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback _callback;

  Counter(this.count, this._callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: _callback,
      ),
    );
  }
}
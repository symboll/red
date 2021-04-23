
import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback callback;
  final Widget child;

  CounterProvider({
    this.count,
    this.callback,
    this.child
  }): super(child: child);

  static CounterProvider of(BuildContext context) { 
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}


class InheritedDemo extends StatefulWidget {
  @override
  _InheritedDemoState createState() => _InheritedDemoState();
}

class _InheritedDemoState extends State<InheritedDemo> {
  int _count = 0;
  void _handlePressed () {
    this.setState(() {
      _count += 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      callback: _handlePressed,

      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedDemo'),
        ),
        body: CounterWrap(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _handlePressed,
        ),
      )
    );
  }
}

class CounterWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int _count = CounterProvider.of(context).count;
    final VoidCallback _callback = CounterProvider.of(context).callback;

    return ActionChip(
      label: Text('count: $_count'),
      onPressed: _callback,
    );
  }
}
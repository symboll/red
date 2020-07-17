import 'package:flutter/material.dart';


class InheritedDemo extends StatefulWidget{
  @override
  _InheritedDemoState createState() => _InheritedDemoState();
}

class _InheritedDemoState extends State<InheritedDemo> {
  
  int _count = 0;

  void _increaseCount () {
    setState(() {
      _count+=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedDemo'),
          elevation: 0.0,
        ),
        // body: Center(
        //   child: Chip(label: Text('${_count}')),
        // ),
        body: Counter(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount
        ),
      ),
    );
  }
}

class CounterWraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('${count}'),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue[200],
        child: Text('T'),
        
      ),
      onPressed: increaseCount,
    );
  }
}




class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback increaseCount;
  final Widget child;


  CounterProvider({
    this.count,
    this.increaseCount,
    this.child
  }): super(child: child);

  static CounterProvider of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType();
    // context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}
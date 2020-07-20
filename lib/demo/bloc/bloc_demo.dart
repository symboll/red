import 'dart:async';
import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              _counterBloc.counter.add(1);
            }
          );
        }
      )
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.counter.add(1);
      }
    );
  }
}


class CounterProvider extends InheritedWidget {
  
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({
    Key key, 
    this.child,
    this.bloc
  }) : super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  CounterBloc () {
    _counterActionController.stream.listen(onData);
  }

  
  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void onData (int data) {
    _count += data;
    _counterController.add(_count);
  }

}


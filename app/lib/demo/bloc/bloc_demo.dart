import 'package:flutter/material.dart';
import 'dart:async';

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return  CounterProvider(
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
        builder: (BuildContext context, snapshot) {
          return  ActionChip(
            label: Text('${snapshot.data}'), 
            // onPressed: () => _counterBloc.counter.add(1),
            onPressed: () {
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      // onPressed: () => _counterBloc.counter.add(2),
      onPressed: () {
        _counterBloc.counter.add(2);
      }
    );
  }
}

class CounterBloc {
  int _count = 0;
  final  _streamController = StreamController<int>();
  StreamSink<int> get counter => _streamController.sink;

  final  _countContrller = StreamController<int>();
  Stream<int> get count => _countContrller.stream;

  CounterBloc() {
    _streamController.stream.listen(onData);
  }

  void dispose () {
    _streamController.close();
    _countContrller.close();
  }

  void onData (int value) {
    print('value: $value');
    _count += value;
    _countContrller.add(_count); 
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child, this.bloc}) : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}
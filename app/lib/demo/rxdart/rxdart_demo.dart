
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxdartDemo extends StatefulWidget {
  @override
  _RxdartDemoState createState() => _RxdartDemoState();
}

class _RxdartDemoState extends State<RxdartDemo> {
  PublishSubject<String> _publishSubject;

  @override
  void dispose() {
    _publishSubject.close();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _publishSubject = PublishSubject<String>();
    _publishSubject
      // .map((item) => 'item: $item')
      // .where((item) => item.length > 9)
      .debounce((_) => TimerStream(true, Duration(microseconds: 800)))
      .listen((value)=> print(value));
    
    // Observable<String> _observable = 
    //   Observable(Stream.fromIterable(['hello', 'natvie code']));
    // Observable 已经被废弃
    
    /**
     * Stream
     */
    // Stream<String> _observable =
    //   // Stream.fromFuture(Future.value('hello~')); 
    //   // Stream.fromIterable(['hello', 'native code']);
    //   Stream.periodic(Duration(seconds: 3), (x) => x.toString());
    // _observable.listen(print);
    
    /**
     * PublishSubject
     */
    // PublishSubject<String> _subject = PublishSubject<String>();
    // _subject.listen((value) => print('value1: $value'));
    // _subject.add('hello');
    // _subject.listen((value) => print('value2: ${value.toUpperCase()}'));
    // _subject.add('symboll');
    // _subject.close();

    /**
     * BehaviorSubject
     */
    // BehaviorSubject<String> _behaviorSubject = BehaviorSubject<String>();
    // _behaviorSubject.listen((value) => print('value1: $value'));
    // _behaviorSubject.add('hello');
    // _behaviorSubject.listen((value) => print('value2: ${value.toUpperCase()}'));
    // _behaviorSubject.add('symboll');
    // _behaviorSubject.close();
    
    
    /**
     * ReplaySubject
     */
    // ReplaySubject<String> _replaySubject = ReplaySubject<String>(maxSize: 2);
    // _replaySubject.add('hello');
    // _replaySubject.add('symboll');
    // _replaySubject.add('good ');
    // _replaySubject.listen((value) => print('value1: $value'));
    // _replaySubject.listen((value) => print('value2: ${value.toUpperCase()}'));
    // _replaySubject.close();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxdartDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.red
          ),
          child: TextField(
            onChanged: (value) {
              _publishSubject.add('input: $value');
            },
            onSubmitted: (value) {
              _publishSubject.add('submit: $value');
            },
            decoration: InputDecoration(
              labelText: 'Title',
              filled: true
            ),
          ),
        )
      ),
    );
  }
}
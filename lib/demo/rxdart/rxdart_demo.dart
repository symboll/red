import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

// rx = Reactive Extensions

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome()
    );
  }
}


class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  // PublishSubject<String> _subject;
  // BehaviorSubject<String> _subject;        // 把最后一次添加的数据， 作为第一个项目，交给新来的监听器。
  // ReplaySubject<String>_subject;              // 可以把添加到control /subject上的数据，全部交给监听器。
  PublishSubject<String> _textFieldSubject;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Observable<String> _observable = 
    //   Observable(Stream.fromIterable(['hello', 'natvie code']));
    //   Observable.fromFuture(Futrue.value('hello ~'))
    //   Observable.fromIterable(['hello ~','natvie code']);
    //   Observable.just('hello ~');
    //   Observable.priodic(Duration(seconds: 3), (x) => x.toString()); 
    // _observable.listen(print)

/**
 * Subject
 * 
 */
    // _subject = PublishSubject<String>();
    // _subject = BehaviorSubject<String>();
    // _subject = ReplaySubject<String>(maxSize: 2);

    // _subject.add('hello');
    // _subject.add('navtive~~code');
    // _subject.listen((value) => print('listen 1: ${value}'));
    // _subject.listen((value) => print('listen 2: ${value.toUpperCase()}'));

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
      // .map((item) => 'item: ${item}')
      // .where((item) => item.length > 10)
      .debounce((event) => TimerStream(true, Duration(milliseconds: 800)))
      // .debounceTime(Duration(milliseconds: 800))
      .listen((value) {print(value);});
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _subject.close();
    _textFieldSubject.close();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: ${value}');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: ${value}');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}
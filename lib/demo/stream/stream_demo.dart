import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome()
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  // Stream<String> _streamDemo;
  StreamController<String> _streamController;
  StreamSink _streamSink;
  // String _data = '...';

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Create a stream');

    // _streamDemo = Stream.fromFuture(fetchData());
    _streamController = StreamController<String>();
    _streamSink = _streamController.sink;

    print('Start listening on a stream');
    // _streamSubscription =
    //   // _streamDemo.listen(onData,onError: onError, onDone: onDone);
    //   _streamController.stream.listen(onData,onError: onError, onDone: onDone);

    print('Initialize completed');
  }
  void onData (String data) {
    // setState(() {
    //   _data = data;
    // });
    print('${data}');
  }
  void onError (error) { print('Error: ${error}');}
  void onDone () {print('Done');}

  void _pauseStream () {
    print('Pause subscription');

    _streamSubscription.pause();
  }
  void _resumeStream () {
    print('Resume subscription');

    _streamSubscription.resume();
  }
  void _cancelStream () {
    print('Cancel subscription');

    _streamSubscription.cancel();
  }
  void _addDataToStream () async {
    print('_add Data to Stream');
    String data = await fetchData();
    // _streamController.add(data);
    _streamSink.add(data);
  }

  Future<String> fetchData () async {
    await Future.delayed(Duration(seconds: 3));
    return 'hello~';
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(_data),
          StreamBuilder(
            stream: _streamController.stream,
            initialData: '...',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: _addDataToStream,
              ),
              FlatButton(
                child: Text('Pause'),
                onPressed: _pauseStream,
              ),
              FlatButton(
                child: Text('Resume'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: _cancelStream,
              )
            ],
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:async';

class StreamTestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo'),
          elevation: 0.0,
        ),
        body: StreamTestHome());
  }
}

class StreamTestHome extends StatefulWidget {
  StreamTestHome({Key key}) : super(key: key);

  @override
  _StreamTestHomeState createState() => _StreamTestHomeState();
}

class _StreamTestHomeState extends State<StreamTestHome> {

  StreamController<DateTime> _streamController;
  StreamSink _streamSink;

  void _addDataToStream () async {
    print('_add Data to Stream');
    DateTime data = await fetchData();
    // _streamController.add(data);
    _streamSink.add(data);
  }

  Future<DateTime> fetchData () async {
    await Future.delayed(Duration(seconds: 3));
    return  DateTime.now();
  }

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
    _streamController = StreamController<DateTime>();
    _streamSink = _streamController.sink;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _streamController.stream,
              initialData: '...',
              builder: (context, snopshot) {
                return Text('${snopshot.data}');
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

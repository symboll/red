
import 'package:flutter/material.dart';
import 'dart:async';

class StreamHomeDemo extends StatefulWidget {
  @override
  _StreamHomeDemoState createState() => _StreamHomeDemoState();
}

class _StreamHomeDemoState extends State<StreamHomeDemo> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  StreamSink _streamSink;
  String _data = '...';

  ButtonStyle _style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue[300]),
    overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
      fontSize: 16.0,
      // fontStyle: FontStyle.italic
    ))
  );

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Create a Stream.');
    // Stream<String> _stream = Stream.fromFuture(fetchData());
    _streamController = StreamController<String>();
    _streamSink = _streamController.sink;

    print('Start listening on a Stream');
    // _streamSubscription = 
    //   _streamController.stream.listen(
    //     onData,
    //     onError: onError,
    //     onDone: onDone
    //   );

    print('Initialize completed.');
  }

  void onData(String data) {
    print('event: $data');
    this.setState(() {
      _data = data;
    });
  }

  void onError (error) {
    print('error: $error');
  }
  void onDone () {
    print('done!');
  }

  void _pauseStream () {
    print('Pause StreamSubscription.');
    _streamSubscription.pause();
  }
  void _resumeStream () {
    print('Resume StreamSubscription.');
    _streamSubscription.resume();
  }
  void _cancelStream () {
    print('Cancel StreamSubscription.');
    _streamSubscription.cancel();
  } 

  void _addDataToStream() async{
    print('Add Data to Stream.');
    String data = await fetchData(); 

    // _streamController.add(data);
    _streamSink.add(data);
  }

  Future<String> fetchData () async {
    await Future.delayed(Duration(seconds: 5));
    return 'hello'; 
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('StreamHome'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              // child: Text('$_data'),
              child: StreamBuilder(
                stream: _streamController.stream,
                initialData: '...',
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text('${snapshot.data}');
                },
              ),
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: _pauseStream, 
                  icon: Icon(Icons.pause), 
                  label: Text('Pause'),
                  style: _style,
                ),
                OutlinedButton.icon(
                  onPressed: _resumeStream, 
                  icon: Icon(Icons.play_arrow), 
                  label: Text('Resume'),
                  style: _style,
                ),
                OutlinedButton.icon(
                  onPressed: _cancelStream, 
                  icon: Icon(Icons.cancel), 
                  label: Text('Cancel'),
                  style: _style,
                )
              ],
            ),
            Stack(
              children: [
                OutlinedButton.icon(
                  onPressed: _addDataToStream, 
                  icon: Icon(Icons.add_circle), 
                  label: Text('Add'),
                  style: _style,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
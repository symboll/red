import 'package:flutter/material.dart';
import '../list_demo.dart';

import 'stream_home_demo.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'), 
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'StreamHome',
            page: StreamHomeDemo(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:async';


final String basicUrl =  'http://localhost:3000';

class CurdDemo extends StatefulWidget {
  @override
  _CurdDemoState createState() => _CurdDemoState();
}

class _CurdDemoState extends State<CurdDemo> {
 

  Future<List<Post>> _getPosts () async {
    final response = await Http.get(Uri.parse('$basicUrl/posts'));
    if(response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      List<Post> posts = responseBody.map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    }else {
      throw Exception('Failed to fetch posts.');
    }
  }

  void _createPost() async {
    final response = await Http.post(Uri.parse('$basicUrl/posts'), body: {
      'title': "abc",
      'content': "德莱文"
    });

    if(response.statusCode == 200) {
      print('$response.body');
      _getPosts();
    }else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CURD'),
      ),
      body: FutureBuilder(
        future: _getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('loading...'),
            );
          }
          return  ListView(
            children: snapshot.data.map<Widget>((item) => ListTile(
              title: Text(item.title),
              subtitle: Text(item.content),
            )).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _createPost
      ),
    );
  }
}



class Post {
  // final String _id;
  final String title;
  final String content;

  Post(
    // this._id,
    this.title,
    this.content
  );

  Post.fromJson(Map json)
    :title = json['title'],
    content = json['content'];

}
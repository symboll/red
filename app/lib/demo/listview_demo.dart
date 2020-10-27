import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
    Widget _listItemBuilder (BuildContext context, int index ) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0,),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.headline6
          ),
          SizedBox(height: 8.0,),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.bodyText2
          ),
          SizedBox(height: 16.0,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
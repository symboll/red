import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarDemo(),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              // sliver: SliverGridDemo(),
              sliver: SliverListDemo(),
            ),
          )        
        ],
      ),
    );
  }
}

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      // title: Text('Flutter App'),
      // pinned: true,       // 固定标题
      // floating: true,        // 向下拉。马上显示标题栏
      expandedHeight: 178.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Flutter APP'.toUpperCase(),
          style: TextStyle(
            fontSize: 15.0,
            letterSpacing: 3.0,
            fontWeight: FontWeight.w400
          ),
        ),
        background: Image.network(
          posts[2].imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  Widget _builder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _builder,
        childCount: posts.length
      )
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  Widget _builder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        _builder,
        childCount: posts.length
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.5,     // 网格长宽比例
      )
    );
  }
}
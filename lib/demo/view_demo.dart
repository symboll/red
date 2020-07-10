import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return PageViewBuilderDemo();
    // return GridViewCountDemo();
    // return GridVIewExyentDemo();
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget{
  Widget _itemBuilder (BuildContext context, int index) {
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
    return GridView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0
      ),
      itemBuilder: _itemBuilder,
    );
  }
}


class GridVIewExyentDemo extends StatelessWidget {
  List<Widget> _buildTitles (int length) {
    return List.generate(length, (int index) =>  Container(
      color: Colors.grey[300],
      alignment: Alignment(0.0, 0.0),
      child: Text(
        "Item $index",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold
        ),
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      // scrollDirection: Axis.horizontal, 
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: _buildTitles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget{
  List<Widget> _buildTitles (int length) {
    return List.generate(length, (int index) =>  Container(
      color: Colors.grey[300],
      alignment: Alignment(0.0, 0.0),
      child: Text(
        "Item $index",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold
        ),
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
      // scrollDirection: Axis.horizontal, 
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: _buildTitles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget{
    Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover
          )
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
              Text(posts[index].author),
              Text(posts[index].description)
            ],
          )
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      // pageSnapping: false,
      // reverse: true,
      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('page: $currentPage'),
      controller: PageController(
        initialPage: 2,
        // keepPage: false
        // viewportFraction: 0.95
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "ONE",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        ),
        Container(
          color: Colors.brown[600],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "TWO",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        ),
        Container(
          color: Colors.brown[300],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "THREE",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}



class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder (BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0
      ), 
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles (int length ) {
    return List.generate(length, (index) => 
      Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0,0.0),
        child: Text(
          'Item_$index',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 18.0 
          )
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _buildTiles(100)
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles (int length ) {
    return List.generate(length, (index) => 
      Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0,0.0),
        child: Text(
          'Item_$index',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 18.0 
          )
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      // scrollDirection: Axis.vertical,
      children: _buildTiles(100)
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _itemBuilder (BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.w900
                ),
              ),
              Text(posts[index].author)
            ],
          )
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false,
      // scrollDirection:  Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('currentPage: $currentPage'),
      controller: PageController(
        initialPage: 2,
        // keepPage: false
      ),
      children: [
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0,0.0),
          child: Text('First',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0
            )
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0,0.0),
          child: Text('Seconde',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0
            )
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0,0.0),
          child: Text('Third',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0
            )
          ),
        )
      ],
    );
  }
}
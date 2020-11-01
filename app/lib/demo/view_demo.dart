import 'package:flutter/material.dart';
import '../model/post.dart';


class ViewDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
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
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0
      ),
      itemCount: posts.length,
      itemBuilder: _itemBuilder
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles (int count) {
    return List.generate(count, 
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0,0),
        child: Text(
          'Item $index',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey
          )
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: _buildTiles(100)
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles (int count) {
    return List.generate(count, 
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0,0),
        child: Text(
          'Item $index',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey
          )
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // scrollDirection: Axis.horizontal,
      children: _buildTiles(100)
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _itemBuilder ( BuildContext context, int index) {
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
          right: 8.0,
          child: Column(
            children: [
              Text(posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
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
      itemBuilder: _itemBuilder
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false,
      // reverse: true,
      scrollDirection: Axis.vertical,
      onPageChanged: (int currentPageIndex) => {
        print(currentPageIndex)
      },
      controller: PageController(
        // initialPage: 1,
        // keepPage: false,
        // viewportFraction: 1.0
      ),
      children: [
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0,0),
          child: Text(
            "FIRST",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white
            ),
          ),
        ),
        Container(
          color: Colors.brown[600],
          alignment: Alignment(0,0),
          child: Text(
            "SECOND",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white
            ),
          ),
        ),
        Container(
          color: Colors.brown[300],
          alignment: Alignment(0,0),
          child: Text(
            "THIRD",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}

import '../model/post.dart';
import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarDemo(),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            )
          )
        ],
      ),
    );
  }
}

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // title: Text('Flutter'),
      // pinned: true,
      floating: true,
      expandedHeight: 178.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Flutter'.toUpperCase(),
          style: TextStyle(
            fontSize: 15.0,
            letterSpacing: 3.0,
            fontWeight: FontWeight.w400
          )
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
  Widget _buildDelegate (BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 14.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Stack(
          children: [
            // AspectRatio(
            //   aspectRatio: 16.0/9.0,
            //   child: Image.network(posts[index].imageUrl, fit: BoxFit.cover,),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(posts[index].imageUrl, fit: BoxFit.cover,), 
            ),
            Positioned(
              top: 32.0,
              left: 32.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    posts[index].title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    posts[index].author,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _buildDelegate,
        childCount: posts.length
      )
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  Widget _builderDelegate (BuildContext context, int index ) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        _builderDelegate,
        childCount: posts.length
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.2
      )
    );
  }
}
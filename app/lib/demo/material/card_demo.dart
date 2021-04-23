import 'package:flutter/material.dart';
import '../../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children:posts.map((item) => Card(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16/9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.network(item.imageUrl, fit: BoxFit.cover,),
                  )
                ),
                // Text('${item.author}')
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imageUrl,)
                  ),
                  title: Text('${item.title}'),
                  subtitle: Text('${item.author}'),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {}, 
                      child: Text('Like'.toUpperCase()),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
                        overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, 
                      child: Text('Read'.toUpperCase()),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
                        overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
                      ),
                    )
                  ],
                )
              ],
            ),
          )).toList()
        ),
      )
    );
  }
}
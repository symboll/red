
import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDetailDemo extends StatelessWidget {
  final Post post;

  PostDetailDemo({
    @required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${post.title}',
        ), 
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16.0/9.0,
              child: Image.network(post.imageUrl, fit: BoxFit.cover),
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${post.title}', style: Theme.of(context).textTheme.headline5),
                  Text('${post.author}', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 32.0,),
                  Text('${post.description}', style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
} 

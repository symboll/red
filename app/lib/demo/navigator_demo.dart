import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: null)
                // );
                Navigator.pushNamed(context, '/home');
              }, 
              child: Text(
                'Home'
              )
            ),
            FlatButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Page(title: 'About')
                //   )
                // );
                Navigator.pushNamed(context, '/about');
              }, 
              child: Text(
                'About'
              )
            )
          ],
        ),
      ), 
    );
  }
}

class Page extends StatelessWidget {

  final String title;
  Page({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                }, 
                child: Text('Home')
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
                child: Text( 'About' )
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
                child: Text('Form'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mdc');
                },
                child: Text('mdc')
              )
            ],
          )
        ],
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
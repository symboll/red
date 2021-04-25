import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {

  final ButtonStyle _style = ButtonStyle(
    // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
      fontSize: 16.0,
      // fontStyle: FontStyle.italic
    ))
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                }, 
                style: _style,
                child: Text('Home')
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => Page(title: 'About')
                  //   )
                  // );
                  Navigator.pushNamed(context, '/about');
                }, 
                style: _style,
                child: Text( 'About' )
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
                style: _style,
                child: Text('Form')
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mdc');
                },
                style: _style,
                child: Text('mdc')
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/state');
                },
                style: _style,
                child: Text('state')
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/stream');
                },
                style: _style,
                child: Text('Stream')
              ),
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
import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('Home')
            ),
            FlatButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Pages(title: 'About')
                //   )
                // );
                Navigator.pushNamed(context, '/about');
              },
              child: Text('About')
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: Text('Form')
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mdc');
              },
              child: Text('Material')
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stateManagement');
              },
              child: Text('StateManagement')
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stream');
              },
              child: Text('StreamDemo')
            ),
          ],
        ),
      )
    );
  }
}


class Pages extends StatelessWidget {
  final String title;
  
  Pages({
    this.title
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    );
  }
}
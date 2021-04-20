import 'package:flutter/material.dart';


class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('value: $_currentMenuItem')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton(
                  onSelected: (value) => {
                    this.setState(() {
                      _currentMenuItem = value;
                    })
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: "Home",
                      child: Text('Home'),
                    ),
                    PopupMenuItem(
                      value: "About",
                      child: Text('About'),
                    )
                  ]
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
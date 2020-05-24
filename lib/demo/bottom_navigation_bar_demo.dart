import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  void _inTopHandler (int index) {
    this.setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap:  _inTopHandler,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('History')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('history')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          title: Text('menu')
        ),
      ],
    );
  }
}

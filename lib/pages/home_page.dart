

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.view_quilt),
        title: Text('分类')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        title: Text('发现')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text('购物车')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('我的')
      ),
    ];
    int _currentIndex = 0;
    final List<Widget>  _viewItems = [
      Text('首页'),
      Text('分类'),
      Text('发现'),
      Text('购物车'),
      Text('我的'),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          this.setState(() {
            _currentIndex = index;
          });
        },
      ),
      body:Container(
        
      )
    );
  }
}
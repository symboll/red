

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'classification_page.dart';
import 'discover_page.dart';
import 'my_page.dart';
import 'shopping_cart_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  void _handleTap (int index) {
    this.setState(() {
      _currentIndex = index;
    });
  }
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

  final List<Widget>  _viewItems = [
    HomePage(),
    ClassificationPage(),
    DiscoverPage(),
    ShoppingCartPage(),
    MyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: _handleTap,
      ),
      body:_viewItems[_currentIndex]
    );
  }
}
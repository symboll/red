import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
void main ()=> runApp(App());


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70
      ),
    );
  }
} 


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: ()=> debugPrint('Navigration Button on Pressed'),
          // ),
          title: Text('Flutter App'),
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: ()=> debugPrint('search Button on Pressed'),
          ),
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Icon(Icons.local_florist, size: 128.0,color: Colors.black26),
            ListViewDemo(),
            Icon(Icons.change_history),
            Icon(Icons.directions_bike)
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('李康华', style: TextStyle(fontWeight: FontWeight.bold),),
                accountEmail: Text('lkh19890913@163.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/40781464?s=460&u=d8f92f45af356ac4b1b3698f249d65dabf667cd1&v=4')
                ),
                decoration: BoxDecoration(       // 背景色
                  color: Colors.yellow[400],
                  image: DecorationImage(        // 背景图
                    image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.yellow[400].withOpacity(0.6),
                      BlendMode.hardLight)
                  )
                ),
              ),
              // DrawerHeader(
              //   child: Text('header'.toUpperCase()),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100],
              //   ),
              // ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right),
                trailing: Icon(Icons.message, color: Colors.black12, size: 22.0), // 标签右边
                // leading: Icon(Icons.dashboard, color: Colors.pink),            // 标签左边
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Favorite', textAlign: TextAlign.right),
                trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0), // 标签右边
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Settings', textAlign: TextAlign.right),
                trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0), // 标签右边
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarDemo()
      )
    );
  }
}

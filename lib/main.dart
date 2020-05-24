import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple ,
        highlightColor: Color.fromRGBO(255,255,255,0.5),
        splashColor: Colors.white70
      )
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
          //   onPressed: ()=> debugPrint('Navigration'),
          // ),
          title: Text('李康华'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: ()=> debugPrint('search'),
            ),
          ],
          elevation: 0.0,  
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            // indicatorColor: Colors.black54,
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.select_all))
            ]
          )
        ),
        body: TabBarView(
          children: <Widget>[
            // Icon(
            //   Icons.local_florist,
            //   size: 128.0,
            //   color: Colors.orange,
            // ),
            ListViewDemo(),
            Icon(
              Icons.change_history,
              size: 128.0,
              color: Colors.purple,
            ),
            Icon(
              Icons.select_all,
              size: 128.0,
              color: Colors.yellow,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   child: Text('header'.toUpperCase()),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100]
              //   ),
              // ),
              UserAccountsDrawerHeader(
                accountName: Text('李康华', style: TextStyle(fontWeight: FontWeight.bold )),
                accountEmail: Text('272011007@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:  NetworkImage('https://avatars1.githubusercontent.com/u/40781464?s=460&u=d8f92f45af356ac4b1b3698f249d65dabf667cd1&v=4'),
                ),
                decoration: BoxDecoration(
                  // color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.green.withOpacity(0.4),
                      BlendMode.hardLight
                    )
                  )
                ),
              ),
              ListTile(
                title: Text('message',textAlign: TextAlign.right),
                trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
                // leading: Icon(Icons.memory, color: Colors.black26, size: 22.0),
                onTap: ()=> Navigator.pop(context),
              ),
              ListTile(
                title: Text('favorite',textAlign: TextAlign.right),
                trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                onTap: ()=> Navigator.pop(context),
              ),
              ListTile(
                title: Text('settings',textAlign: TextAlign.right),
                trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
                onTap: ()=> Navigator.pop(context),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarDemo()
      )
    );
  }
}

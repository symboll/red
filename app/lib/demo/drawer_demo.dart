import 'package:flutter/material.dart';


class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('李康华',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('272011007@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://user-gold-cdn.xitu.io/2019/6/14/16b5625ed9a00576?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1"),
            ),
            decoration: BoxDecoration(
              color:Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage("https://resources.ninghao.net/images/childhood-in-a-picture.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.yellow[400].withOpacity(0.6), 
                  BlendMode.hardLight
                )
              ),
            ),
          ),
          ListTile(
            title: Text('Message', textAlign:TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black54, size: 22.0,),
            // leading: Icon(Icons.directions_subway),
            onTap: () => Navigator.pop(context)
          ),
          ListTile(
            title: Text('favorite', textAlign:TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black54, size: 22.0,),
            onTap: () => Navigator.pop(context)
          ),
          ListTile(
            title: Text('settings', textAlign:TextAlign.right,),
            trailing: Icon(Icons.settings, color: Colors.black54, size: 22.0,),
            onTap: () => Navigator.pop(context)
          )
        ],
      ),
    );
  }
} 

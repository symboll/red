import 'package:flutter/material.dart';
import '../model/post.dart';

const  url = 'https://user-gold-cdn.xitu.io/2019/6/14/16b5625ed9a00576?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1';
class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100]
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text(
                'likanghua',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
            accountEmail: Text('lkh19890913@163.com',),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(url),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage(posts[1].imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(       // 颜色滤镜  【 颜色， 混合模式 】
                  Colors.yellow[400].withOpacity(0.6),
                  BlendMode.hardLight
                )
              )
            )
          ),
          ListTile(
            // leading:Icon(Icons.message, color: Colors.black12, size: 22.0) ,  // 文字左边
            title: Text('Message', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),  // 文字右边
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),  // 文字右边
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),  // 文字右边
          )
        ],
      ),
    );
  }
}


// Container(
// color: Colors.white,
// padding: EdgeInsets.all(8.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('this is aaa')
//
// ],
// ),
// );
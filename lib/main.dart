import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main () => runApp(App());


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:  {
        '/':  (context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.amberAccent[700]
      ),
    );
  }
} 




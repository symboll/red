import 'package:flutter/material.dart';

import 'pages/index_page.dart';

void main () => runApp(App());


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:  {
        '/':  (context) => IndexPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.red[600]
      ),
    );
  }
} 




import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {

  final ButtonStyle _style = ButtonStyle(
    // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
      fontSize: 16.0,
      // fontStyle: FontStyle.italic
    ))
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Theme(
              data: ThemeData(
                textButtonTheme: TextButtonThemeData(
                  style: _style
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    }, 
                    child: Text('Home')
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => Page(title: 'About')
                      //   )
                      // );
                      Navigator.pushNamed(context, '/about');
                    }, 
                    child: Text( 'About' )
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    child: Text('Form')
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/mdc');
                    },
                    child: Text('mdc')
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/state');
                    },
                    child: Text('state')
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/stream');
                    },
                    child: Text('Stream')
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/rxdart');
                    },
                    child: Text('Rxdart')
                  ),              
                ],
              )
            ),          
          ),
        ) 
      ),
    );
  }
}

class Page extends StatelessWidget {

  final String title;
  Page({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
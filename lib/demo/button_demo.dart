import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, 
        ),
        FlatButton.icon(
          onPressed: () {},
          label: Text('Button'),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, 
        )
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              shape: StadiumBorder()
            )
          ),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            elevation: 12.0,
            // color: Theme.of(context).primaryColor,
            // textColor: Theme.of(context).accentColor, 
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          onPressed: () {},
          label: Text('Button'),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor, 
        )
      ],
    );
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            // buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              // textTheme: ButtonTextTheme.primary,
              shape: StadiumBorder()
            )
          ),
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            borderSide: BorderSide(
              color: Colors.black
            ),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).accentColor, 
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          onPressed: () {},
          label: Text('Button'),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, 
        )
      ],
    );
    final Widget fixedWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200.0,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black
            ),
            // color: Theme.of(context).primaryColor,
            textColor: Colors.black, 
            highlightColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget expandedDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black
            ),
            // color: Theme.of(context).primaryColor,
            textColor: Colors.black, 
            highlightColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black
            ),
            // color: Theme.of(context).primaryColor,
            textColor: Colors.black, 
            highlightColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 102.0)    
            )
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black
                ),
                // color: Theme.of(context).primaryColor,
                textColor: Colors.black, 
                highlightColor: Colors.grey,
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black
                ),
                // color: Theme.of(context).primaryColor,
                textColor: Colors.black, 
                highlightColor: Colors.grey,
              )
            ],
          )
        )
      ],
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButtonDemo,
            expandedDemo,
            buttonBarDemo
          ],
        ),
      )
    );
  }
}
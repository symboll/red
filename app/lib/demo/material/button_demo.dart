import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {

  Widget flatButtonBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text('FlatButton'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('FlatButton.icon'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
  }

  Widget raisedButtonBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
          // data: ThemeData()  // 完全覆盖
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Theme.of(context).accentColor,
              shape: StadiumBorder()
            )
          ),
          child:  RaisedButton(
            onPressed: () {},
            child: Text('RaisedButton'),
            splashColor: Colors.grey,
            // color: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.primary,
            // textColor: Colors.white,
            // elevation: 0.0,
          )
        ),
        SizedBox(width: 16.0,),
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('RaisedButton.icon'),
          splashColor: Colors.grey,
          textColor: Colors.white,
          color: Theme.of(context).accentColor,
          elevation: 8.0,
        )
      ],
    );
  }

  Widget outlineButtonBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton(
          onPressed: () {},
          child: Text('OutlineButton'),
          splashColor: Colors.grey[400],
          textColor: Theme.of(context).accentColor, 
          borderSide:  BorderSide(
            color: Colors.black
          ),
          highlightColor: Colors.grey,
        ),
        SizedBox(width: 16.0,),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('OutlineButton.icon'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
  }

  Widget fixedWidthButtonbuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200.0,
          child: OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            highlightColor: Colors.grey[500],
            textColor: Colors.black,
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid
            ),
          )
        )
      ],
    );
  }

  Widget expandedButtonbuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            highlightColor: Colors.grey[500],
            textColor: Colors.black,
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid
            ),
          )
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 3,
          child: OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            highlightColor: Colors.grey[500],
            textColor: Colors.black,
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.3,
              style: BorderStyle.solid
            ),
          )
        )
      ],
    );
  }

  Widget buttonBarBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.green,
          child: ButtonBar(
            children: [
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey[500],
                textColor: Colors.black,
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.3,
                  style: BorderStyle.solid
                ),
              ),
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey[500],
                textColor: Colors.black,
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.3,
                  style: BorderStyle.solid
                ),
              )
            ],
          ) 
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flatButtonBuilder(context),
            raisedButtonBuilder(context),
            outlineButtonBuilder(context),
            fixedWidthButtonbuilder(context),
            expandedButtonbuilder(context),
            buttonBarBuilder(context)
          ],
        ),
      ),
    );
  }
}
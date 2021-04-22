import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {

  // Widget flatButtonBuilder (context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       FlatButton(
  //         onPressed: () {},
  //         child: Text('FlatButton'),
  //         splashColor: Colors.grey,
  //         textColor: Theme.of(context).accentColor,
  //       ),
  //       FlatButton.icon(
  //         onPressed: () {},
  //         icon: Icon(Icons.add),
  //         label: Text('FlatButton.icon'),
  //         splashColor: Colors.grey,
  //         textColor: Theme.of(context).accentColor,
  //       )
  //     ],
  //   );
  // }

  Widget textButtonBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('TextButton'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              fontSize: 16.0,
              // fontStyle: FontStyle.italic
            ))
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('TextButton.icon'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              fontSize: 16.0,
              // fontStyle: FontStyle.italic
            ))
          ),
        )
      ],
    );
  }

  // Widget raisedButtonBuilder (context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Theme(
  //         // data: ThemeData()  // 完全覆盖
  //         data: Theme.of(context).copyWith(
  //           buttonTheme: ButtonThemeData(
  //             textTheme: ButtonTextTheme.primary,
  //             buttonColor: Theme.of(context).accentColor,
  //             shape: StadiumBorder()
  //           )
  //         ),
  //         child:  RaisedButton(
  //           onPressed: () {},
  //           child: Text('RaisedButton'),
  //           splashColor: Colors.grey,
  //           // color: Theme.of(context).accentColor,
  //           // textTheme: ButtonTextTheme.primary,
  //           // textColor: Colors.white,
  //           // elevation: 0.0,
  //         )
  //       ),
  //       SizedBox(width: 16.0,),
  //       RaisedButton.icon(
  //         onPressed: () {},
  //         icon: Icon(Icons.add),
  //         label: Text('RaisedButton.icon'),
  //         splashColor: Colors.grey,
  //         textColor: Colors.white,
  //         color: Theme.of(context).accentColor,
  //         elevation: 8.0,
  //       )
  //     ],
  //   );
  // }

  Widget elevatedButtonBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('ElevatedButton'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder())
          ),
        ),
        SizedBox(width: 16.0,),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('ElevatedButton.icon'),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation: MaterialStateProperty.all<double>(8.0)
          ),
        )
      ],
    );
  }

  // Widget outlineButtonBuilder (context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       OutlineButton(
  //         onPressed: () {},
  //         child: Text('OutlineButton'),
  //         splashColor: Colors.grey[400],
  //         textColor: Theme.of(context).accentColor, 
  //         borderSide:  BorderSide(
  //           color: Colors.black
  //         ),
  //         highlightColor: Colors.grey,
  //       ),
  //       SizedBox(width: 16.0,),
  //       OutlineButton.icon(
  //         onPressed: () {},
  //         icon: Icon(Icons.add),
  //         label: Text('OutlineButton.icon'),
  //         splashColor: Colors.grey,
  //         textColor: Theme.of(context).accentColor,
  //       )
  //     ],
  //   );
  // }

  Widget outlinedButtonBuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text('OutlinedButton'),
          
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
              color: Colors.black,
              width: 0.7
            ))
            // elevation: MaterialStateProperty.all<double>(8.0)
          ),
        ),
        SizedBox(width: 16.0,),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('OutlinedButton.icon'),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
              color: Colors.black,
              width: 0.7
            ))
            // elevation: MaterialStateProperty.all<double>(8.0)
          ),
        )
      ],
    );
  }

  final ButtonStyle _style = ButtonStyle(
    overlayColor: MaterialStateProperty.all<Color>(Colors.grey[400]),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    side: MaterialStateProperty.all<BorderSide>(BorderSide(
      color: Colors.black,
      width: 0.7
    ))
  );

  Widget fixedWidthButtonbuilder (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200.0,
          child: OutlinedButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            style: _style,
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
          child: OutlinedButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            style: _style,
          )
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 3,
          child: OutlinedButton(
            child: Text('OutlineButton'),
            onPressed: () {},
            style: _style,
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
              OutlinedButton(
                child: Text('OutlineButton'),
                onPressed: () {},
                style: _style,
              ),
              OutlinedButton(
                child: Text('OutlineButton'),
                onPressed: () {},
                style: _style,
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
            // flatButtonBuilder(context),
            textButtonBuilder(context),
            // raisedButtonBuilder(context),
            elevatedButtonBuilder(context),
            // outlineButtonBuilder(context),
            outlinedButtonBuilder(context),
            fixedWidthButtonbuilder(context),
            expandedButtonbuilder(context),
            buttonBarBuilder(context)
          ],
        ),
      ),
    );
  }
}
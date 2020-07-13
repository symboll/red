import 'package:flutter/material.dart';
import 'package:red/main.dart';

class MaterialComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Components'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo()
          )
        ],
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget FlatButtonDemo = Row(
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
    final Widget RaisedButtonDemo = Row(
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
            Row(
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
            )
          ],
        ),
      )
    );
  }
}

class FloatingActionButtonDemo  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 12.0,
      backgroundColor: Color.fromRGBO(3, 45, 255, 1.0),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
    );

    final Widget _floatingActionButtonExtend = FloatingActionButton.extended(
      onPressed: () {},
      label: Text('T')
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      // floatingActionButton: _floatingActionButton
      floatingActionButton: _floatingActionButtonExtend,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),

    );
  }
}


class ListItem extends StatelessWidget {

  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page)
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:async';

class ExpansionPanelItem{
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded
  });
}


class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}


class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {

  List<ExpansionPanelItem> _expansionPanelItem;

  @override
  void initState() {
    super.initState();

    _expansionPanelItem = <ExpansionPanelItem> [
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity ,
          child: Text('Content for Panel A'),
        ),
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity ,
          child: Text('Content for Panel B'),
        ),
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity ,
          child: Text('Content for Panel C'),
        ),
        isExpanded: false
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ExpansionPanelDemo'),
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ExpansionPanelList(
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      // _isExpanded = !isExpanded;
                      _expansionPanelItem[panelIndex].isExpanded = ! isExpanded;
                    });
                  },
                  children: _expansionPanelItem.map(
                    (ExpansionPanelItem item) => ExpansionPanel(
                      isExpanded: item.isExpanded,
                      body: item.body,
                      headerBuilder: (BuildContext context, bool isExpanded) => Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          '${item.headerText}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      )
                    )
                  ).toList()
                )
              ]
            )
         ),
      ),
    );
  }
}


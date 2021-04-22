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
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  
  List<ExpansionPanelItem> _expansionPanelList;

  void _handleExpansionChange (int panelIndex, bool isExpanded) {
    this.setState(() {
      _expansionPanelList[panelIndex].isExpanded = ! isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();

    _expansionPanelList = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanel'),
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[600]
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionPanelList(
                expansionCallback: _handleExpansionChange,
                // children: _expansionPanelItem.map((item) =>ExpansionPanel(
                //   isExpanded: item.isExpanded,
                //   headerBuilder: (BuildContext context, bool isExpanded) => Container(
                //     padding: EdgeInsets.all(16.0),
                //     child: Text('${item.headerText}', 
                //       style: Theme.of(context).textTheme.headline5,
                //     ),
                //   ),
                //   body: item.body
                // )),
                children: _expansionPanelList.map((item) =>  ExpansionPanel(
                    isExpanded: item.isExpanded,
                    headerBuilder: (BuildContext context, bool isExpanded) => Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text('${item.headerText}', 
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    body: item.body
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
} 
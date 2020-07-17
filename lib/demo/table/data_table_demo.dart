import 'package:flutter/material.dart';
import '../../model/post.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo({Key key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;
  List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  // label: Container(
                  //   width: 120.0,
                  //   child: Text('Title'),
                  // )
                  label: Text('Title'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortAscending = ascending;
                      _sortColumnIndex = columnIndex;
                    });

                    posts.sort((a, b){
                      if(!ascending) {
                        final c = a;
                        a = b;
                        b = c;
                      }
                      return a.title.length.compareTo(b.title.length);
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author')
                ),
                DataColumn(
                  label: Text('Image')
                )
              ],
              rows: posts.map(
                (post) =>  DataRow(
                  selected: _selected.contains(post.title),
                  onSelectChanged: (bool value) {
                    setState(() {
                      if(_selected.contains(post.title)) {
                        _selected.remove(post.title);
                      }else {
                        _selected.add(post.title);
                      }
                    });

                    print(_selected);
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl))
                  ]
                )
              ).toList()
            )
          ],
        )
      )
    );
  }
}
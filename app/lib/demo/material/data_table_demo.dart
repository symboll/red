import 'package:flutter/material.dart';
import '../../model/post.dart';
 
class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  bool _sortAscending = true;
  int _sortColumnIndex;
  List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
        elevation: 0,
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.blue
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  sortAscending: _sortAscending,
                  sortColumnIndex: _sortColumnIndex,
                  showCheckboxColumn: true,
                  columns: [
                    DataColumn( label: Container(
                        width: 100.0,
                        child: Text('Title'),
                      ),
                      onSort: (int index, bool ascending) {
                        this.setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;

                          posts.sort((a,b) {
                            if(ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });

                        });
                      }
                    ),
                    DataColumn( label: Text('Author')),
                    DataColumn( label: Text('Image')),
                  ], 
                  rows: posts.map((post) => DataRow(
                    selected: _selected.contains(post.title),
                    // color: MaterialStateProperty.resolveWith((states) {
                    //   if(_selected.contains(post.title)) {
                    //     return Colors.grey[100];
                    //   }
                    //   return Colors.white;
                    // }),
                    onSelectChanged: (bool value) {
                      this.setState(() {
                        if(_selected.contains(post.title)) {
                          _selected.remove(post.title);
                        }else {
                          _selected.add(post.title);
                        }
                      });
                    },
                    cells: [
                      DataCell(Text(post.title)),
                      DataCell(Text(post.author)),
                      DataCell(Image.network(post.imageUrl))
                    ]
                  )).toList()
                )
              ),
            ],
          ),
        )
      ),
    );
  }
} 

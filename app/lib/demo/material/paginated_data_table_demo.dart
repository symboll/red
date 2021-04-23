import 'package:flutter/material.dart';
import '../../model/post.dart';
 
class PostsDataSource extends DataTableSource{

  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override 
  int get selectedRowCount => _selectedCount;
 
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(_posts[index].title)),
        DataCell(Text(_posts[index].author)),
        DataCell(Image.network(_posts[index].imageUrl))
      ]
    );
  }

  void _sort (getField(post), bool ascending) {
    _posts.sort((a, b)  {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      return Comparable.compare(getField(a), getField(b));
    });
    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  bool _sortAscending = true;
  int _sortColumnIndex;

  final PostsDataSource _postsDataSource = PostsDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable'),
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
              PaginatedDataTable(
                header: Text('Posts'),
                rowsPerPage: 5,
                source: _postsDataSource,
                sortAscending: _sortAscending,
                sortColumnIndex: _sortColumnIndex,
                showCheckboxColumn: true,
                columns: [
                  DataColumn( 
                    label: Text('Title'),
                    onSort: (int index, bool ascending) {
                      _postsDataSource._sort((post)=> post.title.length, ascending);

                      this.setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = ascending;
                      });
                    }
                  ),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('Image')),
                ], 
              )
            ],
          ),
        )
      ),
    );
  }
} 
import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple','Banana', 'Lemon'
  ];
  String _action = 'Nothing';
  String _choice = 'Lemon';
  List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,         // 2个item之间的 间隔
              runSpacing: 8.0,      // 行与行之间的间隔
              children: <Widget>[
                Chip(
                  label: Text('Life')
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('likanghua'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('李'),
                  ),
                ),
                Chip(
                  label: Text('likanghua'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars1.githubusercontent.com/u/40781464?s=460&u=d8f92f45af356ac4b1b3698f249d65dabf667cd1&v=4'
                    ),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {

                  },
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: "Remove this tag",
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              height: 20.0,
              indent: 10.0,
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map(
                (tag) => Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                )
              ).toList()
            ),
            Divider(
              color: Colors.grey,
              height: 20.0,
              indent: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ActionChip: ${_action}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map(
                (tag) => ActionChip(
                  label: Text(tag),
                  onPressed: () {
                    setState(() {
                      _action = tag;
                    });
                  },
                )
              ).toList()
            ),
            Divider(
              color: Colors.grey,
              height: 20.0,
              indent: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Text('FilterChip: ${_selected.toString()}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map(
                (tag) => FilterChip(
                  label: Text(tag),
                  selected: _selected.contains(tag),
                  onSelected: (value) {
                    setState(() {
                      if(_selected.contains(tag)){
                        _selected.remove(tag);
                      }else {
                        _selected.add(tag);
                      }
                    });
                  },
                )
              ).toList()
            ),

            Divider(
              color: Colors.grey,
              height: 20.0,
              indent: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ChoiceChip: ${_choice}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map(
                (tag) => ChoiceChip(
                  label: Text(tag),
                  selected: _choice == tag,
                  selectedColor: Colors.red[400],
                  onSelected: (value) {
                    setState(() {
                      _choice = tag;
                    });
                  },
                )
              ).toList()
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Banana', 'Lemon'];
            _selected = [];
            _choice = 'Lemon';
          });
        }
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  final String url = 'https://user-gold-cdn.xitu.io/2019/6/14/16b5625ed9a00576?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1';
  List<String> _fruits = ['Apple', 'Banana', 'Lemon'];
  List<String> _animals = ['dog', 'cat', 'elephant', 'tiger'];
  List<String> _colors = ['red', 'green', 'blue', 'yellow'];
  List<String> _selected = [];
  String _choice = '';
  String animal = '';
  void _handleFruitDelete (item) {
    this.setState(() {
      _fruits.remove(item);
    });
  }
  void _handleAnimalPressed (item) {
    this.setState(() {
      animal = item;
    });
  }
  void _handleColorSelect(String item) {
    if(_selected.contains(item)) {
      this.setState(() {
        _selected.remove(item);
      }); 
    }else {
      this.setState(() {
          _selected.add(item);
      });
    }
  }
  void _handleColorChoice (String item) {
    this.setState(() {
      _choice = item;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              children: [
                Chip(label: Text('Life')),
                Chip(label: Text('Life'),
                  backgroundColor: Colors.orange ,
                ),
                Chip(
                  label: Text('Symboll'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('康'),
                  ),
                ),
                Chip(
                  label: Text('Symboll'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(url)
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.red[500],
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
              ],
            ),
            Divider(
              color: Colors.green,
              // indent: 16.0,
              // height: 4.0, 
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              children: _fruits.map((String item) => Chip(
                label: Text(item),
                onDeleted: () => _handleFruitDelete(item),
                deleteIconColor: Colors.red[400],
              )).toList()
            ),
            Divider(
              color: Colors.green,
              // indent: 16.0,
              // height: 4.0, 
            ),
            Container(
              width: double.infinity,
              child: Text('my favorite animal is $animal', 
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              children: _animals.map((String item) => ActionChip(
                label: Text(item), 
                onPressed: () => _handleAnimalPressed(item)
              )).toList(),
            ),
            Divider(color: Colors.green,),
            Container(
              child: Text('selected colors is: ${_selected.toString()}')
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              children: _colors.map((String item) => FilterChip(
                label: Text(item), 
                selected: _selected.contains(item),
                onSelected: (value) => _handleColorSelect(item)
              )).toList()
            ),
            Divider(),
            Container(
              child: Text('choice colors is: $_choice')
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              children: _colors.map((String item) => ChoiceChip(
                label: Text(item, style: TextStyle(
                  color: Colors.white,
                ),),
                backgroundColor: Colors.red[200],
                selectedColor: Colors.red[500],
                selected: _choice == item,
                onSelected: (value) => _handleColorChoice(item), 
              )).toList()
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          this.setState(() {
            _fruits = ['Apple', 'Banana', 'Lemon'];
            _selected = [];
          });
        },
      ),
    );
  }
}

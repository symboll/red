import 'package:flutter/material.dart';
import '../material/index.dart' show ListItem;
import './register_form_demo.dart';
import './checkbox_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './date_time_demo.dart';

class FormComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mdc'),
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'RegisterDemo',
            page: RegisterFormDemo(),
          ),
          ListItem(
            title: 'Checkbox',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Switch',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Slider',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'DateTime',
            page: DateTimeDemo(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
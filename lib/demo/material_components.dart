import 'package:flutter/material.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import 'form/form_demo.dart';
import 'form/checkbox_demo.dart';
import 'form/radio_demo.dart';
import 'form/switch_demo.dart';
import 'form/slider_demo.dart';
import 'form/date_time_deme.dart';
import 'dialog/simple_dialog_demo.dart';
import 'dialog/alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'snack_bar_demo.dart';
import 'expansion_panel_demo.dart';

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
            title: 'ExpansionPanelDemo',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'SnackBarDemo',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'BottomSheetDemo',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo()
          ),
          ListItem(
            title: 'PopupMenu',
            page: PopupMenuButtonDemo()
          ),
          ListItem(
            title: 'Form',
            page: FormDemo()
          ),
          ListItem(
            title: 'CheckBoxDemo',
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: 'RadioDemo',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'SwitchDemo',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'SliderDemo',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'DateTimeDemo',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: 'SimpleDialog',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'AlertDialogDemo',
            page: AlertDialogDemo(),
          ),
        ],
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
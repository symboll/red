
import 'package:flutter/material.dart';
import 'button_demo.dart';
import 'expansion_panel_demo.dart';
import 'floating_action_button_demo.dart';
import 'popup_menu_button_demo.dart';
import 'simple_dialog_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'snack_bar_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mdc'), 
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'ButtonDemo',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: 'SimpleDialog',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'AlertDialog',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'BottomSheetDemo',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'SnackBarDemo',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'ExpansionPanelDemo',
            page: ExpansionPanelDemo(),
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

import 'package:flutter/material.dart';
import '../list_demo.dart';

import 'state_management.dart';
import 'inherited_demo.dart';
import 'scoped_model_demo.dart';

class StateComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('state'), 
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'StateManageMent',
            page: StateManageMentDemo(),
          ),
          ListItem(
            title: 'Inherited',
            page: InheritedDemo(),
          ),
           ListItem(
            title: 'ScopedModel',
            page: ScopedModelDemo(),
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

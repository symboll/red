
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends  Model {
  int _count = 0;
  int get count => _count;
  
  void increaseCount () {
    _count += 1;

    notifyListeners();
  }

} 

class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedDemo'),
        ),
        body: CounterWrap(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,  // 是否需要重建
          builder: (context, _ ,model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        )
      )
    );
  }
}


class CounterWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _ ,model) => ActionChip(
        label: Text('${model.count}'), 
        onPressed: model.increaseCount
      )
    );

  }
}
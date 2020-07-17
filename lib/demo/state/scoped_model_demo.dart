import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class CounterModel extends Model {
  int _count = 0;
  int get count  => _count;

  void increaseCount() {
    _count +=1;
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
          title: Text('ScopedModelDemo'),
          elevation: 0.0,
        ),
        body: Counter(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (BuildContext context, _ , model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount
          )
        ),
      ),
    );
  }
}


class CounterWraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<CounterModel>(
      builder: (BuildContext context, _ , model) => ActionChip(
        label: Text('${model.count}'),
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://avatars1.githubusercontent.com/u/40781464?s=460&u=d8f92f45af356ac4b1b3698f249d65dabf667cd1&v=4'
          ),
        ),
        onPressed: model.increaseCount,
      )
    );
  }
}

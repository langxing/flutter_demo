import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Actions { Increase }

/// 接收一个状态，处理后返回一个状态
int mainReduxer(int state, dynamic action) {
  if (Actions.Increase == action) {
    return state + 1;
  }
  return state;
}

// ignore: must_be_immutable
class CounterApp extends StatelessWidget {
  Store<int> store = new Store(mainReduxer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: "计数器",
          home: StoreConnector<int, int>(builder: (BuildContext context, int counter) {
            return CounterPage(
              counter: counter,
            );
          }, converter: (store) {
            return store.state;
          }),
        ));
  }
}

class CounterPage extends StatelessWidget {
  final int counter;

  const CounterPage({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton:
          StoreConnector<int, VoidCallback>(builder: (context, callback) {
        return FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.add));
      }, converter: (Store<int> store) {
        return () => store.dispatch(Actions.Increase);
      }),
    );
  }
}

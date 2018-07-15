import 'package:flutter/material.dart';

import 'dart:async' show Future, Timer;
import '../../utils/refresh/Refresh.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  CategoryPageState createState() => new CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  Key key = GlobalKey();
  int _counter = 20;

  Future<Null> getData() {
    setState(() {
      _counter += 10;
      if (_counter > 40) {
        isnomore = true;
      }
    });
    return Future.delayed(Duration(milliseconds: 500), () {

    });
  }

  Future<Null> reset() {
    setState(() {
      list.clear();
      _counter = 20;
      isnomore = false;
    });
    return Future.delayed(Duration(milliseconds: 500), () {

    });
  }

  bool isnomore = false;

  final List<String> list = [];

  List<Widget> _listBuilder(int i) {
    final List<Widget> listw = [];
    if (list.isEmpty) {
      for (int i = 0; i < 1000; i++) {
        list.add("Item " + i.toString());
      }
    }
    for (int count = 0; count < i; count++) {
      listw.add(
          ListTile(leading: Icon(Icons.favorite_border, color: Colors.red,),
              title: Text(list[count])));
    }
    listw.add(Padding(padding: EdgeInsets.only(bottom: 16.0),
        child: Center(child: Text(!isnomore ? "" : '我是有底线的'))),);
    return listw;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                child: RefreshLayout(canloading: !isnomore, onRefresh: (boo) {
                  if (!boo) {
                    return getData();
                  } else {
                    return reset();
                  }
                }, key: key,
                    child: new ListView(children: _listBuilder(_counter),)))
            ,
            new Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
          ],
        ),
      ),
    );
  }
}
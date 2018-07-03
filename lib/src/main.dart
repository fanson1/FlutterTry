import 'package:flutter/material.dart';

import './pages/SplashPage.dart';
import './pages/MainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '立等可取',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new SplashPage(),
      routes: <String, WidgetBuilder> {
        '/MainPage': (BuildContext context) => new MainPage()
      },
    );
  }
}
import 'dart:async';
import 'package:flutter/widgets.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new Image.asset("images/load_page.png");
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    var duration = new Duration(seconds: 2);
    new Future.delayed(duration, go2HomePage);
  }

  void go2HomePage() {
    Navigator.of(context).pushReplacementNamed("/MainPage");
  }
}
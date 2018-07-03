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
  Widget build(BuildContext context) {// 启动页图片
    return new Image.asset("images/load_page.png");
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  /**
   *
   * 跳转策略
   */
  void countDown() {
    // 2秒后跳转到主界面
    var duration = new Duration(seconds: 2);
    new Future.delayed(duration, go2HomePage);
  }

  /**
   *
   * 跳转主界面
   */
  void go2HomePage() {
    Navigator.of(context).pushReplacementNamed("/MainPage");
  }
}
import 'package:flutter/material.dart';

import './pages/SplashPage.dart';
import './pages/MainPage.dart';

// main函数程序入口
void main() => runApp(new MyApp());

/**
 *
 * 无状态Widget
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '立等可取',
      theme: new ThemeData(
        primaryColor: Colors.blue,// 主色：标题栏和底部导航栏选中等默认使用颜色
      ),
      home: new SplashPage(),// 当前页面
      routes: <String, WidgetBuilder> {// 路由
        '/MainPage': (BuildContext context) => new MainPage()
      },
    );
  }
}
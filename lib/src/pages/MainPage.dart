import 'package:flutter/material.dart';

import './moudle/HomePage.dart';
import './moudle/CategoryPage.dart';
import './moudle/CartPage.dart';
import './moudle/PersonalPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  var pageController = new PageController(initialPage: 0);
  List moudlesTitle = [ "首页", "分类", "购物车", "个人中心" ];
  List moudlesPage = [ new HomePage(), new CategoryPage(), new CartPage(), new PersonalPage()];

  /**
   *
   * 页面切换，修改状态
   */
  void pageChange(int index) {
    setState(() {
      if (currentPageIndex != index) {
        currentPageIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(// 标题栏
        title: new Text(moudlesTitle[currentPageIndex]),
        centerTitle: true,
      ),
      body: new PageView.builder(
        onPageChanged:pageChange,
        controller: pageController,
        itemBuilder: (BuildContext context,int index){
          return getPage(index);// 获取指定页面
        },
        itemCount: 4,

      ),
      bottomNavigationBar: new BottomNavigationBar(// 底部导航栏
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text(moudlesTitle[0])),
          BottomNavigationBarItem(
              icon: new Icon(Icons.message), title: new Text(moudlesTitle[1])),
          BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart), title: new Text(moudlesTitle[2])),
          BottomNavigationBarItem(
              icon: new Icon(Icons.contacts), title: new Text(moudlesTitle[3])),
        ],
        currentIndex: currentPageIndex,
        onTap: (int index){// 处理点击操作
          pageController.animateToPage(index, duration: new Duration(seconds: 2),
              curve:new ElasticOutCurve(0.8));
          pageChange(index);
        },
        type: BottomNavigationBarType.fixed,// 显示选中状态
      ),
    );
  }

  /**
   *
   * 获取指定页面
   */
  MaterialApp getPage(int index) {
    return new MaterialApp(
      title: moudlesTitle[index],
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: moudlesPage[index],
    );
  }
}
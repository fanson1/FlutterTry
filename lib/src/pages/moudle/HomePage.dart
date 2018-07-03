import 'package:flutter/material.dart';

import '../../utils/ToastImpl.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: new Center(
        child:
          new Text("首页"),
      ),
    );
  }

  /**
   *
   * 展示Toast
   */
  void press() {
    show("Flutter的Toast展示", 1);
  }
}
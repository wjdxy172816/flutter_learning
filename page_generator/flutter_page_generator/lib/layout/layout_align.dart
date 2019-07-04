

import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
/**
 * 对齐的一种控件,控制子控件对齐
 * */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          //Align可以指定内部内容的位置,上下左右等等.
          child: Align(
            //通过alignment属性,我们可以指定子控件的位置
            alignment: Alignment.center,//默认是center
            //Container容器主要用于指定固定尺寸大小,可以作为一个parent包裹内部的容器.同时还可以指定子控件
            //子控件适应他
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: Center(//如果要指定子控件在Container中的位置,那么可以通过Center等可以指定位置的控件
                //来实现在父控件中的位置
                  child: Text("这是一个内容啦啦啦啦啦啦啦啦呀呀呀呀呀呀呀"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

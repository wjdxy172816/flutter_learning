

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
/**
 * 这是Android风格和iOS风格的默认进度圈的差别
 * */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android和iOS默认加载方式的区别"),
      ),
      body: Center(

        child: Column(
          //mainAxisAlignment属性是让控件在主轴的中心位置显示,对于列(Column)而言,他的主轴是Y轴
          //而对于行(Row)而言,他的主轴是X轴
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(//这个控件是一个专门用于增加间距用的控件.
              height: 50,
              width: 50,
            ),
            CircularProgressIndicator(//Android经典的进度圈
              //strokeWidth: 20.0,//指定进度圈的宽度为20(太宽了)
            ),
            SizedBox(
              height: 50.0,
              width: 50.0,
            ),
            CupertinoActivityIndicator(//iOS经典的进度圈
              //radius: 20,//指定进度圈的半径为20.
            )
          ],
        ),
      ),
    );
  }
}


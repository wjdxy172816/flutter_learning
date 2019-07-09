import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //初始化偏移量,设置偏移量为0
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_offset.dy * 0.01),//基于左上角的Y轴进行旋转
            //..rotateY(_offset.dx * 0.01),//基于左上角的X轴进行旋转
            //..rotateZ(_offset.dy*0.01),//Z轴就是以左上角为圆心进行旋转
          child: GestureDetector(
            //该属性是在手势发生改变后的一个回调监听
            onPanUpdate: (detail) {
              setState(() {
                _offset += detail.delta; //对发生改变的偏移量进行累加以记录
              });
            },
            onDoubleTap: () {
              setState(() {
                _offset = Offset.zero; //当双击时归零偏移量
              });
            },
            child: Container(
              width: 200,
              height: 200,
              color: Color(0xffff0000),
            ),
          ),
        ),
      ),
    );
  }
}

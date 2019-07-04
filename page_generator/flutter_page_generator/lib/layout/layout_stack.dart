

import 'dart:math';

import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

/**
 * Stack类似Android中的FrameLayout
 * 使用它时要配合定位控件如Align,Positioned等.
 * */
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
  int _index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack测试"),
      ),
      body: Center(
        child: //_bulidAlignStack(context),
        _buildIndexStack(context)
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _index =Random().nextInt(2)%2;//产生随机数0或者1,让Stack第0或者第1位置的控件显示
        });
      }),
    );
  }

  _buildIndexStack(BuildContext context){
    //IndexedStack的作用是根据index属性的值,显示Stack中第index个位置的控件.
    return IndexedStack(
      index: _index,
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 20,
        ),
      ],
    );
  }
}

_bulidAlignStack(BuildContext context){
  return Stack(
    //Alignment坐标参数是以父控件的中心位置开始计算的,
    //如果为0,0,就表示在中间,如果为(-1,-1)就表示左上,(1,-1)表示右上
    //(-1,1)表示左下,(1,1)表示右下.超过1就会向父控件尺寸外部偏移.
    alignment: Alignment(1.2, -1.2),
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      //Positioned控件能够指定控件的位置,默认是在父布局的左上角,可以指定其左上右下四个方向的距离
      //来确定位置
      /*Positioned(
              left: 10,
              top: 40,
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 20,
              ),
            ),*/
      CircleAvatar(
        backgroundColor: Colors.red,
        radius: 20,
      ),
      /*Align(
                //alignment: Alignment(1.1, -1.1),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 20,
                ),
              ),*/
    ],
  );
}



import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  Animation<Color> _animation;
  AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: _animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _controller =AnimationController(vsync: this,duration:const Duration(seconds: 2));
    _animation =ColorTween(begin: Color(0xffffffff),end:Color(0xffff0000))
        .animate(_controller)
    ..addListener((){
      //涉及到动画时,一定要添加addListener方法,并且方法中要调用setState方法对值进行更新,否则的话会一直不动的.
      setState(() {});
    })
    ..addStatusListener((status){
      //动画结束后,反转执行动画
      if(status ==AnimationStatus.completed){
        _controller.reverse();
        //在反转动画执行结束后,动画消失,然后又重新开始执行动画
      }else if(status ==AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


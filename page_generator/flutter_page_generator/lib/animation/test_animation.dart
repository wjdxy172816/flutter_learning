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
/**
 * 必须要实现Tricker,否则的话,昂,暂时没搞懂
 * */
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation<double> animation;

  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
              child: GestureDetector(
            //手势监听器,内部有诸多手势,点击事件的监听
            onTap: () {
              _startAnimation();
            },
            child: Text("点击我开始动画"),
          )),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: animation.value,
              height: animation.value,
              color: Color(0xff00ffff),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化动画控制器
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    //初始化补间对象,设置初始化值,关联控制器,并设置监听.
    animation = Tween(begin: 0.0, end: 100.0).animate(controller)
      ..addListener(() {
        setState(() {
          print(animation.value); //打印插值
        });
      })
      ..addStatusListener((status) {
        print(status);
      });

    //执行动画
    //controller.forward();
  }

  @override
  void dispose() {
    //持续的动画会导致内存泄漏,所以需要手动释放,根据文档,手动释放资源必须放在super.dispose()之前.
    controller.dispose();
    super.dispose();
  }

  //执行动画
  _startAnimation() {
    setState(() {
      controller.forward(from: 0);
    });
  }
}

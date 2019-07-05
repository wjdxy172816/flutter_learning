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
    //获取屏幕宽度
    var screenWidth =MediaQuery.of(context).size.width;
    return Scaffold(
      body:AnimatedBuilder(animation: controller, builder: (context,child){
        return Transform(
          //表示转场动画只有从屏幕的左侧中间位置(因为y轴始终为0)移动到屏幕的中间(因为animation第一次为0,再到1)
          transform: Matrix4.translationValues(screenWidth*animation.value,0.0,0.0),
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              child: FlutterLogo() ,
            ),
          ),
        );
      }),
    );
  }

  void myListener(status) async{
    if(status ==AnimationStatus.completed){
      await Future.delayed(Duration(seconds: 2));//暂停2秒钟
      //当监听到运行到结束时,要移除进场动画设置的监听,否则的话会导致出场动画被重复触发.
      controller.removeStatusListener(myListener);
      controller.reset();
      //将进场动画初始化为出场动画
      animation =Tween(begin: 0.0,end:1.0)
          .animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
      //开始动画
      controller.forward();
    }
  }
  @override
  void initState() {
    super.initState();
    //初始化动画控制器
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    //初始化进场动画,从坐标到屏幕中间.
    animation = Tween(begin: -1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {
          print(animation.value); //打印插值
        });
      })
      ..addStatusListener(myListener);
    //开始执行动画
    controller.forward();
  }

  @override
  void dispose() {
    //持续的动画会导致内存泄漏,所以需要手动释放,根据文档,手动释放资源必须放在super.dispose()之前.
    controller.dispose();
    super.dispose();
  }
}

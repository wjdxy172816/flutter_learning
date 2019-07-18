import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';

void main() => runApp(MaterialApp(
      home: HomePage()
    ));

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_){
      print("设置数据");
      if(!mounted) return;
      setState(() {
        print("更新数据");
        userName ="蜡笔小新";
      });
    });
  }

  String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是一个Lib的调用demo"),
      ),
      body: Center(
        child: Container(
          child: AvatorView(
            size: 100,
            avatorUrl:
            "https://ss0.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1222929928,1326821480&fm=26&gp=0.jpg",
            userName: userName,
            borderColor: 0xffcccccc,
            borderWidth: 10,
            fontSize: 20,
            fontColor: 0xffffff00,
            onClick: (isLogin){
              print("current login state ==$isLogin");
            },
          ),
        ),
      ),
    );
  }
}

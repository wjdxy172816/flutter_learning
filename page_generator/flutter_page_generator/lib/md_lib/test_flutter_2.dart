
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
/**
 * 这是对话框的使用示例
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是title"),
        leading: BackButtonIcon(),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("对话框1"),
            onPressed: (){
              showDialog(context: context,builder: (context){
                return AlertDialog(
                  title: Text(
                      "这是标题",
                  ),
                  //titlePadding: EdgeInsets.fromLTRB(30, 0, 0, 300),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text("这些内容你是否需要删除?如果删除了那么你就找不回来了哦.")
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("删除!!"),
                      onPressed: (){//添加点击事件
                        Navigator.of(context).pop();//取消显示
                      },
                    ),
                    FlatButton(
                      child: Text("不删除!!"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
            },
          ),
          RaisedButton(
            child: Text("这是对话框2"),
            onPressed: (){
              showDialog(context: context,builder: (BuildContext context){
                return SimpleDialog(
                  title: Text("这是对话框1"),
                  children: getLists(5),
                );
              });
            },
          ),
        ],
      ),
    );
  }
  /**
   * 构建控件列表
   * */
  getLists(int size){
    List<Widget> lists =List();
    for(int i=0;i<size;i++){
      lists.add(SimpleDialogOption(
        child: Text("这是选项$i"),
        onPressed: (){
          print("这是选项$i");
          Navigator.of(context).pop();
        },
      ));
    }
    return lists;
  }
}



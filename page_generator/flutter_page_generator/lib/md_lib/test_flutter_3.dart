import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 这是一个Card的使用示例
 * 在此示例中,将为你展示如何定义一种常见的布局格式
 * */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Card示例"),
          leading: Icon(Icons.payment),
          actions: <Widget>[
            Icon(Icons.more_vert),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Card(//类似Android中的Card,提供了一个可以有阴影
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/2x/shili.png",
                    /*width: double.infinity,height: 150,*/
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Icon(Icons.home),
                        ),
                      ),
                      Expanded(//这个控件是将一行中的剩余部分全部填充满.类似LinearLayout的Match_Parent.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("用户点赞数",
                                  style: TextStyle(fontSize: 14)),
                              Text("345",
                                  style: TextStyle(fontSize: 12)), //Text的字体默认大小是14.
                            ],
                          )),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.favorite,color: Colors.red,),
                            Text("55",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

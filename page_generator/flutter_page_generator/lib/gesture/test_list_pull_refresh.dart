
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home: HomePage(),
));

/**
 * 有下拉刷新,下来加载更多的ListView
 * */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list =List();

  ScrollController _controller;//用于监听界面滑动
  @override
  void initState() {
    super.initState();
    _refresh();
    _controller =ScrollController()..addListener((){//初始化滑动控制器并设置监听
      //当ListView的位置的像素已经达到最大值时,表示滑到了最底部
      if(_controller.position.pixels ==_controller.position.maxScrollExtent){
        _loadMore();
      }
    });
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadMore() async{
    print("load more data!!!");
    await Future.delayed(Duration(seconds: 2),(){
      setState(() {
        list.addAll(List.generate(Random().nextInt(5), (index){
          return "LoadMore item is $index";
        }));
      });
    });
  }

  //刷新的方法,当我们下拉时通常这儿是网络请求刷新更多数据,所以需要一个Futrue对象,
  //当Futrue获取到新的数据列表后,系统自己将刷新控件移除.
  Future<void> _refresh() async{
    print("refresh data!!!");
    await Future.delayed(Duration(seconds: 2),(){
      setState(() {
        list =List.generate(Random().nextInt(10 )+15, (index){
          return "refresh item is $index";
        });
      });
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("刷新和加载概更多测试"),
      ),
      body: Center(
        child: RefreshIndicator(//这是系统提供的可供下拉刷新的控件
          displacement: 10.0,//下拉时进度控件与上方的高度
            child: list==null||list.isEmpty?
            Center(//第一次进入时,list尚未初始化,那么此时就在中间显示一个进度圈.
              child: CircularProgressIndicator(),
            )
                :
            ListView.builder(//否则就显示数据列表
                controller: _controller,//给Lv设置滑动控制器
                itemCount: list .length+1,//默认数据+1,当滑动到最后这条数据时,显示加载更多的控件.
                itemBuilder: (context,index){
                  if(index==list.length){//当滑动到最后一个数据,使用加载更多控件.
                    return Padding(
                      padding: EdgeInsets.only(top:10,bottom:10.0),
                      child: Center(
                          child:Column(//添加加载更多控件
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 10,
                              ),
                              Text("加载更多"),
                            ],
                          )
                      ),
                    );
                  }else{
                    return ListTile(
                      title: Text(list[index]),
                    );
                  }
                }),
            onRefresh: _refresh//用于监听下拉刷新的监听
        ),
      ),
    );
  }
}

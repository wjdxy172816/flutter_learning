import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:osc_proctice/resources/constant/about_networks.dart';
import 'package:osc_proctice/utils/net_utils.dart';
import 'package:osc_proctice/utils/save_data_utils.dart';

class AccountMessagePage extends StatefulWidget {
  @override
  _AccountMessagePageState createState() => _AccountMessagePageState();
}

class _AccountMessagePageState extends State<AccountMessagePage> {
  List<String> titleNames = ["@我", "评论", "私信"];
  int _curIndex = 2;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: titleNames.length,
        initialIndex: _curIndex,
        child: Scaffold(
            appBar: AppBar(
          title: Text(
            "我的信息",
            style: TextStyle(color: Color(AppColor.WHITE_COLOR)),
          ),
          iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
          bottom: TabBar(tabs: titleNames.map((name){
            return Tab(text: name,)/*Text(name,style: TextStyle(
              color: Color(AppColor.WHITE_COLOR),
              wordSpacing: 10
            ),)*/;
          }).toList(),labelColor: Color(AppColor.WHITE_COLOR),indicatorColor: Color(AppColor.RED_COLOR),),
        ),
          body: TabBarView(children:[//body是需要动态化的,不能进行初始设置,否则的话界面就不刷新了.
            Center(
              child: Text("@我"),
            ),
            Center(
              child: Text("评论"),
            ),
            Center(
              child: _buildPriLetterMessageList(),//这是是需要动态创建的.
            ),
          ]),
        ));
  }

  //获取私信列表
  _getPriMessages(){
    Map<String,dynamic> params =Map();
    SpSaveDataUtil.getAccessToken().then((token){
      params["access_token"] =token;
      params["page"] =_currentPage;
      params["pageSize"] =15;
      params["dataType"] ="json";

      NetUtils.get(NetUrl.GET_PRIVITE_MESSAGE_LIST, params).then((data){
        print("result is :$data");
        Map<String,dynamic> map =json.decode(data);
        var _priMsgList =map['messageList'];
        if(mounted){
          setState(() {
            print("change state!!!");
            this._priMsgList =_priMsgList;
          });
        }
      });
    });
  }

  int _currentPage =1;

  //刷新的时候要严格按照返回一个Void类型的Future这种方式来,否则不会自动取消刷新状态.
  Future<void> _refreshPage() async{
    _currentPage =1;
    _getPriMessages();
    return null;
  }
  List _priMsgList;
  Widget _buildPriLetterMessageList(){
    print("hello world!!!");
    if(_priMsgList==null){
      _getPriMessages();
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }
    return RefreshIndicator(
      child: ListView.separated(itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Image.network(_priMsgList[index]["portrait"]),
              SizedBox(width: 10,child: Container(color: Color(AppColor.RED_COLOR),),),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_priMsgList[index]['sendername']}',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${_priMsgList[index]['pubDate']}',
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xffaaaaaa)),
                        ),
                      ],
                    ),
                    Text("${_priMsgList[index]["content"]}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }, separatorBuilder: (context,index){
        return Divider();
      }, itemCount: _priMsgList==null?0:_priMsgList.length
      ),
      onRefresh: _refreshPage,//调用方法时,注意方法名后面不需要().同时,刷新是需要有一个void类型的Future返回值的.
    );
  }
}

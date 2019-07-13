import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/about_networks.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'package:osc_proctice/user_center/login_page.dart';
import 'package:osc_proctice/utils/event_bus_utils.dart';
import 'package:osc_proctice/utils/net_utils.dart';
import 'package:osc_proctice/utils/save_data_utils.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List<String> actionsName = [
    "我的消息",
    "我的记录",
    "我的博客",
    "我的问答",
    "我的活动",
    "我的团队",
    "邀请好友",
  ];
  List<IconData> actionsTag = [
    Icons.message,
    Icons.note,
    Icons.date_range,
    Icons.question_answer,
    Icons.spa,
    Icons.people,
    Icons.person
  ];

  String _userAvator;
  String _userName ="点击登录";

  @override
  void initState() {
    super.initState();
    _checkUserInfo();
    bus.on<LoginInEvent>().listen((event){
      print("receive event:${event.hashCode}");
      _getUserInfo();
    });
    bus.on<LoginOutEvent>().listen((event){

    });
  }
  @override
  void disposed(){
    bus.destroy();
    super.dispose();
  }

  _checkUserInfo(){

  }

  _getUserInfo(){
    SpSaveDataUtil.getAccessToken().then((token){
      Map<String,dynamic> params =Map();
      params["access_token"] =token;
      params["dataType"] ="json";
      NetUtils.get(NetUrl.USER_ACCOUNT, params).then((result){
        Map<String,dynamic> results =json.decode(result);
        results.forEach((key,value){
          print("key =$key, value =$value");
        });
        if(mounted){//要加一个判断,判断视图树中是否还持有相关对象的引用,避免造成内存泄漏.
          setState(() {
            _userName =results["name"];
            _userAvator =results["avatar"];
          });
        }
        SpSaveDataUtil.saveUserInfo(results);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (cxt, index) {
            if(index==0){//头部
              return _buildMineHeadWidget();
            }
            index--;
            return ListTile(
              leading: Icon(actionsTag[index]),
              title: Text(actionsName[index]),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                //TODO
              },
            );
          },
          separatorBuilder: (cxt, index) {
            return Divider(
              height: 1.0,
            );
          },
          itemCount: actionsName.length + 1),
    );
  }
  _login() async{
    String result =await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
    print("result is $result");
    if("refresh_page" ==result){
      var event =LoginInEvent();//这儿很奇怪,如果先声明事件,再进行传递的话,会导致传递失败,而直接在fire方法中new对象进行传递又是正常的.
      print("send event ${event.hashCode}");
      bus.fire(LoginInEvent());
    }
  }
  /**
   * 构建我的页面头部元素
   * */
  _buildMineHeadWidget(){
    return Container(
      color: Color(AppColor.THEME_PRIMARY_COLOR),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: CircleAvatar(
                radius: 40,
                child: _userAvator==null?Image.asset("assets/images/2x/ic_avatar_default.png"):
                Image.network(_userAvator,fit: BoxFit.fill,),
              ),
              onTap: (){
                _login();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(_userName,style: TextStyle(color: Color(AppColor.WHITE_COLOR)),),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}


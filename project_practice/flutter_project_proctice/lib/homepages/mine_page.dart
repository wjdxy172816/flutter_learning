import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'package:osc_proctice/user_center/login_page.dart';

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
  ];
  List<IconData> actionsTag = [
    Icons.message,
    Icons.note,
    Icons.date_range,
    Icons.question_answer,
  ];

  String _userAvator;
  String _userName;

  @override
  void initState() {
    super.initState();
    _checkUserInfo();
  }

  _checkUserInfo(){

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
                child: Image.asset("assets/images/2x/ic_avatar_default.png"),
              ),
              onTap: (){
                Function jump =()async{
                  await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                };
                jump();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("点击修改头像",style: TextStyle(color: Color(AppColor.WHITE_COLOR)),),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}


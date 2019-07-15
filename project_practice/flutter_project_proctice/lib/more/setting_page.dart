

import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'package:osc_proctice/utils/save_data_utils.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置",style: TextStyle(color: Color(AppColor.WHITE_COLOR)),),
        iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Text("点击退出登录"),
            ),
            RaisedButton(
              child: Text("点击退出登录"),
              onPressed: (){
                print("login out!!!");
                SpSaveDataUtil.saveUserInfo(Map());
              },
            ),
          ],
        ),
      ),
    );
  }
}

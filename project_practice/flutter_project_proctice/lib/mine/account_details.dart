import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:osc_proctice/beans/user_about_beans.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'package:osc_proctice/resources/constant/about_networks.dart';
import 'package:osc_proctice/utils/net_utils.dart';
import 'package:osc_proctice/utils/save_data_utils.dart';
import 'package:flutter/cupertino.dart';

class AccountDetailPage extends StatefulWidget {
  @override
  _AccountDetailPageState createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  UserInfo _info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "用户详细信息",
          style: TextStyle(color: Color(AppColor.WHITE_COLOR)),
        ),
        iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
      ),
      body: _buildBodyCotent(),
    );
  }

  @override
  void initState() {
    super.initState();
    print("request data!!!");
    Map<String, String> params = Map();
    SpSaveDataUtil.getAccessToken().then((token) {
      params["access_token"] = token;
      params["dataType"] = "json";
      NetUtils.get(NetUrl.USER_INFO_DETAIL, params).then((data) {
        Map<String, dynamic> map = json.decode(data);
        print("get user info detail!!!");
        map.forEach((key, value) {
          print("key =$key,value =$value");
        });
        UserInfo userInfo = UserInfo();
        userInfo.uid = map['uid'];
        userInfo.name = map['name'];
        userInfo.gender = map['gender'];
        userInfo.province = map['province'];
        userInfo.city = map['city'];
        userInfo.platforms = map['platforms'];
        userInfo.expertise = map['expertise'];
        userInfo.joinTime = map['joinTime'];
        userInfo.lastLoginTime = map['lastLoginTime'];
        userInfo.portrait = map['portrait'];
        userInfo.fansCount = map['fansCount'];
        userInfo.favoriteCount = map['favoriteCount'];
        userInfo.followersCount = map['followersCount'];
        userInfo.notice = map['notice'];
        if(mounted){
          setState(() {//刷新数据
            _info = userInfo;
          });
        }
      });
    });
  }

  Widget _buildBodyCotent() {
    return SingleChildScrollView(
      child: _info == null
          ? Center(
              child:CupertinoActivityIndicator(),
            )
          : Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "头像",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(AppColor.WHITE_COLOR),
                              width: 2
                            ),
                            image: DecorationImage(
                                image: NetworkImage(_info.portrait),
                            fit: BoxFit.fill,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildItems("昵称",_info.name),
                Divider(height: 1,),
                _buildItems("性别",_info.gender==1?"男":"女"),
                Divider(height: 1,),
                _buildItems("城市",_info.province+_info.city),
                Divider(height: 1,),
                _buildItems("加入时间",_info.joinTime),
                Divider(height: 1,),
                _buildItems("关注者","${_info.fansCount}人"),
                Divider(height: 1,),
                _buildItems("平台",_info.platforms.toString()),
                Divider(height: 1,),
              ],
            ),
    );
  }

  Widget _buildItems(String key,String value){
    return InkWell(
      onTap: () {
        //TODO
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20.0),
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, right: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              key,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

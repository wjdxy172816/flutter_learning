import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';

class AccountMessagePage extends StatefulWidget {
  @override
  _AccountMessagePageState createState() => _AccountMessagePageState();
}

class _AccountMessagePageState extends State<AccountMessagePage> {
  List<String> titleNames = ["@我", "评论", "私信"];
  List<Widget> childrens = [
    Center(
      child: Text("@我"),
    ),
    Center(
      child: Text("评论"),
    ),
    Center(
      child: Text("私信"),
    ),
  ];
  int _curIndex = 0;

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
          bottom: TabBar(tabs: titleNames.map((name) => Text(name)).toList()),
        ),
          body: TabBarView(children: childrens),
        ));
  }
}

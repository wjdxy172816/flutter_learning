

import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';

class PublishTweetPage extends StatefulWidget {
  @override
  _PublishTweetPageState createState() => _PublishTweetPageState();
}

class _PublishTweetPageState extends State<PublishTweetPage> {

  //用于获取输入内容的cotroller
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
        title: Text("发布动态",
        style: TextStyle(color: Color(AppColor.WHITE_COLOR)),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              print("发布");
            },
            child: Text("发布",style: TextStyle(color: Color(AppColor.WHITE_COLOR),fontSize: 16),),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "请输入点什么",
                hintMaxLines: 1,
                hintStyle: TextStyle(color: Color(0xffcccccc)),
                border: OutlineInputBorder(borderSide: BorderSide(
                  width: 10,
                  style: BorderStyle.solid
                ),borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              maxLines: 6,
              maxLength: 200,
            ),
          ),
          GridView(),
        ],
      ),
    );
  }
}

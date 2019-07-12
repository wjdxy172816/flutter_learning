

import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';

class PublishTweetPage extends StatefulWidget {
  @override
  _PublishTweetPageState createState() => _PublishTweetPageState();
}

class _PublishTweetPageState extends State<PublishTweetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
        title: Text("发布动态",
        style: TextStyle(color: Color(AppColor.WHITE_COLOR)),
        ),
      ),
    );
  }
}

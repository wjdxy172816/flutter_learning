

import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的记录",style: TextStyle(color: Color(AppColor.WHITE_COLOR)),),
        iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
      ),
      body: Container(

      ),
    );
  }
}

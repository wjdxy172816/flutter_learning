import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
//import 'package:flutter_project_proctice/resources/colors/app_color.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//不再显示设备右上角的debug标签
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(AppColor.THEME_PRIMARY_COLOR)),
      home: HomePage()
    );
  }
}

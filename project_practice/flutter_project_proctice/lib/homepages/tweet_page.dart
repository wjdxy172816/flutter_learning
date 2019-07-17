import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';

class TweetPage extends StatefulWidget {
  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage>
    with SingleTickerProviderStateMixin {
  List<String> tabsName = ["最新", "热门"];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabsName.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color(AppColor.THEME_PRIMARY_COLOR),
          child: TabBar(
            labelColor: Color(AppColor.WHITE_COLOR),
            indicatorColor: Color(AppColor.WHITE_COLOR),
            controller: _controller,//要给TabBar和TabBarView都设置一个用于联动的控制器
              tabs: tabsName.map((name) {
            return Tab(
              text: name,
            );
          }).toList()),
        ),
        Expanded(
          child: TabBarView(
            children: [_buildLatestWidget(), _buildHotWidget()],
            controller: _controller,
          ),
        ),
      ],
    );
  }

  Widget _buildLatestWidget() {
    return Container(
      color: Color(AppColor.RED_COLOR),
    );
  }

  Widget _buildHotWidget() {
    return Container(
      color: Color(AppColor.BLUE_COLOR),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

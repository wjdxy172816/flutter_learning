import 'package:flutter/material.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'home/bottom_widget.dart';
import 'home/home_drawer.dart';
import 'homepages/discover_page.dart';
import 'homepages/mine_page.dart';
import 'homepages/newslist_page.dart';
import 'homepages/tweet_page.dart';

/**
 * 主页界面
 * */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> navigationBarTitles = ["咨询", "动态", "发现", "我的"];
  List<String> navigationBarImg = [
    "assets/images/2x/ic_nav_news_normal.png",
    "assets/images/2x/ic_nav_tweet_normal.png",
    "assets/images/2x/ic_nav_discover_normal.png",
    "assets/images/2x/ic_nav_my_normal.png",
  ];
  List<String> navigationBarImgSel = [
    "assets/images/2x/ic_nav_news_actived.png",
    "assets/images/2x/ic_nav_tweet_actived.png",
    "assets/images/2x/ic_nav_discover_actived.png",
    "assets/images/2x/ic_nav_my_pressed.png",
  ];

  int _currentIndex = 0;

  PageController _pageController;

  List<Widget> _homePages =[
    NewsListPage(),
    TweetPage(),
    DiscoverPage(),
    MinePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController =PageController(initialPage: _currentIndex);
  }

  //SafeArea控件可以适配刘海屏等异型屏
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navigationBarTitles[_currentIndex],style: TextStyle(color: Color(AppColor.WHITE_COLOR)),),
        elevation: 0.0 ,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(AppColor.WHITE_COLOR)),
      ),
      body: PageView.builder(
        //physics: NeverScrollableScrollPhysics(),//禁止ViewPager滑动
        itemBuilder: (context,index)=>_homePages[_currentIndex],
        itemCount: _homePages.length,
        controller: _pageController,
        onPageChanged: (index){//当页面发生改变时,同时也要关联底部导航栏同步改变
          setState(() {
            _currentIndex =index;
          });
        },
      ),//homePages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,//指定当前索引为_currentIndex
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          //底部导航栏发生点击事件时同时需要关联页面发生联动.
          _pageController.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.ease);
        },
        type: BottomNavigationBarType.fixed,
        items: getNavigationBars().map((bean) => bean.item).toList(),
      ),
      drawer: _currentIndex==0?HomeDrawer():null,
    );
  }

  List<ButtomWidgetBean> getNavigationBars() {
    List<ButtomWidgetBean> items = List();
    for (int i = 0; i < navigationBarTitles.length; i++) {
      ButtomWidgetBean bean = ButtomWidgetBean(
          indicatorName: navigationBarTitles[i],
          indicatorImg: navigationBarImg[i],
          indicatorImgSel: navigationBarImgSel[i]);
      items.add(bean);
    }
    return items;
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

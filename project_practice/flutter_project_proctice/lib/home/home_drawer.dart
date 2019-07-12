import 'package:flutter/material.dart';
import 'package:osc_proctice/more/about_page.dart';
import 'package:osc_proctice/more/black_list.dart';
import 'package:osc_proctice/more/setting_page.dart';
import 'package:osc_proctice/publish_tweet/publish_tweet_page.dart';



class HomeDrawer extends StatelessWidget {
  List<String> actions = ["发布动态", "黑名单", "关于", "设置"];
  List<IconData> icons = [
    Icons.send,
    Icons.not_interested,
    Icons.all_inclusive,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        padding: EdgeInsets.all(0),
          itemBuilder: (cxt, index) {
            if (index == 0) {
              print("return head");
              return Image.asset(
                "assets/images/2x/cover_img.jpg",
                fit: BoxFit.cover,
              );
            }
            index--;
            return ListTile(
              leading: Icon(icons[index]),
              title: Text(actions[index]),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                toPages(context,index);
              },
            );
          },
          separatorBuilder: (cxt,index){
            if(index==0){
              return Divider(height: 0);
            }else{
              return Divider(height: 1);
            }
          },
          itemCount: actions.length + 1),
    );
  }

  void toPages(cxt,index){
    switch(index){
      case 0:
        jumpPage(cxt, PublishTweetPage());
        break;
      case 1:
        jumpPage(cxt, BlackListPage());
        break;
      case 2:
        jumpPage(cxt, AboutPage());
        break;
      case 3:
        jumpPage(cxt, SettingPage());
        break;
    }
  }
  //动态跳转路由
  jumpPage(cxt,destiny) async{
    await Navigator.push(cxt, MaterialPageRoute(builder: (cxt)=>destiny));
    Navigator.of(cxt).pop();
  }
}

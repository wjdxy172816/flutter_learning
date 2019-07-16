import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:osc_proctice/common_page/common_web_page.dart';
import 'package:osc_proctice/common_page/sensors_page.dart';
import 'package:osc_proctice/resources/colors/app_color.dart';
import 'package:sensors/sensors.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Map<String, IconData>> blocks = [
    {
      "开源众包": Icons.border_all,
      "开源软件": Icons.folder_open,
      "码云推荐": Icons.subject,
      "代码片段": Icons.speaker_notes_off
    },
    {"扫一扫": Icons.scanner, "摇一摇": Icons.mobile_screen_share},
    {"码云封面任务": Icons.people, "线下活动": Icons.local_activity}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          //height: 200, //Container高度为200,有一个上部的框和下部的框
          //color: Color(AppColor.RED_COLOR),//color属性和decoration属性是无法共存的
          decoration: BoxDecoration(
            //给Container提供一个边框
            border: Border(
              //这是对边框进行细致化处理
              top: BorderSide(
                  //顶部边框
                  width: 1.0,
                  color: Color(0xff003eef)),
              bottom: BorderSide(width: 1.0, color: Color(0xffee00aa)),
            ),
          ),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),//解决滑动冲突,不设置的话,嵌套的Lv之间会发生冲突.
              shrinkWrap: true,//是否应该根据正在查看的内容确定滚动视图的范围,为false或者不设置时,就不再显示页面元素
              itemBuilder: (context, blockIndex) {
                return InkWell(
                  onTap: (){
                    if(index==0){
                      jumpToWeb(context, "开源众包", "https://www.oschina.net/project/zh");
                    }else if(index ==1){
                      //调用原生
                      print("调用原生");
                      switch (blocks[index].keys.elementAt(blockIndex)){
                        case "扫一扫":
                          sacn();
                          break;
                        case "摇一摇":
                          shake(context);
                          break;
                      }
                    }else{
                      print("其他的");
                    }
                  },
                  child: Container(
                      child:ListTile(
                        leading: Icon(blocks[index].values.elementAt(blockIndex)),
                        title: Text(blocks[index].keys.elementAt(blockIndex)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                  ),
                );
              },
              separatorBuilder: (context, blockIndex) {
                return Divider();
              },
              itemCount: blocks[index].length),
        );
      },
      itemCount: blocks.length,
    );
  }

  void shake(context) async{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SensorsPage()));
  }

  void sacn() async{
    Future<String> result =BarcodeScanner.scan();
    print(result);
  }
}

void jumpToWeb(context,title,url){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommonWebPage(title: title,url: url,)));
}

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/cupertino.dart';

//加载网页的一个公用界面
class CommonWebPage extends StatefulWidget {
  String title;
  String url;

  CommonWebPage({Key key, this.title, this.url})
      : assert(title != null),
        assert(url != null),
        super(key: key);

  @override
  _CommonWebPageState createState() => _CommonWebPageState();
}

class _CommonWebPageState extends State<CommonWebPage> {
  //初始化一个加载Web的插件
  FlutterWebviewPlugin _plugin = FlutterWebviewPlugin();

  bool _isLoading =true;

  @override
  void initState() {
    super.initState();
    _plugin.onStateChanged.listen((state){
      if(state.type ==WebViewState.startLoad){
        if(mounted){
          setState(() {
            _isLoading =true;
          });
        }
      }else if(state.type ==WebViewState.finishLoad){
        if(mounted){
          setState(() {
            _isLoading =false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titles = [Text(widget.title)];
    if(_isLoading){
      titles.add(SizedBox(width: 10,));
      titles.add(CupertinoActivityIndicator());
    }
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Row(
          children: titles,
        ),
      ),
      withZoom: true,
      withJavascript: true,
      withLocalStorage: true,
    );
  }
}

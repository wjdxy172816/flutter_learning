import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:osc_proctice/resources/colors/about_networks.dart';
import 'package:osc_proctice/utils/net_utils.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //用于监听url发生改变,这个插件用于加载一个页面,当页面的url发生改变时,会触发该回调.
  //而具体加载实际上还是转化为Android的WebView内核.
  FlutterWebviewPlugin _plugin = FlutterWebviewPlugin();

  bool isLoading =true;
  @override
  void initState() {
    super.initState();
    //当页面加载的URL发生改变时,会回调设置的监听
    _plugin.onUrlChanged.listen((url) {
      //https://www.oschina.net/action/oauth2/authorize?response_type=code&client_id=UZoPfULsmfTShwzRvOY3&redirect_uri=https://www.baidu.com
      print("url changed:$url");
      if(mounted){//视图尚且存在于视图上之上
        setState(() {
          isLoading =false;
        });
      }
      String tag ="?code=";
      if(url.contains(tag)){
        //print("find code!!!");
        String code =url.substring(url.indexOf(tag)+tag.length,url.length);
        print(code);
        Map<String, dynamic> params = Map<String, dynamic>();
        params['client_id'] = NetEvnParams.CLINET_ID;
        params['client_secret'] = NetEvnParams.PRI_KEY;
        params['grant_type'] = 'authorization_code';
        params['redirect_uri'] = NetEvnParams.REDIRECT_URI;
        params['code'] = '$code';
        params['dataType'] = 'json';
        NetUtils.get(NetUrl.AUTH_TOKEN, params).then((result){
          //print("result is $result");
          //{"access_token":"980e26a2-81e6-45d5-824b-abdb61d9df60","refresh_token":"de4bab6a-72f7-4680-b289-fb1e18a53ed8","uid":3304814,"token_type":"bearer","expires_in":604694}
          Map<String,dynamic> mapResult =json.decode(result);
          Future<SharedPreferences> future = SharedPreferences.getInstance();
          mapResult.forEach((key,value){
            future.then((sp){
              print("save data==> $key=$value");
              if(value is String){
                sp.setString(key, value);
              }else if(value is int){
                sp.setInt(key, value);
              }else if(value is bool){
                sp.setBool(key, value);
              }else if(value is double){
                sp.setDouble(key, value);
              }
            });
          });
        });
        /*Function f =(data) async{
          SharedPreferences sp =await SharedPreferences.getInstance();
          if(data is String){
            sp.setString("key", data);
          }else if(data is bool){
            sp.setBool("bool", data);
          }else if(data is int){
            sp.setInt("bool", data);
          }
        };
        f("abc");*/
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    //response_type=code&client_id=s6BhdRkqt3&state=xyz&redirect_uri=https
    return WebviewScaffold(
        url: NetUrl.AUTH_LOGIN +
            "?response_type=code&client_id=${NetEvnParams.CLINET_ID}" +
            "&redirect_uri=${NetEvnParams.REDIRECT_URI}",

      withJavascript: true,//允许运行JS脚本
      withLocalStorage: true,//允许本地存储
      withZoom: true,//允许网页缩放
    );
  }

  @override
  void dispose() {
    _plugin.close();
    super.dispose();
  }
}

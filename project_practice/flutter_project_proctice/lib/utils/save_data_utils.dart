

import 'package:osc_proctice/resources/constant/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

//使用SP保存数据
class SpSaveDataUtil{

  //保存一个map
  static Future<SharedPreferences> saveMap(Map<String,dynamic> data){
    if(data!=null&&data.isNotEmpty){
      Future<SharedPreferences> future = SharedPreferences.getInstance();
      data.forEach((key,value){
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
      return future;
    }
  }

  //清除登录状态
  static LoginInfo(){
    Future<SharedPreferences> future = SharedPreferences.getInstance();
    future.then((sp){
      sp.setString(UserLoginInfoKey.ACCESS_TOKEN, "");
      sp.setString(UserLoginInfoKey.REFRESH_TOKEN, "");
      sp.setInt(UserLoginInfoKey.UID, -1);
      sp.setString(UserLoginInfoKey.TOKEN_TYPE, "");
      sp.setInt(UserLoginInfoKey.EXPIRES_IN, -1);
      sp.setBool(UserLoginInfoKey.IS_LOGIN, false);
    });
  }

  //判断是否登录
  static Future<bool> isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin =sp.getBool(UserLoginInfoKey.IS_LOGIN);
    return isLogin==null?false:isLogin;
  }

  //获取accessToken
  static Future<String> getAccessToken() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(UserLoginInfoKey.ACCESS_TOKEN);
  }

  //保存获取的个人信息
  static saveUserInfo(Map<String,dynamic> userinfo){
    saveMap(userinfo);
  }

  //获取用户的个人信息
  static Future<Map<String,dynamic>> getUserInfo() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String,dynamic> userInfo =Map();
    userInfo[UserInfoKey.NAME] =sp.getString(UserInfoKey.NAME);
    userInfo[UserInfoKey.AVATAR] =sp.getString(UserInfoKey.AVATAR);
    userInfo[UserInfoKey.GENDER] =sp.getString(UserInfoKey.GENDER);
    userInfo[UserInfoKey.LOCATION] =sp.getString(UserInfoKey.LOCATION);
    userInfo[UserInfoKey.ID] =sp.getInt(UserInfoKey.ID);
    userInfo[UserInfoKey.EMAIL] =sp.getString(UserInfoKey.EMAIL);
    userInfo[UserInfoKey.URL] =sp.getString(UserInfoKey.URL);
    return userInfo;
  }
}
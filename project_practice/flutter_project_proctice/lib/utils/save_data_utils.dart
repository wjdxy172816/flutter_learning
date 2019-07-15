

import 'package:osc_proctice/beans/user_about_beans.dart' show UserAccount;
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
  static UserAccount saveUserInfo(Map<String,dynamic> userinfo,{bool isLogin =false}){

    String name =userinfo[UserInfoKey.NAME];
    String avater =userinfo[UserInfoKey.AVATAR];
    String gender =userinfo[UserInfoKey.GENDER];
    String location =userinfo[UserInfoKey.LOCATION];
    int id =userinfo[UserInfoKey.ID];
    String email =userinfo[UserInfoKey.EMAIL];
    String url =userinfo[UserInfoKey.URL];

    Future<SharedPreferences> future = SharedPreferences.getInstance();
    future.then((sp){
      sp.setString(UserInfoKey.NAME, name);
      sp.setString(UserInfoKey.AVATAR, avater);
      sp.setString(UserInfoKey.GENDER, gender);
      sp.setString(UserInfoKey.LOCATION, location);
      sp.setInt(UserInfoKey.ID, id);
      sp.setString(UserInfoKey.EMAIL, email);
      sp.setString(UserInfoKey.URL, url);
      sp.setBool(UserLoginInfoKey.IS_LOGIN, isLogin);
    });
    UserAccount account =UserAccount(gender: gender,name: name,location: location,
    id: id,avatar: avater,email:email,url: url);

    return account;
  }

  //获取用户的个人信息
  static Future<UserAccount> getUserAccount() async{

    SharedPreferences sp = await SharedPreferences.getInstance();

    String name =sp.getString(UserInfoKey.NAME);
    String avater =sp.getString(UserInfoKey.AVATAR);
    String gender =sp.getString(UserInfoKey.GENDER);
    String location =sp.getString(UserInfoKey.LOCATION);
    int id =sp.getInt(UserInfoKey.ID);
    String email =sp.getString(UserInfoKey.EMAIL);
    String url =sp.getString(UserInfoKey.URL);
    UserAccount account =UserAccount(gender: gender,name: name,location: location,
        id: id,avatar: avater,email:email,url: url);
    return account;
  }
}
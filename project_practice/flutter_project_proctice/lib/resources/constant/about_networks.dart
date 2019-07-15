
/**
 * 网络请求地址集合
 * */
abstract class NetUrl{

  //OpenAPI 授权登录页面
  static const String AUTH_LOGIN=NetEvnParams.API_HOST+"/action/oauth2/authorize";

  //获取 AccessToken
  static const String AUTH_TOKEN ="/action/openapi/token";

  //账户信息
  static const String USER_ACCOUNT ="/action/openapi/user";

  //用户信息
  static const String USER_INFO ="/action/openapi/user_information";

  //用户信息详情
  static const String USER_INFO_DETAIL ="/action/openapi/my_information";

}

abstract class NetEvnParams{
  //主机地址
  static const String API_HOST ="https://www.oschina.net";
  //分配的APPID
  static const String CLINET_ID ="UZoPfULsmfTShwzRvOY3";
  //私钥
  static const String PRI_KEY ="5CFWsNl585U8nOLCVuLKd4iMKdNG52rJ";
  //回调网址,注意不要写什么百度的门户网站这些奇葩的地址,否则的话第二次回调会出现异常,不给返回正常的code
  static const String REDIRECT_URI ="https://my.oschina.net/u/3304814/admin/inbox";

}
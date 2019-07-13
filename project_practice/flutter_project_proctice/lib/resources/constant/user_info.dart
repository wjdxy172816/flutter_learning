

abstract class UserLoginInfoKey{

  //用户个人登录的一些信息
  //OAuth2.0请求token
  static const String ACCESS_TOKEN ="access_token";
  //刷新token
  static const String REFRESH_TOKEN ="refresh_token";
  //用户UID
  static const String UID ="uid";
  //token的形式
  static const String TOKEN_TYPE ="token_type";
  //过期时间
  static const String EXPIRES_IN ="expires_in";
  //是否已经登录
  static const String IS_LOGIN ="is_login";
}

abstract class UserInfoKey{
  //性别
  static const String GENDER ="gender";
  //姓名
  static const String NAME ="name";
  //地址
  static const String LOCATION ="location";
  //id
  static const String ID ="id";
  //头像
  static const String AVATAR ="avatar";
  //邮箱
  static const String EMAIL ="email";
  //个人主页
  static const String URL ="";
}

import 'package:http/http.dart' as http;
import 'package:osc_proctice/resources/constant/about_networks.dart';//引用网络库

class NetUtils{

  //因为不知道具体的参数类型,所以Map为dynamic类型.
  static Future<String> get(String url,Map<String,dynamic> params) async{
    if(url!=null){
      StringBuffer sb =new StringBuffer("?");
      params?.forEach((key,value){
        sb.write("$key=$value&");
      });
      String requestPath =NetEvnParams.API_HOST+url+""+sb.toString().substring(0,sb.length-1);
      print("request url =$requestPath");
      http.Response  response =await http.get(requestPath);
      return response.body;
    }
  }

  static Future<String> post(String url,Map<String,dynamic> params) async{
    if(url!=null){
      url =NetEvnParams.API_HOST+url;
      http.Response  response =await http.post(url,body: params);
      return response.body;
    }
  }
}
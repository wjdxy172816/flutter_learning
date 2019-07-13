
import 'package:event_bus/event_bus.dart';

//声明一个全局变量,单例
EventBus bus =EventBus();

//登录事件
class LoginInEvent{}
//登出事件
class LoginOutEvent{}
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:vibration/vibration.dart';

class SensorsPage extends StatefulWidget {
  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  StreamSubscription subscription;
  static const int SHAKE_TIMEOUT = 500;
  static const double SHAKE_THRESHOLD = 3.25;
  bool isShaked = false;
  var _lastTime = 0;
  @override
  void initState() {
    super.initState();
    subscription = accelerometerEvents.listen((event){
      var now = DateTime.now().millisecondsSinceEpoch;
      if ((now - _lastTime) > SHAKE_TIMEOUT) {
        var x = event.x;
        var y = event.y;
        var z = event.z;
        double acce = sqrt(x * x + y * y + z * z) - 9.8; //g
        if (acce > SHAKE_THRESHOLD) {
          print('摇一摇');
          //手机晃动了
          Vibration.vibrate();
          _lastTime = now;
          if (!mounted) return;
          setState(() {
            isShaked = true;
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("摇一摇"),
      ),
      body: Center(
        child: Container(
          child: Text("摇一摇吧"),
        ),
      ),
    );
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}


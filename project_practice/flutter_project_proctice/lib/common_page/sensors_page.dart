import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class SensorsPage extends StatefulWidget {
  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
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
}


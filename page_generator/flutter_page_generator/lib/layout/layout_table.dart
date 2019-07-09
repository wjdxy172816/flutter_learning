import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: buildTable(),
        ),
      ),
    );
  }

  Table buildTable() {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(30.0),
        1: FixedColumnWidth(30.0),
        3: FixedColumnWidth(30.0),
        4: FixedColumnWidth(30.0),
      },
      border: TableBorder.all(color: Color(0xffff0000), width: 2.0),
      children: generatorChildren(),
    );
  }

  generatorChildren(){
    List<TableRow> lists =[
      TableRow(
        children: [
          Text("头像"),
          Text("姓名"),
          Text("年龄"),
          Text("职称"),
        ]
      ),
      TableRow(
          children: [
            Icon(Icons.person),
            Text("拉克丝"),
            Text("19"),
            Text("光之魔法师"),
          ]
      ),
      TableRow(
          children: [
            Icon(Icons.person),
            Text("凯特琳"),
            Text("21"),
            Text("女狙击手"),
          ]
      ),
      TableRow(
          children: [
            Icon(Icons.person),
            Text("璐璐"),
            Text("999"),
            Text("女巫"),
          ]
      ),
    ];

    return lists;
  }
}

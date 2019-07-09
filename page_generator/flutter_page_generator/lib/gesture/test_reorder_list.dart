

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
/**
 * 可拖拽item的ListView
 * */
class _HomePageState extends State<HomePage> {
  List<String> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖拽实现"),
      ),
      body: ReorderableListView(
          children: list.map((item) {
            return ListTile(
              key:ObjectKey(item),//这儿需要为item指定一个key,否则的话会报错
              title: Text(item),
            );
          }).toList(),
          onReorder: _reorder),
    );
  }

  _reorder(oldIndex, newIndex) {
    setState(() {
      if(newIndex==list.length){//当拖拽到最尾部时,要考虑下标越界的处理
        newIndex--;
      }
      var item =list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }

  @override
  void initState() {
    super.initState();
    list = List.generate(8, (index) {
      return "refresh item is $index";
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

//库的别名,用于依赖使用.
library flutter_package;

import 'package:flutter/material.dart';

//定义一个方法,别名定义为OnClick
typedef OnClick = void Function(bool isAvatorNull);

/// A Calculator.
// ignore: must_be_immutable
class AvatorView extends StatefulWidget {
  //头像宽高
  double size;

  //头像url
  String avatorUrl;

  //用户昵称
  String userName;

  //边框宽度
  double borderWidth;

  //边框颜色
  int borderColor;

  //字体大小
  double fontSize;

  //字体颜色
  int fontColor;

  double avatorNameMargin;

  //接收自定义的方法
  OnClick onClick;

  AvatorView(
      {Key key,
      this.size = 60,
      this.avatorUrl,
      this.userName,
      this.borderWidth = 1,
      this.fontSize = 14.0,
      this.avatorNameMargin = 20,
      this.borderColor = 0xff00ff00,
      this.fontColor = 0xff00ffff,
      this.onClick})
      : assert(size > 0),
        assert(avatorUrl != null),
        assert(fontSize > 0),
        assert(borderWidth > 0),
        super(key: key);

  @override
  _AvatorViewState createState() => _AvatorViewState();
}

class _AvatorViewState extends State<AvatorView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getAvatorView(),
          SizedBox(
            height: widget.avatorNameMargin,
          ),
          Text(widget.userName == null ? "名字不能为空" : widget.userName,
          style: TextStyle(color: Color(widget.fontColor),fontSize: widget.fontSize),
          ),
        ],
      ),
    );
  }

  Widget _getAvatorView() {
    return GestureDetector(
      child: widget.avatorUrl == null
          ? Image.asset(
              "assert/ic_avatar_default.png",
              width: widget.size,
              height: widget.size,
            )
          : Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Color(widget.borderColor),
                    width: widget.borderWidth),
                image: DecorationImage(
                    image: NetworkImage(widget.avatorUrl), fit: BoxFit.fill),
              ),
            ),
      onTap: () {
        widget.onClick(widget.avatorUrl != null);
      },
    );
  }
}

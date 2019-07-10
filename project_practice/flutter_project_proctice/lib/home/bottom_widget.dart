import 'package:flutter/material.dart';

class ButtomWidgetBean {
  final String indicatorName;

  final String indicatorImg;

  final String indicatorImgSel;

  final BottomNavigationBarItem item;

  //注意这种写法
  ButtomWidgetBean({
      @required this.indicatorName,
      @required this.indicatorImg,
      @required this.indicatorImgSel
    })
      : item = BottomNavigationBarItem(
            icon: Image.asset(
              indicatorImg,
              width: 25.0,
              height: 25.0,
            ),
            activeIcon: Image.asset(
              indicatorImgSel,
              width: 25.0,
              height: 25.0,
            ),
            title: Text(indicatorName)),
        assert(indicatorName != null),
        assert(indicatorImg != null),
        assert(indicatorImgSel != null);
}

/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2020-11-19 19:09:41
 */

import 'package:flutter/material.dart';
import 'package:gleam/src/utils.dart';

/// 单元格分组
///
///
///

class CellGroup extends StatelessWidget {
  //分组标题
  final dynamic title;

  //是否显示外边框
  final bool border;

  //子元素
  final Widget child;

  const CellGroup({Key key, this.title, this.border, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderSide _borderSide = BorderSide(width: 0.5, color: Colors.blue);

    Widget _title = dynamicText(title);

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: _borderSide,
          bottom: _borderSide,
        ),
      ),
      child: child,
    );
  }
}

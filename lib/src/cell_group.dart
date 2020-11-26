/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-19 19:09:41
 */

import 'package:flutter/material.dart';
import 'package:gleam/src/utils.dart';

/// 单元格分组
///
class CellGroup extends StatelessWidget {
  // //分组标题
  final dynamic title;

  // //分组标题文字样式(标题是文字时)
  final TextStyle titleStyle;

  // //分组标题内边距
  final EdgeInsetsGeometry titlePadding;

  //是否显示外边框
  final bool border;

  //分组子元素内边距
  final EdgeInsetsGeometry padding;

  //子元素
  final List<Widget> children;

  //背景色
  final Color backgroundColor;

  const CellGroup({
    Key key,
    this.title,
    this.titleStyle = const TextStyle(
      fontSize: 14.0,
      color: Color(0X66455A64),
    ),
    this.titlePadding = const EdgeInsets.fromLTRB(16.0, 10.0, 0, 16.0),
    this.border = true,
    this.padding,
    this.children,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _title = Container(
      padding: titlePadding,
      child: dynamicText(title, titleStyle),
    );
    Widget _cellList = Container(
      padding: padding,
      // 设置decoration后,会没有水波纹
      // decoration: BoxDecoration(
      //     color: backgroundColor ?? Colors.transparent,
      //     border: border
      //         ? Border(
      //             top: _borderSide,
      //             bottom: _borderSide,
      //           )
      //         : null),
      child: Column(
        children: children,
      ),
    );

    Widget cellGroup = _cellList;
    if (title != null) {
      cellGroup = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title,
          _cellList,
        ],
      );
    }
    return cellGroup;
  }
}

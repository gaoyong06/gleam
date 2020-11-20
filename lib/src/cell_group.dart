/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2020-11-19 19:09:41
 */

import 'package:flutter/material.dart';
import 'package:gleam/src/utils.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';

/// 单元格分组
///
///
///
///
class CellGroup extends StatelessWidget {
  // //分组标题
  // final dynamic title;

  // //分组标题文字样式(标题是文字时)
  // final TextStyle titleStyle;

  // //分组标题内边距
  // final EdgeInsetsGeometry titlePadding;

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
    // this.title,
    // this.titleStyle,
    // this.titlePadding = const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
    this.border = true,
    this.padding,
    this.children,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderSide _borderSide = BorderSide(width: 0.5, color: Colors.blue);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          border: border
              ? Border(
                  top: _borderSide,
                  bottom: _borderSide,
                )
              : null),
      child: Column(
        children: children,
      ),
    );
  }
}

/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-19 17:21:25
 */

import 'package:flutter/material.dart';
import 'package:gleam/src/utils.dart';
import 'package:string_validator/string_validator.dart';

/// Cell单元格
///
//单元格大小
enum CellSize {
  large, //大号单元格
  small, //小号单元格(默认)
}

//右侧箭头方向
enum CellArrowDirection {
  up, //箭头向上
  down, //箭头向下
  left, //箭头向左
  right, //箭头向右
}

class Cell extends StatelessWidget {
  //左侧标题
  final dynamic title;

  //左侧标题样式(左侧标题是文字时生效)
  final TextStyle titleStyle;

  //右侧内容
  final dynamic value;

  //右侧内容样式(右侧内容是文字时生效)
  final TextStyle valueStyle;

  //标题下方的描述信息
  final dynamic label;

  //标题下方的描述信息样式(标题下方的描述信息是文字时生效)
  final TextStyle labelStyle;

  //单元格大小
  final CellSize size;

  //左侧图标
  final Widget icon;

  //点击后跳转的链接地址
  final String url;

  //点击后跳转的目标路由对象
  final String to;

  //是否显示内边框
  final bool border;

  //是否在跳转时替换当前页面历史
  final bool replace;

  //是否开启点击反馈
  final bool clickable;

  //是否展示右侧箭头并开启点击反馈
  final bool isLink;

  //是否显示表单必填星号
  final bool required;

  //是否使内容垂直居中
  final bool center;

  //右侧箭头方向8
  final CellArrowDirection arrowDirection;

  //内边距
  final EdgeInsetsGeometry padding;

  //单元格底部分割线
  final BorderSide divider;

  const Cell({
    Key key,
    this.title,
    this.titleStyle = const TextStyle(color: Color(0XFF323233), fontSize: 14.0),
    this.value,
    this.valueStyle = const TextStyle(
      color: Color(0XFF969799),
      fontSize: 14.0,
    ),
    this.label,
    this.labelStyle = const TextStyle(
      color: Color(0XFF969799),
      fontSize: 12.0,
    ),
    this.size = CellSize.small,
    this.icon,
    this.url,
    this.to,
    this.border = true,
    this.replace = false,
    this.clickable = false,
    this.isLink = false,
    this.required = false,
    this.center = false,
    this.arrowDirection = CellArrowDirection.right,
    // this.padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    this.padding = const EdgeInsets.all(0),
    this.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _title;
    Widget _value;
    Widget _label;

    //如果只设置value, 在value展示在title的位置且使用title的样式
    if (title == null && value != null && label == null) {
      _title = dynamicText(value, titleStyle);
      _value = null;
      _label = null;
    } else {
      _title = dynamicText(title, titleStyle);
      _value = dynamicText(value, valueStyle);
      _label = dynamicText(label, labelStyle);
    }

    _title = Row(
      children: [
        Offstage(
          offstage: icon != null ? false : true,
          child: icon,
        ),
        Text(
          '单元格',
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0XFF323233),
          ),
        )
      ],
    );

    if (icon != null) {
      _title = Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 18,
            color: Color(0XFF323233),
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            '单元格',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0XFF323233),
            ),
          )
        ],
      );
    }

    Decoration _decoration = BoxDecoration(
      border: Border(
        bottom: divider ??
            Divider.createBorderSide(context,
                color: Color(0XFFEBEDF0), width: 1.0),
      ),
    );

    Widget _tile = ListTile(
      contentPadding: padding,
      title: _title,
      trailing: _value,
      subtitle: _label,
      tileColor: Colors.white,
      // isThreeLine: isNull(label) ? false : true,
    );

    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: _decoration,
      child: _tile,
    );
  }
}

/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-04 13:36:23
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-04 13:36:23
 */
import 'package:flutter/material.dart';

///
/// 标签
/// 简单支持 纯文字 及图标+文字
///
///
///文字水平
const horizontal = 6;
const vertical = 2;
const width = 0.5;

class Tag extends StatelessWidget {
  //是否为空心样式
  final bool plain;

  //背景色
  final Color bgColor;

  //文字颜色
  final Color textColor;

  //文字
  final String text;

  //文字大小
  final double fontSize;

  //是否为圆角样式
  final bool round;

  //圆角弧度
  final double radius;

  //左边图标
  final Widget leftIcon;

  //边框颜色
  final Color borderColor;

  //内部padding
  final EdgeInsetsGeometry padding;

  Tag({
    Key key,
    this.plain = false,
    this.bgColor = const Color(0xFFF4F5F7),
    this.textColor = const Color(0xFF999999),
    this.text = "",
    this.fontSize = 11,
    this.round = false,
    this.radius = 2,
    this.leftIcon,
    this.borderColor = Colors.transparent,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text?.isEmpty ?? true) return Container();
    var _text = Text(
      text,
      style: TextStyle(color: textColor, fontSize: fontSize),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    var _child = leftIcon == null
        ? _text
        : Row(
            children: [leftIcon, SizedBox(width: 3), _text],
          );
    return Container(
      constraints: BoxConstraints(minWidth: 20),
      decoration: BoxDecoration(
        color: plain ? bgColor : null,
        borderRadius: round
            ? BorderRadius.all(Radius.circular(radius))
            : BorderRadius.all(Radius.circular(0)),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      padding: padding,
      child: Center(child: _child),
    );
  }
}

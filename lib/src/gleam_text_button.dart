/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */

///
/// 简单的文字按钮
///  onTap==null 不可用
///
import 'package:flutter/material.dart';

class GleamTextButton extends StatelessWidget {
  //文字
  final String text;

  //颜色
  final Color color;

  //不可用颜色
  final Color disableColor;

  //大小
  final double fontSize;

  //内边距
  final EdgeInsetsGeometry padding;

  //外边距
  final EdgeInsetsGeometry margin;

  //宽度
  final double width;

  final VoidCallback onTap;

  GleamTextButton(this.text, this.onTap,
      {this.color = const Color(0xFF5791F3),
      this.disableColor = const Color(0xFFD8D8D8),
      this.fontSize,
      this.padding,
      this.margin,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding,
        margin: margin,
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontSize ?? 15.0,
              color: onTap == null ? disableColor : color),
        ),
      ),
    );
  }
}

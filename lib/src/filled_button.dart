/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// 内容填充按钮
///
class FilledButton extends StatelessWidget {
  //按钮宽度
  final double width;

  //按钮高度
  final double height;

  //文字大小
  final double fontSize;

  //圆角弧度
  final double borderRadius;

  //点击回调
  final VoidCallback onPressed;

  //文本内容
  final String text;

  //外边距
  final EdgeInsetsGeometry margin;

  //文字颜色
  final Color textColor;

  //填充颜色
  final Color fillColor;

  //不可点击颜色
  final Color disableColor;

  //不可点击文字颜色
  final Color disableTextColor;

  //文字左边图标
  final Widget leftIcon;

  //是否显示阴影
  final bool showShadow;

  const FilledButton({
    @required this.text,
    this.width,
    this.height,
    this.fontSize = 15,
    this.textColor = Colors.white,
    @required this.onPressed,
    this.margin,
    this.showShadow = true,
    this.borderRadius = 25,
    this.fillColor = const Color(0xFF5791F3),
    this.disableColor = const Color(0xFFD8D8D8),
    this.disableTextColor = Colors.white,
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? ScreenUtil().setWidth(335),
      height: height ?? ScreenUtil().setWidth(44),
      margin: margin,
      decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: showShadow && onPressed != null
              ? [
                  BoxShadow(
                    color: const Color(0x7D80AEFF),
                    offset: Offset(0.0, 5),
                    blurRadius: 20.0,
                    spreadRadius: 0.0,
                  )
                ]
              : []),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        onPressed: onPressed,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          leftIcon ?? Container(),
          SizedBox(width: leftIcon == null ? 0 : 5),
          Text(text ?? "",
              style: TextStyle(
                  fontSize: fontSize, fontWeight: FontWeight.w600, height: 1))
        ]),
        textColor: textColor,
        disabledTextColor: disableTextColor,
        color: Colors.transparent,
        disabledColor: disableColor,
      ),
    );
  }
}

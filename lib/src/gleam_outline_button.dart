/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///边框轮廓未填充按钮
///
class GleamOutlineButton extends StatelessWidget {
  //按钮宽度
  final double width;

  //按钮高度
  final double height;

  //文字大小
  final double fontSize;

  //圆角大小
  final double borderRadius;

  //点击回调
  final VoidCallback onPressed;

  //文字
  final String text;

  //填充颜色
  final Color color;

  //边框颜色
  final Color borderColor;

  //文字颜色
  final Color textColor;

  //边距
  final EdgeInsetsGeometry margin;

  //不可点击颜色
  final Color disableColor;

  //不可点击文字颜色
  final Color disableTextColor;

  //文字左边图标
  final Widget leftIcon;

  GleamOutlineButton({
    @required this.text,
    this.width,
    this.height,
    this.fontSize = 15,
    this.color = Colors.white,
    this.borderColor = const Color(0xff5791F3),
    this.borderRadius = 25,
    this.textColor = const Color(0xff5791F3),
    @required this.onPressed,
    this.margin,
    this.disableColor = const Color(0xffC0C4CC),
    this.disableTextColor = const Color(0xffC0C4CC),
    this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? ScreenUtil().setWidth(335),
      height: height ?? ScreenUtil().setWidth(44),
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: OutlineButton(
        borderSide: BorderSide(color: borderColor, width: 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        textColor: textColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leftIcon ?? Container(),
            SizedBox(width: leftIcon == null ? 0 : 5),
            Text(text ?? "",
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    height: 1)),
          ],
        ),
        onPressed: onPressed,
        highlightedBorderColor: color,
        disabledBorderColor: disableColor,
        disabledTextColor: disableTextColor,
      ),
    );
  }
}

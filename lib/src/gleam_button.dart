/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gleam/style/app_colors.dart';

///
/// 按钮
enum GleamButtonStyle {
  flatButton, //内容填充按钮
  outlineButton, //细边框按钮
  textButton, //文字按钮
}

/// 按钮类型
enum ButtonType {
  primary, //主要按钮
  info, //信息按钮
  defaulted, //默认按钮
  warning, //警告按钮
  danger //危险按钮
}

/// 按钮尺寸
enum ButtonSize {
  large, //大号按钮
  normal, //普通按钮
  small, //默认按钮
  mini, //迷你按钮
}

///默认填充颜色
Color defaultFillColor = const Color(0xff07c160);

///默认填充颜色
double defaultFontSize = 14.0;

///默认边框颜色
Color defaultBorderColor = Colors.transparent;

///默认字体颜色
Color defaultTextColor = Colors.white;

///默认按钮内边距
EdgeInsetsGeometry defaultPadding = EdgeInsets.symmetric(horizontal: 15.0);

class GleamButton extends StatelessWidget {
  //按钮风格
  final GleamButtonStyle style;

  //按钮类型
  final ButtonType type;

  //按钮尺寸
  final ButtonSize size;

  //按钮宽度
  final double width;

  //按钮高度
  final double height;

  //内边距
  final EdgeInsetsGeometry padding;

  //文字大小
  final double fontSize;

  //圆角弧度
  final double borderRadius;

  //边框颜色
  final Color borderColor;

  //点击回调
  final VoidCallback onPressed;

  //文本内容
  final String text;

  //外边距
  final EdgeInsetsGeometry margin;

  //文字颜色
  final Color textColor;

  //字重
  final FontWeight fontWeight;

  //填充颜色
  final Color fillColor;

  //不可点击颜色
  final Color disableColor;

  //不可点击文字颜色
  final Color disableTextColor;

  //点击时背景颜色
  final Color highlightColor;

  //点击时水波纹颜色
  final Color splashColor;

  //文字左边图标
  final Widget leftIcon;

  //是否显示阴影
  final bool showShadow;

  //阴影颜色
  final Color shadowColor;

  //容器装饰
  final Decoration decoration;

  const GleamButton(
      {this.style = GleamButtonStyle.flatButton,
      this.type,
      this.size,
      this.text,
      this.width,
      this.height,
      this.padding,
      this.fontSize,
      this.textColor,
      this.fontWeight = FontWeight.normal,
      @required this.onPressed,
      this.margin,
      this.showShadow = true,
      this.shadowColor = AppColors.cl7D80AEFF,
      this.borderRadius = 2,
      this.borderColor,
      this.fillColor,
      this.disableColor = const Color(0xFFD8D8D8),
      this.disableTextColor = Colors.white,
      this.highlightColor = Colors.transparent,
      this.splashColor,
      this.leftIcon,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    Color tempFillColor;
    Color tempBorderColor;
    double tempWidth;
    double tempHeight;
    double tempFontSize;
    Color tempTextColor;
    Color tempSplashColor;
    EdgeInsetsGeometry tempPadding;

    if (style == GleamButtonStyle.textButton) {
      tempFillColor = Colors.transparent;
      tempBorderColor = Colors.transparent;
      tempSplashColor = splashColor ?? Colors.transparent;
    }

    switch (type) {
      case ButtonType.primary:
        tempFillColor = AppColors.cl07C160;
        tempBorderColor = tempFillColor;
        tempTextColor = defaultTextColor;
        break;

      case ButtonType.info:
        tempFillColor = AppColors.cl1989FA;
        tempBorderColor = tempFillColor;
        tempTextColor = defaultTextColor;
        break;

      case ButtonType.defaulted:
        tempFillColor = AppColors.clFFFFFF;
        tempBorderColor = AppColors.clEDEDF0;
        tempTextColor = AppColors.cl323233;
        break;

      case ButtonType.warning:
        tempFillColor = AppColors.clFF976A;
        tempBorderColor = tempFillColor;
        tempTextColor = defaultTextColor;
        break;

      case ButtonType.danger:
        tempFillColor = AppColors.clEE0A24;
        tempBorderColor = tempFillColor;
        tempTextColor = defaultTextColor;
        break;

      default:
        tempFillColor = fillColor ?? defaultFillColor;
        tempBorderColor = borderColor ?? tempFillColor ?? defaultBorderColor;
        tempTextColor = textColor ?? tempTextColor ?? defaultTextColor;
    }

    switch (size) {
      case ButtonSize.large:
        tempWidth = 328.0;
        tempHeight = 50.0;
        tempFontSize = 16.0;
        break;

      case ButtonSize.normal:
        tempWidth = 88.0;
        tempHeight = 44.0;
        tempFontSize = 14.0;
        tempPadding = defaultPadding;
        break;

      case ButtonSize.small:
        tempWidth = 66.0;
        tempHeight = 32.0;
        tempFontSize = 12.0;
        tempPadding = EdgeInsets.symmetric(horizontal: 8.0);
        break;

      case ButtonSize.mini:
        tempWidth = 58.0;
        tempHeight = 24.0;
        tempFontSize = 10.0;
        tempPadding = EdgeInsets.symmetric(horizontal: 4.0);
        break;
    }

    //填充按钮
    Widget flatButton = FlatButton(
      padding: padding ?? tempPadding ?? defaultPadding,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? tempBorderColor ?? defaultBorderColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      onPressed: onPressed,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        leftIcon ?? Container(),
        SizedBox(width: leftIcon == null || text == null ? 0 : 5),
        Expanded(
          child: Text(text ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize ?? tempFontSize ?? defaultFontSize,
                  fontWeight: fontWeight,
                  height: 1)),
        ),
      ]),
      textColor: textColor ?? tempTextColor ?? defaultTextColor,
      disabledTextColor: disableTextColor,
      color: fillColor ?? tempFillColor ?? defaultFillColor,
      disabledColor: disableColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
    );

    Widget outlineButton = OutlineButton(
      padding: padding ?? tempPadding ?? defaultPadding,
      borderSide: BorderSide(
          color: borderColor ?? tempBorderColor ?? defaultBorderColor,
          width: 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      onPressed: onPressed,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        leftIcon ?? Container(),
        SizedBox(width: leftIcon == null || text == null ? 0 : 5),
        Expanded(
          child: Text(text ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize ?? tempFontSize ?? defaultFontSize,
                  fontWeight: fontWeight,
                  height: 1)),
        ),
      ]),
      textColor: textColor ?? tempTextColor ?? defaultTextColor,
      disabledTextColor: disableTextColor,
      disabledBorderColor: disableColor,
      highlightedBorderColor:
          borderColor ?? tempBorderColor ?? defaultBorderColor,
      highlightColor: highlightColor,
      splashColor: splashColor ?? tempSplashColor,
    );

    return Container(
      width: width ?? tempWidth ?? ScreenUtil().setWidth(88),
      height: height ?? tempHeight ?? ScreenUtil().setWidth(44),
      margin: margin,
      decoration: decoration,
      child: style == GleamButtonStyle.flatButton ? flatButton : outlineButton,
    );
  }
}

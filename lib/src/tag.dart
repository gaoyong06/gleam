/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-04 13:36:23
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-04 13:36:23
 */
import 'package:flutter/material.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';

///
/// 标签
///  纯文字 ,图标+文字, 图标+文字+删掉图标
///
/// 相关文档
///   https://material.io/components/chips
///
/// RawChip
/// Chip
/// ActionChip
/// ChoiceChip
/// FilterChip
/// InputChip

/// 标签类型
enum TagType {
  primary, //主要标签(默认)
  info, //信息标签
  defaulted, //默认标签
  warning, //警告标签
  danger //危险标签
}

/// 标签尺寸
enum TagSize {
  large, //大号标签
  medium, //中号标签
  small, //小号标签(默认)
}

const double _kDefaultLabelPaddingVerticalHalf = 8.0;

class Tag extends StatelessWidget {
  //标签类型
  final TagType type;

  //标签尺寸
  final TagSize size;

  //是否为空心样式
  final bool plain;

  //背景色
  final Color backgroundColor;

  //文字
  final String text;

  //文字样式
  final TextStyle textStyle;

  //是否为圆角样式
  final bool round;

  //圆角弧度
  final double radius;

  //左边图标
  final Widget avatar;

  //右侧关闭图标
  final Widget deleteIcon;

  //关闭图标回调方法(onDeleted为null时, 右侧关闭图标deleteIcon不显示)
  final Function() onDeleted;

  //边框颜色
  final Color borderColor;

  //内部padding
  final EdgeInsetsGeometry padding;

  //形状
  final ShapeBorder shape;

  Tag({
    Key key,
    this.type = TagType.primary,
    this.size = TagSize.small,
    this.plain = true,
    this.backgroundColor,
    this.text = "",
    this.textStyle,
    this.round = true,
    this.radius = 2,
    this.avatar,
    this.deleteIcon,
    this.onDeleted,
    this.borderColor,
    this.padding,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;
    Color _borderColor;
    switch (type) {
      case TagType.primary:
        _backgroundColor = backgroundColor ?? AppColors.cl07C160;
        _borderColor = _backgroundColor;
        break;

      case TagType.info:
        _backgroundColor = backgroundColor ?? AppColors.cl1989FA;
        _borderColor = _backgroundColor;
        break;

      case TagType.defaulted:
        _backgroundColor = backgroundColor ?? AppColors.clC8C9CC;
        _borderColor = _backgroundColor;
        break;

      case TagType.warning:
        _backgroundColor = backgroundColor ?? AppColors.clFF976A;
        _borderColor = _backgroundColor;
        break;

      case TagType.danger:
        _backgroundColor = backgroundColor ?? AppColors.clEE0A24;
        _borderColor = _backgroundColor;
        break;
      default:
        _backgroundColor = backgroundColor ?? AppColors.clF4F5F7;
        _borderColor = Colors.transparent;
    }

    EdgeInsetsGeometry _padding;
    switch (size) {
      case TagSize.large:
        _padding =
            padding ?? EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0);
        break;

      case TagSize.medium:
        _padding =
            padding ?? EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0);
        break;

      case TagSize.small:
        _padding = padding ?? EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 1.0);
        break;

      default:
        _padding = padding ?? EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 1.0);
    }

    double _labelPaddingVerticalHalf;
    _labelPaddingVerticalHalf = (padding?.vertical ?? _padding.vertical) / 2 -
        _kDefaultLabelPaddingVerticalHalf;

    return Chip(
      padding: _padding,
      avatar: avatar,
      deleteIcon: deleteIcon,
      onDeleted: onDeleted,
      label: Text(
        text,
        style: textStyle ?? Style.normal12ColorFFFFFF,
      ),
      labelPadding: EdgeInsets.fromLTRB(
          0, _labelPaddingVerticalHalf, 0, _labelPaddingVerticalHalf),
      backgroundColor: plain ? _backgroundColor : Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: shape ??
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? _borderColor, width: 0.5),
            borderRadius: round
                ? BorderRadius.all(Radius.circular(radius))
                : BorderRadius.all(Radius.circular(0)),
          ),
    );
  }
}

/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/dimens.dart';
import 'package:gleam/style/style.dart';

///
/// 简单的搜索空间
/// 支持 自定义 背景 圆角 左边搜索icon 右边删除icon
/// 以及常用的输入框功能 如 键盘类型 提交 输入内容回调等
///
///
class Search extends StatefulWidget {
  //输入框控制器
  final TextEditingController controller;

  //背景色
  final Color bgColor;

  //边框颜色
  final Color borderColor;

  //文字
  final String text;

  //文字样式
  final TextStyle textStyle;

  //圆角弧度
  final double radius;

  //输入框内前缀图标
  final Widget prefix;

  //输入框内后缀Widget
  final Widget suffix;

  //输入框外右侧Widget
  final Widget rightWidget;

  //外边距
  final EdgeInsetsGeometry margin;

  //内边距
  final EdgeInsetsGeometry padding;

  //提示文字
  final String hintText;

  //提示文字样式
  final TextStyle hintStyle;

  //高度
  final double height;

  //回调输入内容
  final ValueChanged<String> onChanged;

  //文字对齐方式
  final TextAlign textAlign;

  //键盘上完成动作等
  final TextInputAction textInputAction;

  //键盘上的提交确认
  final ValueChanged<String> onSubmitted;

  //是否自动聚焦
  final bool autoFocus;

  //弹出键盘类型
  final TextInputType keyboardType;

  //焦点
  final FocusNode focusNode;

  //是否禁用搜索框
  final bool disabled;

  Search({
    this.controller,
    this.bgColor = AppColors.clF4F5F7,
    this.text = "",
    this.textStyle,
    this.radius = 3,
    this.prefix,
    this.suffix,
    this.rightWidget,
    this.borderColor = Colors.transparent,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.hintText = "请输入搜索关键字",
    this.hintStyle,
    this.height = 44,
    this.onChanged,
    this.onSubmitted,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autoFocus = false,
    this.keyboardType,
    this.focusNode,
    this.disabled = false,
  });

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller;
  bool _showSuffix = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    _showSuffix = _controller.text.length == 0 ? false : true;

    print("打印调试日志：");
    print("_showSuffix : " + _showSuffix.toString());

    //默认输入框前缀Widget
    Widget _defaultPrefix = Icon(
      Icons.search,
      size: 20.0,
      color: AppColors.clC8C9CC,
    );

    //默认输入框内后缀Widget
    Widget _defaultSuffix = Offstage(
      child: InkWell(
        onTap: () {
          _controller?.text = "";
          setState(() {
            _showSuffix = false;
          });
        },
        child: Icon(
          Icons.cancel,
          size: 20.0,
          color: AppColors.clC8C9CC,
        ),
      ),
      offstage: !_showSuffix,
    );

    return Row(
      children: [
        Expanded(
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              border: Border.all(color: widget.borderColor, width: 0.5),
            ),
            padding: widget.padding,
            margin: widget.margin,
            child: CupertinoTextField(
              enabled: !widget.disabled,
              focusNode: widget.focusNode,
              style: widget.textStyle ??
                  TextStyle(
                      color: AppColors.cl323233, fontSize: Dimens.fontPt14),
              placeholder: widget.hintText,
              placeholderStyle: widget.hintStyle ?? Style.normal14ColorC8C9CC,
              cursorColor: const Color(0xFF333333),
              cursorWidth: 1,
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent)),
              controller: _controller,
              onChanged: (str) {
                setState(() {
                  _showSuffix = str?.isNotEmpty ?? false;
                  print("_showSuffix " + _showSuffix.toString());
                });
                widget.onChanged?.call(str);
              },
              textAlign: widget.textAlign,
              textInputAction: widget.textInputAction,
              onSubmitted: widget.onSubmitted,
              autofocus: widget.autoFocus ?? false,
              keyboardType: widget.keyboardType,
              prefix: widget.prefix ?? _defaultPrefix,
              suffix: widget.suffix ?? _defaultSuffix,
            ),
          ),
        ),
        SizedBox(
          height: widget.height,
          child: widget.rightWidget ?? Container(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}

/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// 简单的搜索空间
/// 支持 自定义 背景 圆角 左边搜索icon 右边删除icon
/// 以及常用的输入框功能 如 键盘类型 提交 输入内容回调等
///
///
class Search extends StatefulWidget {
  //背景色
  final Color bgColor;

  //文字颜色
  final Color textColor;

  //边框颜色
  final Color borderColor;

  //文字
  final String text;

  //文字大小
  final double fontSize;

  //圆角弧度
  final double radius;

  //左边图标
  final Widget leftIcon;

  //右边图标
  final Widget rightIcon;

  //外边距
  final EdgeInsetsGeometry margin;

  //内边距
  final EdgeInsetsGeometry padding;

  //提示文字
  final String hintText;

  //高度
  final double height;

  //回调输入内容
  final ValueChanged<String> onChanged;

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

  Search({
    this.bgColor = const Color(0xFFF4F5F7),
    this.text = "",
    this.textColor = Colors.black,
    this.fontSize = 12,
    this.radius = 3,
    this.leftIcon,
    this.rightIcon = const Icon(Icons.close, size: 20),
    this.borderColor = Colors.transparent,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.hintText,
    this.height = 40,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.autoFocus = false,
    this.keyboardType,
    this.focusNode,
  });

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller;
  bool _showDelete = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        border: Border.all(color: widget.borderColor, width: 0.5),
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Row(
        children: [
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
              child: widget.leftIcon ?? Icon(Icons.search)),
          Expanded(
            child: CupertinoTextField(
              focusNode: widget.focusNode,
              placeholder: widget.hintText ?? "搜索",
              placeholderStyle: TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF999999),
              ),
              cursorColor: const Color(0xFF333333),
              cursorWidth: 1,
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.transparent)),
              controller: _controller,
              onChanged: (str) {
                setState(() {
                  _showDelete = str?.isNotEmpty ?? false;
                });
                widget.onChanged?.call(str);
              },
              textInputAction: widget.textInputAction,
              onSubmitted: widget.onSubmitted,
              autofocus: widget.autoFocus ?? false,
              keyboardType: widget.keyboardType,
            ),
          ),
          SizedBox(width: 10),
          Offstage(
            child: InkWell(
              onTap: () {
                _controller?.text = "";
                setState(() {
                  _showDelete = false;
                });
              },
              child: widget.rightIcon,
            ),
            offstage: !_showDelete,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}

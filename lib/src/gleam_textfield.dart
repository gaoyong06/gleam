/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gleam/style/style.dart';

enum GleamTextFieldType {
  text, //文本
  tel, //手机号
  digit, //数字(支持小数, 允许一个小数点)
  number, //整数(数字是有符号的，允许正号或负号开始)
  textarea, //多行文本 TODO: 暂时未启用
  password, //密码
}

///文本输入框
class GleamTextField extends StatefulWidget {
  final GleamTextFieldType type;
  final double height; // Tile 高度
  final EdgeInsetsGeometry padding; //容器内边距
  final String defaultText; //设置默认文本值,设置自定义 Controller后失效
  final TextStyle textStyle; //输入文本的样式
  final String label; //输入框左侧文本
  final TextStyle labelTextStyle; //输入框左侧文本样式
  final String hintText; //textField占位符
  final TextStyle hintStyle; //textField占位符文字样式
  final Color cursorColor; //光标颜色
  final TextEditingController controller; //TextEditingController
  final int maxLength; //最大输入长度
  final EdgeInsetsGeometry contentPadding; //输入框内边距
  final ValueChanged onSubmitted; //textField onSubmitted回调
  final ValueChanged onChanged; // textField onChanged回调
  final VoidCallback onTap; // textField 点击
  final Widget leftIcon; //左侧图标Widget
  final Widget rightIcon; //右侧图标Widget
  final TextAlign textAlign; // textField 的textAlign
  final bool readonly; //是否只读
  final bool disabled; //是否禁用输入框

  const GleamTextField({
    Key key,
    this.type = GleamTextFieldType.text,
    this.label,
    this.labelTextStyle,
    this.height = 58,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.defaultText,
    this.textStyle,
    this.hintText = '请输入',
    this.hintStyle,
    this.cursorColor,
    this.controller,
    this.maxLength,
    this.contentPadding,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.leftIcon,
    this.rightIcon,
    this.textAlign = TextAlign.start,
    this.readonly = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  _GleamTextFieldState createState() => _GleamTextFieldState();
}

class _GleamTextFieldState extends State<GleamTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller != null) {
      _controller = widget.controller;
    }
    if (widget.defaultText != null) {
      _controller.text = widget.defaultText;
    }

    _controller.value = TextEditingValue(
      text: _controller.text,
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream, offset: _controller.text.length)),
    );

    const EdgeInsets _defaultContentPadding = EdgeInsets.fromLTRB(0, 0, 0, 0);
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsets resolvedContentPadding =
        widget.contentPadding?.resolve(textDirection) ?? _defaultContentPadding;

    TextInputType _keyboardType = TextInputType.text;
    List<TextInputFormatter> _inputFormatters = [];
    bool _obscureText = false;
    switch (widget.type) {
      case GleamTextFieldType.text:
        _keyboardType = TextInputType.text;
        break;

      case GleamTextFieldType.tel:
        _keyboardType = TextInputType.phone;
        _inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11)
        ];
        break;

      case GleamTextFieldType.digit:
        _keyboardType = TextInputType.numberWithOptions(decimal: true);
        _inputFormatters = [
          //下面的正则表达式可以重复输入.
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
          //下面的正则表达式第二次输入. 时原有内容会被清除
          // FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+(\.)?([0-9]+)?$')),
        ];
        break;

      case GleamTextFieldType.number:
        _keyboardType = TextInputType.numberWithOptions(signed: true);
        _inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
        ];
        break;

      case GleamTextFieldType.password:
        _keyboardType = TextInputType.text;
        _obscureText = true;
        break;

      default:
    }

    // left icon
    // if () {
    //   trailing.add(widget.leftIcon);
    // }
    Widget leftIcon = widget.leftIcon != null ? widget.leftIcon : Container();

    // leading
    Widget leading = Text(widget.label,
        overflow: TextOverflow.ellipsis,
        style: widget.labelTextStyle ?? Style.normal15Color999999);

    // trailing
    List<Widget> trailing = List();

    // TextField
    trailing.add(Expanded(
      child: TextField(
        controller: _controller,
        inputFormatters: _inputFormatters,
        keyboardType: _keyboardType,
        maxLength: widget.maxLength,
        onTap: () {
          if (widget.onTap != null) {
            FocusScope.of(context).requestFocus(new FocusNode());
            widget.onTap();
          }
        },
        maxLines: 1,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        autofocus: false,
        obscureText: _obscureText,
        cursorColor: widget.cursorColor,
        readOnly: widget.readonly,
        enabled: !widget.disabled,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          fillColor: Colors.transparent,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? Style.normal15ColorD8D8D8,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          counterText: "",
        ),
        textAlign: widget.textAlign,
        style: widget.textStyle ?? Style.normal15Color333333,
      ),
    ));

    // right icon
    if (widget.rightIcon != null) {
      trailing.add(widget.rightIcon);
    }

    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      minimum: resolvedContentPadding,
      child: Container(
        height: widget.height.w,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                padding: widget.padding,
                child: Row(
                  children: <Widget>[
                    leftIcon,
                    SizedBox(
                      width: 4.0,
                    ),
                    leading,
                    Expanded(
                      child: Row(
                        children: trailing,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

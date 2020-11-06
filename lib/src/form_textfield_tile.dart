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

class FormTextFieldTile extends StatefulWidget {
  const FormTextFieldTile({
    Key key,
    @required this.title,
    this.height = 58,
    this.defControllerText,
    this.placeholder = '请输入',
    this.controller,
    this.maxLength,
    this.keyboardType,
    this.inputFormatter,
    this.contentPadding,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.showRightArrow = false,
    this.rightArrowWidget,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final double height; // Tile 高度
  final String defControllerText; //设置默认文本值,设置自定义 Controller后失效
  final String title; //左侧title
  final String placeholder; //textField占位符
  final TextEditingController controller; //TextEditingController
  final int maxLength; //最大输入长度
  final TextInputType keyboardType; //键盘类型
  final List<TextInputFormatter> inputFormatter; //TextInputFormatter
  final EdgeInsetsGeometry contentPadding; //内边距
  final ValueChanged onSubmitted; //textField onSubmitted回调
  final ValueChanged onChanged; // textField onChanged回调
  final VoidCallback onTap; // textField 点击
  final bool showRightArrow; // 显示箭头
  final Widget rightArrowWidget; //右侧箭头widget
  final TextAlign textAlign; // textField 的textAlign

  @override
  _FormTextFieldTileState createState() => _FormTextFieldTileState();
}

class _FormTextFieldTileState extends State<FormTextFieldTile> {
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
    if (widget.defControllerText != null) {
      _controller.text = widget.defControllerText;
    }

    _controller.value = TextEditingValue(
      text: _controller.text,
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream, offset: _controller.text.length)),
    );

    const EdgeInsets _defaultContentPadding =
        EdgeInsets.symmetric(horizontal: 0.0);
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsets resolvedContentPadding =
        widget.contentPadding?.resolve(textDirection) ?? _defaultContentPadding;

    //leading
    Widget leading = Text(widget.title,
        overflow: TextOverflow.ellipsis, style: Style.ts_999999_15);

    //trailing
    List<Widget> trailing = List();
    // TextField
    trailing.add(Expanded(
      child: TextField(
        controller: _controller,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.keyboardType,
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
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          fillColor: Colors.transparent,
          hintText: widget.placeholder,
          hintStyle: Style.ts_D8D8D8_15,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          filled: true,
          counterText: "",
        ),
        textAlign: widget.textAlign,
        style: Style.ts_333333_15,
      ),
    ));

    // arrow
    if (widget.showRightArrow) {
      trailing.add(widget.rightArrowWidget ?? Icon(Icons.arrow_right));
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
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 14,
                      child: leading,
                    ),
                    Expanded(
                      flex: 53,
                      child: Row(
                        children: trailing,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: 20.w),
                height: 0.5.w,
                color: Color(0xffD8D8D8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

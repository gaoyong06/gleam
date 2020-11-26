/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-02-21 13:30:24 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-05-18 17:20:08
 */

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:gleam/src/utils.dart';
import 'package:gleam/style/dimens.dart';
import 'package:gleam/style/style.dart';
import 'package:string_validator/string_validator.dart';

///弹出框
///
class GleamDialog {
  //提示弹窗
  ///////////////////////////////////////////
  ///                标题                 ///
  ///             描述信息文字              ///
  ///               确定按钮               ///
  ///////////////////////////////////////////

  ///context 上下文
  ///title 标题
  ///description 内容描述
  ///height 按钮高度
  ///color 按钮颜色
  ///isRound 是否是圆角按钮
  ///text1 按钮文字
  ///textStyle1 按钮文字样式
  ///onTap1 按钮点击回调方法
  ///barrierDismissible 是否点击弹出外部消失
  static YYDialog alert(BuildContext context,
      {String title,
      EdgeInsetsGeometry titlePadding,
      TextStyle titleStyle,
      dynamic description,
      EdgeInsetsGeometry descriptionPadding,
      double height,
      Color color,
      bool isRound = false,
      String text1,
      TextStyle textStyle1,
      VoidCallback onTap1,
      bool barrierDismissible}) {
    var yyDialog;
    double screenWidth = MediaQuery.of(context).size.width;

    //描述
    Widget descriptionWidget;
    if (description is String) {
      descriptionWidget = Text(
        description,
        textAlign: TextAlign.center,
        style: Style.normal15Color999999,
      );
    } else if (description is Widget) {
      descriptionWidget = description;
    } else {
      descriptionWidget = Container();
    }

    yyDialog = YYDialog().build(context)
      ..width = screenWidth * 0.8
      ..borderRadius = Dimens.radiusDp10
      ..barrierDismissible = barrierDismissible;

    //标题
    if (!isNull(title)) {
      yyDialog.text(
          padding: titlePadding ?? EdgeInsets.all(16.0),
          alignment: Alignment.center,
          text: title,
          color: titleStyle?.color,
          fontSize: titleStyle?.fontSize,
          fontWeight: titleStyle?.fontWeight,
          fontFamily: titleStyle?.fontFamily);
    }

    //内容描述
    yyDialog.widget(Padding(
        padding: descriptionPadding ?? EdgeInsets.fromLTRB(25.0, 0, 25.0, 20.0),
        child: descriptionWidget))
      ..divider()
      ..widget(
        Padding(
          padding: isRound ? EdgeInsets.all(16.0) : EdgeInsets.all(0),
          child: SizedBox(
            height: height ?? 45.0,
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    color: color ?? Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: isRound
                            ? BorderRadius.circular(25.0)
                            : BorderRadius.zero),
                    height: height ?? 45.0,
                    onPressed: () {
                      if (onTap1 != null) onTap1();
                      yyDialog?.dismiss();
                    },
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                      text1 ?? "确定",
                      style: textStyle1 ?? Style.normal13Color5791F3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      ..show();

    return yyDialog;
  }

  //确认弹窗
  ///////////////////////////////////////////
  ///                标题                  ///
  ///             描述信息文字              ///
  ///         取消按钮      确定按钮         ///
  ///////////////////////////////////////////

  ///context 上下文
  ///title 标题
  ///description 描述
  ///height 按钮高度
  ///text1 左侧按钮文字
  ///textStyle1 左侧按钮样式
  ///onTap1 左侧按钮点击回调方法
  ///withDivider 是否显示左右两个按钮中间的分割线
  ///text2 右侧按钮文字
  ///textStyle2 右侧按钮样式
  ///onTap2 右侧按钮点击回调方法
  ///barrierDismissible 是否点击弹出外部消失
  static YYDialog confirm(
    BuildContext context, {
    String title,
    dynamic description,
    double height,
    String text1,
    TextStyle textStyle1,
    VoidCallback onTap1,
    bool withDivider,
    String text2,
    TextStyle textStyle2,
    VoidCallback onTap2,
    bool barrierDismissible,
  }) {
    var yyDialog;
    double screenWidth = MediaQuery.of(context).size.width;
    var minWidth;
    if (withDivider) {
      minWidth = screenWidth * 0.4 - 0.25;
    } else {
      minWidth = screenWidth * 0.4;
    }

    //描述
    Widget descriptionWidget;
    descriptionWidget = dynamicText(description);

    yyDialog = YYDialog().build(context)
      ..width = screenWidth * 0.8
      ..borderRadius = Dimens.radiusDp10
      ..barrierDismissible = barrierDismissible
      ..text(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        text: title,
        color: Colors.black,
        fontSize: Dimens.fontPt16,
      )
      ..widget(Padding(
          padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 20.0),
          child: descriptionWidget))
      ..divider()
      ..widget(
        SizedBox(
          height: height ?? 45.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(),
                height: height ?? 45.0,
                minWidth: minWidth,
                onPressed: () {
                  if (onTap1 != null) onTap1();
                  yyDialog?.dismiss();
                },
                padding: EdgeInsets.all(0.0),
                child: Text(text1 ?? "取消",
                    style: textStyle1 ?? Style.normal13Color333333),
              ),
              Visibility(
                visible: withDivider,
                child: VerticalDivider(
                  width: 0.5,
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(),
                height: height ?? 45.0,
                minWidth: minWidth,
                onPressed: () {
                  if (onTap2 != null) onTap2();
                  yyDialog?.dismiss();
                },
                padding: EdgeInsets.all(0.0),
                child: Text(
                  text2 ?? "确定",
                  style: textStyle1 ?? Style.normal13Color5791F3,
                ),
              )
            ],
          ),
        ),
      )
      ..show();
    return yyDialog;
  }
}

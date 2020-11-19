/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-02-21 13:30:24 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-05-18 17:20:08
 */

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gleam/src/utils.dart';
import 'package:gleam/style/app_colors.dart';
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
        style: Style.ts_999999_15,
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
                      style: textStyle1 ?? Style.ts_5791F3_13,
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
                    style: textStyle1 ?? Style.ts_333333_13),
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
                  style: textStyle1 ?? Style.ts_5791F3_13,
                ),
              )
            ],
          ),
        ),
      )
      ..show();
    return yyDialog;
  }

  //加载弹窗
  // static YYDialog yyProgressDialogBody() {
  //   return YYDialog().build()
  //     ..barrierColor = Colors.transparent
  //     ..widget(RotatedRefresh(size: ScreenUtil().setWidth(40)))
  //     ..show();
  // }

  ///内容 + 确定/取消弹窗
  static YYDialog YYAlertDialog(BuildContext context,
      {String text,
      String text1,
      String text2,
      VoidCallback onTap1,
      VoidCallback onTap2}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return YYDialog().build(context)
      ..width = screenWidth * 0.75
      ..borderRadius = Dimens.radiusDp10
      ..widget(Padding(
        padding: EdgeInsets.all(25.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: Dimens.fontPt16, height: 1.6),
          ),
        ),
      ))
      ..doubleButton(
        padding: EdgeInsets.only(top: 31.0),
        gravity: Gravity.center,
        text1: text1,
        color1: Colors.black,
        fontSize1: Dimens.fontPt15,
        onTap1: onTap1,
        text2: text2,
        color2: AppColors.cl1989FA,
        fontSize2: Dimens.fontPt15,
        onTap2: onTap2,
      )
      ..show();
  }

  ///标题+内容+确认按钮 弹窗
  ///点击外部不会消失
  static YYDialog YYAlertDialog1(BuildContext context,
      {String title, Widget child, String buttonText, VoidCallback onTap}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return YYDialog().build(context)
      ..width = screenWidth * 0.8
      ..borderRadius = Dimens.radiusDp10
      ..barrierDismissible = false
      ..text(
        padding: EdgeInsets.all(25.0),
        alignment: Alignment.center,
        text: title,
        color: Colors.black,
        fontSize: Dimens.fontPt16,
      )
      ..widget(Padding(
          padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 20.0), child: child))
      ..divider()
      ..widget(FlatButton(
        onPressed: onTap,
        padding: EdgeInsets.all(0.0),
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.cl1989FA,
            fontSize: Dimens.fontPt15,
          ),
        ),
      ))
      ..show();
  }

  static YYDialog yyBottomSheetDialog(Widget widget) {
    if (widget == null) return null;
    return YYDialog().build()
      ..gravity = Gravity.bottom
      ..gravityAnimationEnable = true
      ..backgroundColor = Colors.transparent
      ..widget(widget)
      ..show();
  }

  ///
  /// 固定高度的弹窗
  ///    内容
  ///  取消  确定
  ///
  /// 内容居中 传入widget
  /// 回调事件可选
  /// 默认遮罩可关闭 支持配置
  ///
  ///
  ///
  /// Padding(
  //               padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
  //               child: ParsedText(
  //                 style: Style.ts_333333_16,
  //                 text: "确定删除糜力账号？",//停用
  //                 parse: <MatchText>[
  //                   MatchText(style: Style.ts_5791F3_16, pattern: "删除"),
  //                 ],
  //               ),
  //             )
  static YYDialog yyCenterDialog(Widget widget,
      {bool barrierDismissible = false,
      VoidCallback onCancelTap,
      VoidCallback onConfirmTap}) {
    if (widget == null) return null;
    YYDialog dialog;
    var cancel = Expanded(
      child: InkWell(
        child: Center(child: Text("取消", style: Style.ts_666666_15)),
        onTap: () async {
          dialog?.dismiss();
          onCancelTap?.call();
        },
      ),
    );
    var confirm = Expanded(
      child: InkWell(
        child: Center(child: Text("确定", style: Style.ts_5791F3_15)),
        onTap: () {
          dialog?.dismiss();
          onConfirmTap?.call();
        },
      ),
    );
    dialog = YYDialog().build()
      ..gravity = Gravity.center
      ..backgroundColor = Colors.transparent
      ..widget(Container(
        height: ScreenUtil().setWidth(160),
        width: ScreenUtil().setWidth(280),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                child: Center(child: widget),
              ),
            ),
            Divider(),
            Container(
              height: ScreenUtil().setWidth(50),
              child: Row(
                children: [
                  cancel,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(15)),
                    child: VerticalDivider(),
                  ),
                  confirm,
                ],
              ),
            )
          ],
        ),
      ))
      ..barrierDismissible = barrierDismissible
      ..show();
    return dialog;
  }
}

/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2020-11-Th 07:25:41
 */

import 'package:flutter/material.dart';

/*
 * @description: 将动态的text转成Text Widget
 * @param text 文字或Widget
 * @param style 文字样式
 * @return Widget
 */
Widget dynamicText(dynamic text, [TextStyle style]) {
  Widget textWidget;
  if (text is String) {
    textWidget = Text(
      text,
      style: style,
    );
  } else if (text is Widget) {
    textWidget = text;
  } else {
    textWidget = null;
  }

  return textWidget;
}

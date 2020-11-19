/*
 * @Author: gaoyong06@qq.com 
 * @Date: 2020-11-19 15:43:34 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2020-11-19 16:40:10
 */

import 'package:flutter/material.dart';

/// Cell单元格
///
enum TagSize {
  large, //大号单元格
  small, //小号单元格(默认)
}

// class Cell extends StatelessWidget {
//   //左侧标题
//   final String title;

//   //右侧内容
//   final String value;

//   //标题下方的描述信息
//   final String label;

//   //单元格大小
//   final TagSize size;

//   //左侧图标
//   final Widget icon;

//   //点击后跳转的链接地址
//   final String url;

//   //点击后跳转的目标路由对象
//   final String to;

//   //是否显示内边框
//   final bool border;

//   //是否在跳转时替换当前页面历史
//   final bool replace;

//   //是否开启点击反馈
//   final bool clickable;

//   const Cell({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       child: child,
//     );
//   }
// }

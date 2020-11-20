/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';

//分组标题
class CellGroupTitle extends StatelessWidget {
  //标题
  final String title;

  const CellGroupTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
      child: dynamicText(title, Style.ts_66455A64_14),
    );
  }
}

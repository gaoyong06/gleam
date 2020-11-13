/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';
import 'package:gleam_example/r.dart';
import 'package:oktoast/oktoast.dart';

/// GleamOutlineButtonPage 细边框按钮示例程序
class GleamOutlineButtonPage extends StatefulWidget {
  GleamOutlineButtonPage({Key key}) : super(key: key);

  @override
  _GleamOutlineButtonPageState createState() => _GleamOutlineButtonPageState();
}

class _GleamOutlineButtonPageState extends State<GleamOutlineButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40.0,
          ),
          Text("按钮类型"),
          SizedBox(
            height: 16.0,
          ),
          //主要按钮
          GleamOutlineButton(
            text: '主要按钮',
            width: 88.0,
            // buttonType: ButtonType.primary,
            // buttonSize: ButtonSize.normal,
            onPressed: () {
              showToast('主要按钮');
            },
          ),
        ]),
      ),
    );
  }
}

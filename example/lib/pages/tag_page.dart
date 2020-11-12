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

/// TagPage标签示例程序
class TagPage extends StatefulWidget {
  TagPage({Key key}) : super(key: key);

  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: ListTile.divideTiles(context: context, tiles: [
          //提出弹窗
          ListTile(
              title: Text(
                '提示弹窗',
                style: Style.ts_333333_15,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              onTap: () {
                showToast('确定');
              }),
        ]).toList(),
      ),
    );
  }
}

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

/// EmptyPage空状态示例程序
class EmptyPage extends StatelessWidget {
  const EmptyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Empty 空状态",
          style: Style.bold18ColorFFFFFF,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: [
          SizedBox(
            height: 40.0,
          ),
          Text('基础用法'),
          Empty(
            emptyText: "描述文字",
          ),
          Text('资源图片'),
          Empty(
            imgPath: R.assetsImagesBgEmpty,
            emptyText: "描述文字",
          ),
          Text('网络图片'),
          Empty(
            imgPath: 'https://img.yzcdn.cn/vant/empty-image-error.png',
            emptyText: "描述文字",
          ),
          Text('文件图片'),
          //TODO:下面还有错误
          Empty(
            imgPath:
                File('/DCIM/Screenshots/Screenshot_2020-09-04-18-01-05-38.jpg'),
            emptyText: "描述文字",
          ),

          Text('Uint8List图片'),
          //TODO:下面还有错误
          Empty(
            imgPath:
                File('/DCIM/Screenshots/Screenshot_2020-09-04-18-01-05-38.jpg'),
            emptyText: "描述文字",
          ),

          Text('底部内容'),
          Empty(
            emptyText: "描述文字",
            bottomWidget: GleamButton(
                text: '按钮', width: 80.0, height: 40.0, onPressed: () {}),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}

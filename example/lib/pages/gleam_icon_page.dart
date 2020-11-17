/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';

/// GleamIconPage图标示例程序
class GleamIconPage extends StatefulWidget {
  GleamIconPage({Key key}) : super(key: key);

  @override
  _GleamIconPageState createState() => _GleamIconPageState();
}

class _GleamIconPageState extends State<GleamIconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GleamIcon 图标",
          style: Style.ts_FFFFFF_18_bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Text("基础用法"),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GleamIcon(
                  Icons.chat,
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamIcon(Icons.person)
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("徽标提示"),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GleamIcon(
                  Icons.chat,
                  dot: true,
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamIcon(
                  Icons.chat,
                  badge: "9",
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamIcon(
                  Icons.chat,
                  badge: "99+",
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("图标颜色"),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GleamIcon(
                  Icons.chat,
                  color: Color(0XFF1989FA),
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamIcon(
                  Icons.chat,
                  color: Color(0XFF07C160),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("图标大小"),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GleamIcon(
                  Icons.chat,
                  size: 40.0,
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamIcon(
                  Icons.chat,
                  size: 48.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

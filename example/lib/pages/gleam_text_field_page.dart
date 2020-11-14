/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';

/// GleamTextFieldPage文本输入框示例程序
class GleamTextFieldPage extends StatefulWidget {
  GleamTextFieldPage({Key key}) : super(key: key);

  @override
  _GleamTextFieldPageState createState() => _GleamTextFieldPageState();
}

class _GleamTextFieldPageState extends State<GleamTextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GleamTextField 文本输入框",
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
            GleamTextField(
              label: "文本",
              hintText: "请输入文本",
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("自定义类型"),
            SizedBox(
              height: 16.0,
            ),
            GleamTextField(
              label: "文本",
              hintText: "请输入标题",
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            GleamTextField(
              label: "手机号",
              hintText: "请输入手机号",
              type: GleamTextFieldType.tel,
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            GleamTextField(
              label: "整数",
              hintText: "请输入整数",
              type: GleamTextFieldType.number,
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            GleamTextField(
              label: "数字",
              hintText: "请输入数字(支持小数)",
              type: GleamTextFieldType.digit,
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            GleamTextField(
              label: "密码",
              hintText: "请输入密码",
              type: GleamTextFieldType.password,
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            SizedBox(
              height: 16.0,
            ),
            Text("禁用输入框"),
            SizedBox(
              height: 16.0,
            ),
            GleamTextField(
              label: "文本",
              defaultText: "输入框只读",
              readonly: true,
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            GleamTextField(
              label: "文本",
              hintText: "输入框已禁用",
              disabled: true,
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            SizedBox(
              height: 16.0,
            ),
            Text("显示图标"),
            SizedBox(
              height: 16.0,
            ),
            GleamTextField(
              label: "文本",
              hintText: "显示图标",
              leftIcon: Icon(Icons.mood),
              rightIcon: Icon(Icons.info_outline),
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            GleamTextField(
              label: "文本",
              defaultText: "123",
            ),
            Divider(height: 0.5, color: Color(0xFFebedf0)),
            SizedBox(
              height: 16.0,
            ),
            Text("插入按钮"),
            SizedBox(
              height: 16.0,
            ),
            GleamTextField(
              label: "短信验证码",
              hintText: "请输入短信验证码",
              rightIcon: GleamButton(
                  text: "发送验证码",
                  width: 78.0,
                  height: 32.0,
                  type: ButtonType.primary,
                  size: ButtonSize.small,
                  onPressed: () {}),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("输入框内容对齐"),
            SizedBox(
              height: 16.0,
            ),
            GleamTextField(
              label: "文本",
              hintText: "输入框内容右对齐",
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("显示字数统计"),
            SizedBox(
              height: 16.0,
            ),
            GleamTextField(
              label: "留言",
              hintText: "请输入留言",
            ),
          ],
        ),
      ),
    );
  }
}

/* 
* created by 1129502088@qq.com
* Date 2020/11/25 11:27
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';

class GleamCheckBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GleamCheckBox")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("1:默认样式:"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("2:自定义样式:"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              textStyle: Style.normal15Color5791F3,
              icon: Icon(Icons.check_box_outlined, color: AppColors.cl5791F3),
              activeIcon: Icon(Icons.check_box, color: AppColors.cl5791F3),
              spacing: 20,
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("3:垂直排列:"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              textStyle: Style.normal15Color5791F3,
              icon: Icon(Icons.check_box_outlined, color: AppColors.cl5791F3),
              activeIcon: Icon(Icons.check_box, color: AppColors.cl5791F3),
              direction: Axis.vertical,
              spacing: 10,
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("4:全部不可编辑:"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              spacing: 10,
              enable: false,
            ),
            _buildTitle("5:部分不可编辑:"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二不可编辑", enable: false)],
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("6:限制最大可选数量3个:"),
            GleamCheckBox(
              [
                CheckBean("选项一"),
                CheckBean("选项二"),
                CheckBean("选项三"),
                CheckBean("选项四")
              ],
              direction: Axis.vertical,
              spacing: 10,
              maxCheckCount: 3,
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("7:反向样式:"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              spacing: 20,
              textDirection: TextDirection.rtl,
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("8:垂直反向样式:(可形成cell样式)"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              spacing: 10,
              textDirection: TextDirection.rtl,
              direction: Axis.vertical,
              onChanged: (items) {
                print("onChanged: $items");
              },
            ),
            _buildTitle("9:文字不可点击"),
            GleamCheckBox(
              [CheckBean("选项一"), CheckBean("选项二")],
              labelDisabled: true,
            ),
          ],
        ),
      ),
    );
  }

  _buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(text ?? ""),
    );
  }
}

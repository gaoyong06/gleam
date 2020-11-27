/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';
import 'package:gleam_example/widgets/group_title.dart';
import 'package:oktoast/oktoast.dart';

/// SearchPage搜索示例程序
class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search 搜索",
          style: Style.bold18ColorFFFFFF,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupTitle(
              title: "基础用法",
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            Search(),
            GroupTitle(
              title: "事件监听",
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            Search(
              controller: textEditingController,
              rightWidget: TextButton(
                onPressed: () {
                  //TODO: 后面得关闭按钮没有隐藏
                  textEditingController.text = "";
                  showToast("取消");
                },
                child: Text(
                  "取消",
                  style: Style.normal14Color323233,
                ),
              ),
            ),
            GroupTitle(
              title: "搜索框内容对齐",
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            Search(
              textAlign: TextAlign.center,
            ),
            GroupTitle(
              title: "禁用搜索框",
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            Search(
              disabled: true,
            ),
            GroupTitle(
              title: "自定义背景色",
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            Search(
              height: 54.0,
              bgColor: Color(0XFF4FC08D),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              radius: 27.0,
            ),
            GroupTitle(
              title: "自定义按钮",
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            ),
            Search(
              prefix: Container(
                child: Row(
                  children: [
                    //TODO:  感觉文字上下有Padding
                    Text(
                      '地址',
                      style: Style.normal14Color323233,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.search,
                      size: 20.0,
                      color: AppColors.clC8C9CC,
                    )
                  ],
                ),
              ),
              rightWidget: TextButton(
                  onPressed: () {
                    showToast("搜索");
                  },
                  child: Text(
                    "搜索",
                    style: Style.normal14Color323233,
                  )),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}

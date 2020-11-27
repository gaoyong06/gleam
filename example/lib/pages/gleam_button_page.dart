/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';
import 'package:gleam_example/widgets/group_title.dart';
import 'package:oktoast/oktoast.dart';

/// GleamButtonPage填充按钮示例程序
class GleamButtonPage extends StatefulWidget {
  GleamButtonPage({Key key}) : super(key: key);

  @override
  _GleamButtonPageState createState() => _GleamButtonPageState();
}

class _GleamButtonPageState extends State<GleamButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GleamButton 按钮",
          style: Style.bold18ColorFFFFFF,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupTitle(
              title: "按钮风格",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            Row(
              children: [
                GleamButton(
                  style: GleamButtonStyle.flatButton,
                  text: '填充按钮',
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('内容填充按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  style: GleamButtonStyle.outlineButton,
                  text: '细边框按钮',
                  width: 114.0,
                  textColor: AppColors.cl333333,
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('细边框按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  style: GleamButtonStyle.textButton,
                  text: '文字按钮',
                  textColor: AppColors.cl5791F3,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('文字按钮');
                  },
                ),
              ],
            ),
            GroupTitle(
              title: "按钮类型",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            Row(
              children: [
                //主要按钮
                GleamButton(
                  text: '主要按钮',
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('主要按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                //信息按钮
                GleamButton(
                  text: '信息按钮',
                  type: ButtonType.info,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('信息按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),

                //默认按钮
                GleamButton(
                  text: '默认按钮',
                  type: ButtonType.defaulted,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('默认按钮');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                //警告按钮
                GleamButton(
                  text: '警告按钮',
                  type: ButtonType.warning,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('警告按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                //危险按钮
                GleamButton(
                  text: '危险按钮',
                  type: ButtonType.danger,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('危险按钮');
                  },
                ),
              ],
            ),
            GroupTitle(
              title: "加载状态",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            Row(
              children: [
                //加载状态(文字+loading图标)
                GleamButton(
                  text: '加载中...',
                  width: 112.0,
                  height: 44.0,
                  type: ButtonType.primary,
                  leftIcon: CupertinoActivityIndicator(),
                  onPressed: () {
                    showToast('加载状态(loading图标+文字)');
                  },
                ),

                SizedBox(
                  width: 16.0,
                ),

                //加载状态(loading图标)
                GleamButton(
                  width: 52.0,
                  height: 44.0,
                  type: ButtonType.primary,
                  leftIcon: CupertinoActivityIndicator(),
                  onPressed: () {
                    showToast('加载状态(loading图标)');
                  },
                ),
              ],
            ),
            GroupTitle(
              title: "按钮形状",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            Row(
              children: [
                GleamButton(
                  borderRadius: 0,
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  text: "方形按钮",
                  onPressed: () {
                    showToast('方形按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  borderRadius: 22.0,
                  width: 88.0,
                  height: 44.0,
                  text: "圆形按钮",
                  fillColor: const Color(0xff07c160),
                  onPressed: () {
                    showToast('圆角按钮');
                  },
                ),
              ],
            ),
            GroupTitle(
              title: "按钮尺寸",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            GleamButton(
              type: ButtonType.primary,
              size: ButtonSize.large,
              text: "大号按钮",
              onPressed: () {
                showToast('大号按钮');
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                GleamButton(
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  text: "普通按钮",
                  onPressed: () {
                    showToast('普通按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  type: ButtonType.primary,
                  size: ButtonSize.small,
                  text: "小型按钮",
                  onPressed: () {
                    showToast('小型按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  type: ButtonType.primary,
                  size: ButtonSize.mini,
                  text: "迷你按钮",
                  onPressed: () {
                    showToast('迷你按钮');
                  },
                ),
              ],
            ),
            GroupTitle(
              title: "按钮阴影",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            Row(
              children: [
                GleamButton(
                  showShadow: false,
                  text: "主要按钮",
                  type: ButtonType.primary,
                  size: ButtonSize.normal,
                  onPressed: () {
                    showToast('主要按钮(无阴影)');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  showShadow: true,
                  shadowColor: const Color(0xff07c160),
                  type: ButtonType.primary,
                  size: ButtonSize.normal, //TODO:尺寸应该可以不用设置
                  text: "主要按钮",
                  onPressed: () {
                    showToast('主要按钮(有阴影)');
                  },
                ),
              ],
            ),
            GroupTitle(
              title: "禁用状态",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            GleamButton(
              showShadow: true,
              size: ButtonSize.normal,
              disableColor: AppColors.clD8D8D8,
              disableTextColor: AppColors.cl999999,
              borderColor: AppColors.clD8D8D8,
              text: "禁用状态",
              onPressed: null,
            ),
            GroupTitle(
              title: "自定义颜色",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
            ),
            Row(
              children: [
                GleamButton(
                  showShadow: true,
                  size: ButtonSize.normal,
                  fillColor: Color(0XFF7232DD),
                  text: "单色按钮",
                  onPressed: () {
                    showToast('单色按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  style: GleamButtonStyle.outlineButton,
                  showShadow: true,
                  size: ButtonSize.normal,
                  fillColor: Color(0XFF7232DD),
                  text: "单色按钮",
                  textColor: Color(0XFF7232DD),
                  onPressed: () {
                    showToast('单色按钮');
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                GleamButton(
                  width: 100,
                  showShadow: true,
                  size: ButtonSize.normal,
                  fillColor: Colors.transparent,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1, 0),
                      end: Alignment(1.0, 0),
                      colors: <Color>[
                        const Color(0xFFFF6034),
                        const Color(0xFFEE0A24),
                      ],
                    ),
                  ),
                  text: "渐变色按钮",
                  onPressed: () {
                    showToast('渐变色按钮');
                  },
                ),
              ],
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

/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/app_colors.dart';
import 'package:gleam/style/style.dart';
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
      appBar: AppBar(
        title: Text(
          "Tag",
          style: Style.bold18ColorFFFFFF,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: ListTile.divideTiles(context: context, tiles: [
          //基础用法
          ListTile(
            title: Text(
              'primary类型',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              type: TagType.primary,
              plain: true,
              round: true,
              text: "标签",
            ),
          ),
          ListTile(
            title: Text(
              'info类型',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              type: TagType.info,
            ),
          ),
          ListTile(
            title: Text(
              'defaulted类型',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              type: TagType.defaulted,
            ),
          ),
          ListTile(
            title: Text(
              'warning类型',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              type: TagType.warning,
            ),
          ),
          ListTile(
            title: Text(
              'danger类型',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              type: TagType.danger,
            ),
          ),
          //样式风格
          ListTile(
            title: Text(
              '空心样式',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: false,
              round: true,
              text: "标签",
              textStyle: Style.normal12Color1989FA,
              type: TagType.info,
            ),
          ),

          ListTile(
            title: Text(
              '圆角样式',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              type: TagType.info,
              radius: 10,
            ),
          ),

          ListTile(
            title: Text(
              '标记样式',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              text: "标签",
              type: TagType.info,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                side: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          ListTile(
            title: Text(
              '可关闭标签',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
                plain: true,
                round: true,
                text: "标签",
                type: TagType.info,
                deleteIcon:
                    Icon(Icons.close, color: AppColors.clFFFFFF, size: 12.0),
                onDeleted: () {
                  showToast("删除");
                }),
          ),

          //标签大小
          ListTile(
            title: Text(
              '小号标签',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              type: TagType.info,
            ),
          ),
          ListTile(
            title: Text(
              '中号标签',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
              plain: true,
              round: true,
              text: "标签",
              type: TagType.info,
            ),
          ),
          ListTile(
            title: Text(
              '大号标签',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              plain: true,
              round: true,
              text: "标签",
              type: TagType.info,
            ),
          ),

          //自定义颜色
          ListTile(
            title: Text(
              '背景颜色',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              backgroundColor: Color(0xFF7232DD),
            ),
          ),

          ListTile(
            title: Text(
              '文字颜色',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: true,
              round: true,
              text: "标签",
              backgroundColor: Color(0XFFFFE1E1),
              textStyle: TextStyle(
                fontSize: 12.0,
                color: Color(0XFFAD0000),
              ),
            ),
          ),

          ListTile(
            title: Text(
              '空心颜色',
              style: Style.normal15Color333333,
            ),
            trailing: Tag(
              plain: false,
              round: true,
              text: "标签",
              backgroundColor: Color(0XFF7232DD),
              borderColor: Color(0XFF7232DD),
              textStyle: TextStyle(
                fontSize: 12.0,
                color: Color(0XFF7232DD),
              ),
            ),
          ),
        ]).toList(),
      ),
    );
  }
}

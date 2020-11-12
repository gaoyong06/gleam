/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-10 20:18:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-10 20:18:23
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';
import 'package:oktoast/oktoast.dart';

///GleamDialogPage弹出模态框示例程序
class GleamDialogPage extends StatefulWidget {
  GleamDialogPage({Key key}) : super(key: key);

  @override
  _GleamDialogPageState createState() => _GleamDialogPageState();
}

class _GleamDialogPageState extends State<GleamDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'GleamDialog弹出框',
        style: Style.ts_FFFFFF_18_bold,
      )),
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
                GleamDialog.alert(context,
                    title: "标题",
                    titleStyle: Style.ts_333333_15_bold,
                    description: "眼里长着阳光，笑里全是坦荡",
                    text1: "确定", onTap1: () {
                  showToast('确定');
                });
              }),
          ListTile(
              title: Text(
                '提示弹窗 (无标题)',
                style: Style.ts_333333_15,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              onTap: () {
                GleamDialog.alert(context,
                    description: "代码是写出来给人看的，附带能在机器上运行",
                    descriptionPadding:
                        EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 25.0),
                    text1: "确定", onTap1: () {
                  showToast('确定');
                });
              }),
          ListTile(
              title: Text(
                '确认弹窗',
                style: Style.ts_333333_15,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              onTap: () {
                GleamDialog.confirm(
                  context,
                  title: "标题",
                  description: "眼里长着阳光，笑里全是坦荡",
                  height: 45.0,
                  withDivider: true,
                  text1: "取消",
                  onTap1: () {
                    showToast('取消');
                  },
                  text2: "确定",
                  onTap2: () {
                    showToast('确定');
                  },
                );
              }),

          ListTile(
              title: Text(
                '提示弹窗（圆角按钮）',
                style: Style.ts_333333_15,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              onTap: () {
                GleamDialog.alert(context,
                    isRound: true,
                    color: Colors.blueAccent,
                    title: "标题",
                    titleStyle: Style.ts_333333_15_bold,
                    description: "眼里长着阳光，笑里全是坦荡",
                    height: 38.0,
                    text1: "确定",
                    textStyle1: Style.ts_FFFFFF_13, onTap1: () {
                  showToast('确定');
                });
              }),

          ListTile(
              title: Text(
                '自定义弹窗内部组件内容',
                style: Style.ts_333333_15,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              onTap: () {
                GleamDialog.alert(context,
                    title: "",
                    titleStyle: Style.ts_333333_15_bold,
                    description: GleamImage(
                      image:
                          "https://ww1.sinaimg.cn/bmiddle/aaa535b8gy1gkl7fsq8xjj215o1jhqe4.jpg",
                      fit: BoxFit.cover,
                    ),
                    descriptionPadding: EdgeInsets.all(0),
                    text1: "关闭", onTap1: () {
                  showToast('确定');
                });
              }),
        ]).toList(),
      ),
    );
  }
}

/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';
import 'package:oktoast/oktoast.dart';

///BottomSheet底部菜单弹窗
class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'BottomSheet底部菜单弹窗',
        style: Style.ts_FFFFFF_18_bold,
      )),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        children: ListTile.divideTiles(context: context, tiles: [
          //基础用法
          ListTile(
            title: Text('基础用法'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              showGleamBottomSheet(context, actions: [
                BottomSheetAction('选项一', onTap: () {
                  showToast('选项一');
                }),
                BottomSheetAction('选项二', hiddenDivider: true, onTap: () {
                  showToast('选项二');
                }),
              ]);
            },
          ),

          //展示取消按钮
          ListTile(
            title: Text('展示取消按钮'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              showGleamBottomSheet(
                context,
                actions: [
                  BottomSheetAction('选项一', onTap: () {
                    showToast('选项一');
                  }),
                  BottomSheetAction(
                    '选项二',
                    hiddenDivider: true,
                    onTap: () {
                      showToast('选项二');
                    },
                  ),
                ],
                cancelText: '取消',
                onCancelTap: () {
                  showToast('取消');
                },
              );
            },
          ),

          //展示描述信息
          ListTile(
            title: Text('展示描述信息'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              showGleamBottomSheet(
                context,
                actions: [
                  BottomSheetAction('选项一', onTap: () {
                    showToast('选项一');
                  }),
                  BottomSheetAction(
                    '选项二',
                    hiddenDivider: true,
                    onTap: () {
                      showToast('选项二');
                    },
                  ),
                ],
                description: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  height: 60.0,
                  child: Text(
                    '这是描述信息',
                    style: Style.ts_999999_15,
                  ),
                ),
                cancelText: '取消',
                onCancelTap: () {
                  showToast('取消');
                },
              );
            },
          ),

          //选项状态
          ListTile(
            title: Text('选项状态'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              showGleamBottomSheet(
                context,
                actions: [
                  BottomSheetAction(
                      Text(
                        '着色选项',
                        style: Style.ts_FF0000_15,
                      ), onTap: () {
                    showToast('着色状态');
                  }),
                  BottomSheetAction(
                    Text(
                      '禁用选项',
                      style: Style.ts_999999_15,
                    ),
                    onTap: null,
                  ),
                  BottomSheetAction(
                    CupertinoActivityIndicator(),
                    hiddenDivider: true,
                    onTap: () {
                      showToast('loading...');
                    },
                  ),
                ],
                cancelText: '取消',
                onCancelTap: () {
                  showToast('取消');
                },
              );
            },
          ),

          //自定义面板
          ListTile(
            title: Text('自定义面板'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              showGleamBottomSheet(
                context,
                // actions: [],
                contentWidget: Container(
                  height: 200.0,
                  child: Center(
                    child: Text('内容'),
                  ),
                ),
              );
            },
          ),
        ]).toList(),
      ),
    );
  }
}

/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-05 17:30:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-05 17:30:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/r.dart';
import 'package:gleam/style/dimens.dart';
import 'package:gleam/style/style.dart';

///
/// 结果为空页面
/// 可传入指定文案
/// 可传入空图片
///
///     叶子img
///     暂无内容
///
class Empty extends StatelessWidget {
  //
  final dynamic imgPath;
  //描述文字
  final String emptyText;
  //底部控件
  final Widget bottomWidget;

  Empty({this.imgPath, this.emptyText, this.bottomWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(53)),
      child: Column(
        children: [
          GleamImage(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setWidth(120),
            image: imgPath ?? R.assetsImagesBgEmpty,
          ),
          SizedBox(height: ScreenUtil().setWidth(Dimens.gapDp20)),
          Text(emptyText ?? "暂无内容", style: Style.ts_999999_14),
          SizedBox(height: ScreenUtil().setWidth(Dimens.gapDp20)),
          bottomWidget ?? Container()
        ],
      ),
    );
  }
}

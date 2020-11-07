/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-04 13:36:23
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-04 13:36:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gleam/style/style.dart';

///底部上拉菜单
showBottomSheet(BuildContext context, List<Widget> itemList) {
  List<Widget> list = itemList;
  list.add(Container(color: Color(0xffF0F0F0), height: 5.w));
  list.add(BottomSheetAction('取消', hiddenLine: true));

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Color(0xb2000000),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list,
        ),
      );
    },
  );
}

class BottomSheetAction extends StatelessWidget {
  //string / widget
  final dynamic item;
  final double height;
  final GestureTapCallback onTap;
  final bool hiddenLine;

  BottomSheetAction(this.item,
      {this.onTap, this.height = 50, this.hiddenLine = false});

  @override
  Widget build(BuildContext context) {
    var title;
    if (item is String) {
      title = Text(
        item,
        style: Style.ts_333333_15,
      );
    } else if (item is Widget) {
      title = item;
    } else {
      title = Container();
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (onTap != null) onTap();
      },
      child: Container(
        height: height.w,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            title,
            Align(
              alignment: Alignment.bottomCenter,
              child: Offstage(
                offstage: hiddenLine,
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0x4dd8d8d8),
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

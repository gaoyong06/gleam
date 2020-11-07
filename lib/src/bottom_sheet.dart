/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-04 13:36:23
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-04 13:36:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gleam/style/style.dart';
import 'package:string_validator/string_validator.dart';

///底部上拉菜单
showGleamBottomSheet(
  BuildContext context, {
  List<Widget> actions,
  Widget contentWidget,
  dynamic description,
  String cancelText,
  GestureTapCallback onCancelTap,
}) {
  List<Widget> list = [];

  //描述信息
  if (description != null) {
    list.add(description);
    list.add(Container(
      height: 1,
      decoration: BoxDecoration(
        color: Color(0x4dd8d8d8),
        borderRadius: BorderRadius.all(Radius.circular(1)),
      ),
    ));
  }

  //选择项列表
  if (actions is List && actions.length > 0) {
    list.addAll(actions);
  }

  //取消
  if (!isNull(cancelText)) {
    list.add(Container(color: Color(0xffF0F0F0), height: 5.w));
    list.add(
        BottomSheetAction(cancelText, onTap: onCancelTap, hiddenDivider: true));
  }

  Widget bodyWidget = Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: list,
  );

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
        child: contentWidget ?? bodyWidget,
      );
    },
  );
}

class BottomSheetAction extends StatelessWidget {
  //string / widget
  final dynamic item;
  final double height;
  final GestureTapCallback onTap;
  final bool hiddenDivider;

  BottomSheetAction(this.item,
      {this.onTap, this.height = 50, this.hiddenDivider = false});

  @override
  Widget build(BuildContext context) {
    var action;
    if (item is String) {
      action = Text(
        item,
        style: Style.ts_333333_15,
      );
    } else if (item is Widget) {
      action = item;
    } else {
      action = Container();
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
            action,
            Align(
              alignment: Alignment.bottomCenter,
              child: Offstage(
                offstage: hiddenDivider,
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

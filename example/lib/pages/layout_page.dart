/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';

/// Layout 布局
class LayoutPage extends StatelessWidget {
  const LayoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: SingleChildScrollView(
      // child: Column(
      //   //测试Row对齐方式,排除Column默认居中对齐的干扰
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     CellGroupTitle(title: "线性布局(Row、Column)"),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(" hello world "),
      //         Text(" I am gaoyong "),
      //       ],
      //     ),
      //     Row(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(" hello world "),
      //         Text(" I am gaoyong "),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       textDirection: TextDirection.rtl,
      //       children: [
      //         Text(" hello world "),
      //         Text(" I am gaoyong "),
      //       ],
      //     ),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       verticalDirection: VerticalDirection.up,
      //       children: [
      //         Text(
      //           " hello world ",
      //           style: TextStyle(fontSize: 30.0),
      //         ),
      //         Text(" I am gaoyong "),
      //       ],
      //     )
      //   ],
      // ),

      // child: ConstrainedBox(
      //   constraints: BoxConstraints(minWidth: double.infinity),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(" hello world "),
      //       Text(" I am gaoyong "),
      //     ],
      //   ),
      // ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(" hello world "),
      //       Text(" I am gaoyong "),
      //     ],
      //   ),
      // ),
      // body: Container(
      //   color: Colors.green,
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
      //       children: <Widget>[
      //         Container(
      //           color: Colors.red,
      //           child: Column(
      //             mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
      //             children: <Widget>[
      //               Text("hello world "),
      //               Text("I am Jack "),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      // ),

      //方法一
      // body: ConstrainedBox(
      //   constraints: BoxConstraints(minWidth: double.infinity),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("hello world "),
      //       Text("I am gaoyong "),
      //     ],
      //   ),
      // ),

      //方法二
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("hello world "),
      //       Text("I am gaoyong "),
      //     ],
      //   ),
      // ),

      //方法三
      // body: Align(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("hello world "),
      //       Text("I am gaoyong "),
      //     ],
      //   ),
      // ),

      //方法四
      // body: SizedBox(
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("hello world "),
      //       Text("I am gaoyong "),
      //     ],
      //   ),
      // ),

      //方法五
      // body: Stack(
      //   children: [
      //     Positioned(
      //       left: 0,
      //       top: 0,
      //       right: 0,
      //       bottom: 0,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text("hello world "),
      //           Text("I am gaoyong "),
      //         ],
      //       ),
      //     )
      //   ],
      // ),

      //方法六
      // body: Stack(
      //   children: [
      //     Positioned.fill(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text("hello world "),
      //           Text("I am gaoyong "),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

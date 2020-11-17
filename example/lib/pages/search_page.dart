/*
 * @Author: gaoyong06@qq.com
 * @Date: 2020-11-06 14:08:23 
 * @Last Modified by: gaoyong06@qq.com
 * @Last Modified time: 2020-11-06 14:08:23
 */

import 'package:flutter/material.dart';
import 'package:gleam/gleam.dart';
import 'package:gleam/style/style.dart';
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
          style: Style.ts_FFFFFF_18_bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Text(
              "基础用法",
              style: Style.ts_66455A64_14,
            ),
            SizedBox(
              height: 16.0,
            ),
            Search(),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "事件监听",
              style: Style.ts_66455A64_14,
            ),
            SizedBox(
              height: 16.0,
            ),
            Search(
              controller: textEditingController,
              rightIcon: SizedBox(
                height: 44.0,
                child: TextButton(
                  onPressed: () {
                    //TODO: 后面得关闭按钮没有隐藏
                    textEditingController.text = "";
                    showToast("取消");
                  },
                  child: Text(
                    "取消",
                    style: Style.ts_323233_14,
                  ),
                ),
              ),

              // InkWell(
              //   onTap: () {
              //     // _controller?.text = "";
              //     // setState(() {
              //     //   _showDelete = false;
              //     // });
              //     showToast("取消");
              //   },
              //   child: Text(
              //     "取消",
              //     style: Style.ts_323233_14,
              //   ),
              // ),
              //   offstage: false,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

// Offstage(
//           child: InkWell(
//             onTap: () {
//               _controller?.text = "";
//               setState(() {
//                 _showDelete = false;
//               });
//             },
//             child: widget.rightIcon,
//           ),
//           offstage: !_showDelete,
//         )
